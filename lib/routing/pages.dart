import 'package:boat_co/pages/authentication/login.dart';
import 'package:boat_co/pages/authentication/registration.dart';
import 'package:boat_co/pages/details_page.dart';
import 'package:boat_co/pages/home.dart';
import 'package:boat_co/splashPage.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => RegistrationView(),
    ),
    GetPage(
      name: Routes.DETAILPAGE,
      page: () => DetailsView(),
    ),
  ];
}

// write access only to customers, checkout sessions and customer portal 
// read only for subscriptions and plans