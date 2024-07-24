import 'package:firebase_chat/pages/application/controller.dart';
import 'package:firebase_chat/pages/massage/controller.dart';
import 'package:firebase_chat/pages/profile/controller.dart';

import 'package:get/get.dart';

import '../contact/controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
