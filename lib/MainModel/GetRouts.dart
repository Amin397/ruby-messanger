
import 'package:get/get.dart';

import '../Screens/Home/View/home_screen.dart';
import '../Screens/Splash/View/splash_screen.dart';

class NameRouts{
  static const String splash = '/splash';
  static const String home = '/home';
}


class PageRout{
  static List<GetPage> pages = [
    GetPage(name: NameRouts.splash, page: ()=> SplashScreen()),
    GetPage(name: NameRouts.home, page: ()=> HomeScreen()),
  ];
}