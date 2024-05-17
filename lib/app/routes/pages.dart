import 'package:get/get.dart';
import 'package:ye_app/app/views/features/auth/screens/login.dart';
import 'package:ye_app/app/views/features/auth/screens/signup.dart';
import 'package:ye_app/app/views/features/building%20instructions/screens/building_instruction.dart';
import 'package:ye_app/app/views/features/building%20instructions/screens/building_instruction_details.dart';
import 'package:ye_app/app/views/features/building%20instructions/screens/model_detail.dart';
import 'package:ye_app/app/views/features/building%20instructions/screens/zoom_slider.dart';
import 'package:ye_app/app/views/features/lesson%20plan/screens/lesson_plan.dart';
import 'package:ye_app/app/views/features/lesson%20plan/screens/lesson_plan_details.dart';
import 'package:ye_app/app/views/features/student%20list/student.dart';
import './routes.dart';

class Pages {
  static final pages = [
    GetPage(name: RoutesClass.login, page: () => LoginScreen()),
    GetPage(name: RoutesClass.studentList, page: () => StudentScreen()),
    GetPage(name: RoutesClass.signUp, page: () => SignUpStudent()),
    GetPage(
        name: RoutesClass.buildingInstructionScreen,
        page: () => BuildingInstructionScreen()),
    GetPage(
        name: RoutesClass.buildingInstructionDetailsScreen,
        page: () {
          final args = Get.arguments;
          return BuildingInstructionDetailsScreen(listData: args);
        }),
    GetPage(
        name: RoutesClass.lessonPlanDetailScreen,
        page: () {
          final args = Get.arguments;
          return LessonPlanDetailScreen(
            listData: args,
          );
        }),
    GetPage(name: RoutesClass.lessonPlanScreen, page: () => LessonPlanScreen()),
    GetPage(
        name: RoutesClass.modelDetailScreen, page: () => ModelDetailScreen(listImage: [],)),
  ];
  void goToLessonPlanDetailScreen(dynamic arg) {
    Get.to(() => LessonPlanDetailScreen(listData: arg));
  }

  void goToBuildingDetailScreen(dynamic arg) {
    Get.to(() => BuildingInstructionDetailsScreen(listData: arg));
  }
}
