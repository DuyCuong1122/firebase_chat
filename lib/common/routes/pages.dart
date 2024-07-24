import 'package:firebase_chat/common/middlewares/middlewares.dart';
import 'package:firebase_chat/pages/application/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/application/bindings.dart';
import '../../pages/massage/chat/bindings.dart';
import '../../pages/massage/chat/view.dart';
import '../../pages/contact/bindings.dart';
import '../../pages/contact/view.dart';
import '../../pages/massage/photoview/bindings.dart';
import '../../pages/massage/photoview/view.dart';
import '../../pages/profile/bindings.dart';
import '../../pages/profile/view.dart';
import 'routes.dart';
import 'package:firebase_chat/pages/welcome/bindings.dart';
import 'package:firebase_chat/pages/welcome/view.dart';
import 'package:firebase_chat/pages/sign_in/bindings.dart';
import 'package:firebase_chat/pages/sign_in/view.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const APPlication = AppRoutes.Application;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => const WelcomePage(),
        binding: WelcomeBinding(),
        middlewares: [RouteWelcomeMiddleware(priority: 1)]),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),

    // check if needed to login or not
    GetPage(
      name: AppRoutes.Application,
      page: () => const ApplicationPage(),
      binding: ApplicationBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),

    // 最新路由
    // 首页
    GetPage(
        name: AppRoutes.Contact,
        page: () => const ContactPage(),
        binding: ContactBinding()),
    /*
    //消息
    GetPage(name: AppRoutes.Message, page: () => MessagePage(), binding: MessageBinding()),
    */
    GetPage(
        name: AppRoutes.Me,
        page: () => const ProfilePage(),
        binding: ProfileBinding()),

    GetPage(
        name: AppRoutes.Chat,
        page: () => const ChatPage(),
        binding: ChatBinding()),

    GetPage(
        name: AppRoutes.Photoimgview,
        page: () => const PhotoImageView(),
        binding: PhotoImageViewBinding()),
  ];
}
