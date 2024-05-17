// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ye_app/app/routes/pages.dart';
import 'package:ye_app/app/routes/routes.dart';
import 'package:ye_app/app/views/features/lesson%20plan/screens/lesson_plan.dart';
import 'package:ye_app/app/views/features/lesson%20plan/screens/lesson_plan_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Young Engineers',
      getPages: Pages.pages,
      initialRoute: RoutesClass.buildingInstructionScreen,
      // home: LessonPlanDetailScreen(
      //   listData: 5,
      // )
    );
  }
}
