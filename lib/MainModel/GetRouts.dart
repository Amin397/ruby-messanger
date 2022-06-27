
import 'package:get/get.dart';
import 'package:rubymessanger/Screens/CompleteProfile/View/complete_profile_screen.dart';

import '../Screens/ChatProfile/Screen/single_profile_screen.dart';
import '../Screens/Home/View/home_screen.dart';
import '../Screens/Intro/View/intro_screen.dart';
import '../Screens/RegisterLogin/View/register_login_screen.dart';
import '../Screens/SingleChat/View/single_chat_screen.dart';
import '../Screens/Splash/View/splash_screen.dart';

class NameRouts{
  static const String splash = '/splash';
  static const String home = '/home';
  static const String singleChat = '/singleChat';
  static const String singleProfile = '/singleProfile';
  static const String intro = '/intro';
  static const String registerLogin = '/registerLogin';
  static const String completeProfile = '/completeProfile';
}


class PageRout{
  static List<GetPage> pages = [
    GetPage(name: NameRouts.splash, page: ()=> SplashScreen()),
    GetPage(name: NameRouts.home, page: ()=> HomeScreen() , transition: Transition.fade,),
    GetPage(name: NameRouts.singleChat, page: ()=> SingleChatScreen()),
    GetPage(name: NameRouts.singleProfile, page: ()=> SingleProfileScreen()),
    GetPage(name: NameRouts.intro, page: ()=> IntroScreen()),
    GetPage(name: NameRouts.registerLogin, page: ()=> RegisterLoginScreen()),
    GetPage(name: NameRouts.completeProfile, page: ()=> CompleteProfileScreen()),
  ];
}