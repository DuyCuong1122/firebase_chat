import 'package:firebase_chat/common/routes/names.dart';
import 'package:firebase_chat/pages/welcome/state.dart';
import 'package:get/get.dart';

import '../../common/store/config.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();
  WelcomeController();
  changPage(int index) async {
    state.index.value = index;
  }

  handleSignin() async {
    await ConfigStore.to.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
}
