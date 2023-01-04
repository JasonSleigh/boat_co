<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;



class AuthController extends Controller
{
    public function login(Request $request){

        // Validate the incoming request
        $this->validate($request, [
            'email' => 'required|email|exists:users,email',
            'password' => 'required',
        ]);

        // Get the user credentials
        $credentials = $request->only('email', 'password');

        // Attempt to login the user
        if(!Auth::attempt($credentials)){
            return response()->json([
                'message' => 'Incorrect email or password'
            ], 401);
        }

        // Get the user
        $user = User::where('email', $request->email)->first();

        // Check if user has tokens for the device
        $tokens = $user->tokens()->where('name', $request->device_name)->get();

        if($tokens->count() > 0){
            // If the user has a token for the device, delete all tokens for the device
            $user->tokens()->where('name', $request->device_name)->delete();
        }

        // Generate a token for the user using the sanctum package and the device name
        $token = $user->createToken($request->device_name)->plainTextToken;

        // Check if the user wants to be remembered or not. If yes, then set the expiry date to 1 month from now else set it to 1 day from now
        $token_expires_at = $request->remember_me ? Carbon::now()->addMonth() : Carbon::now()->addDay();

        // Update the current token with the new expiry date
        $user->tokens()->where('name', $request->device_name)->update([
            'updated_at' => Carbon::now(),
            'expires_at' => $token_expires_at
        ]);

        // Return the token, expiry date and the user
        return response()->json([
            'token' => $token,
            'token_type' => 'Bearer',
            'expires_at' => Carbon::parse(
                $user->tokens()
                    ->where('name', $request->device_name)
                    ->first()->expires_at
            )->toDateTimeString(),
            'user' => $user
        ], 200);
    }

    // logout 
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'message' => 'Logged out'
        ]);
    }

// register
    public function register(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|confirmed',
        ]);

        $user = new User([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password)
        ]);

        $user->save();

        return response()->json([
            'message' => 'Successfully created user!'
        ], 201);
    }


    // delete user
    public function delete(Request $request)
    {
        $request->user()->delete();
        return response()->json([
            'message' => 'User deleted'
        ]);
    }
}
