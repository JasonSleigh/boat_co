// animated icon
import 'package:get/get.dart';

import '../models/ListingModel.dart';

const String boatAnimation = 'assets/icons/loading_boat.json';

// base url
const String baseUrl = 'http://localhost:8000/api/';

String accessToken = "";

var basketList = RxList<ListingModel>().obs;

