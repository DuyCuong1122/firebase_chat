import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_chat/common/values/colors.dart';
import 'package:firebase_chat/common/values/shadows.dart';
import 'package:firebase_chat/common/widgets/app.dart';
import 'package:firebase_chat/common/widgets/button.dart';
import 'package:firebase_chat/pages/contact/controller.dart';
import 'package:firebase_chat/pages/contact/widgets/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar buildAppBar() {
      return transparentAppBar(
          title: Text(
        "Contact",
        style: TextStyle(
            color: AppColors.primaryBackground,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600),
      ));
    }

    return Scaffold(
      appBar: buildAppBar(),
      body: const ContactList(),
    );
  }
}
