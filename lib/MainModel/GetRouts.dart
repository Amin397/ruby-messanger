
import 'package:get/get.dart';

import '../Screens/Splash/View/splash_screen.dart';

class NameRouts{
  static const String splashScreen = '/splash';
}


class PageRout{
  static List<GetPage> pages = [
    GetPage(name: NameRouts.splashScreen, page: ()=> SplashScreen()),
  ];
}