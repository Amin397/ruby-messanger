import 'package:get/get.dart';
import 'package:rubymessanger/Screens/CompleteProfile/View/complete_profile_screen.dart';
import 'package:rubymessanger/Screens/ContactProfile/View/contact_profile_screen.dart';
import 'package:rubymessanger/Screens/EditProfile/View/edit_profile_screen.dart';

import '../Screens/ChatProfile/Screen/single_profile_screen.dart';
import '../Screens/Home/View/home_screen.dart';
import '../Screens/Intro/View/intro_screen.dart';
import '../Screens/NewChat/View/new_chat_screen.dart';
import '../Screens/RegisterLogin/View/register_login_screen.dart';
import '../Screens/SingleChat/View/single_chat_screen.dart';
import '../Screens/Splash/View/splash_screen.dart';

class NameRouts {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String singleChat = '/singleChat';
  static const String singleProfile = '/singleProfile';
  static const String intro = '/intro';
  static const String registerLogin = '/registerLogin';
  static const String completeProfile = '/completeProfile';
  static const String editProfile = '/editProfile';
  static const String newChat = '/newChat';
  static const String contactProfile = '/contactProfile';
}

class PageRout {
  static List<GetPage> pages = [
    GetPage(
      name: NameRouts.splash,
      page: () => SplashScreen(),

      transition: Transition.fade,
    ),
    GetPage(
      name: NameRouts.contactProfile,
      page: () => ContactProfileScreen(),

      transition: Transition.fade,
    ),
    GetPage(
      name: NameRouts.home,
      page: () => HomeScreen(),

      transition: Transition.fade,
    ),
    GetPage(
      name: NameRouts.singleChat,
      page: () => SingleChatScreen(),

      transition: Transition.fade,
    ),
    GetPage(
      name: NameRouts.singleProfile,
      page: () => SingleProfileScreen(),

      transition: Transition.fade,
    ),
    GetPage(
      name: NameRouts.intro,
      page: () => IntroScreen(),

      transition: Transition.fade,
    ),
    GetPage(
      name: NameRouts.newChat,
      page: () => NewChatScreen(),

      transition: Transition.fade,
    ),
    GetPage(
      name: NameRouts.registerLogin,
      page: () => RegisterLoginScreen(),

      transition: Transition.fade,
    ),
    GetPage(
      name: NameRouts.completeProfile,
      page: () => CompleteProfileScreen(),

      transition: Transition.fade,
    ),
    GetPage(
      name: NameRouts.editProfile,
      page: () => EditProfileScreen(),

      transition: Transition.fade,
    ),
  ];
}
