import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ye_app/app/views/features/building%20instructions/widgets/model_card.dart';
import 'package:ye_app/app/views/widgets/colors.dart';
import 'package:ye_app/app/views/widgets/drawer.dart';

class LessonPlanDetailScreen extends StatefulWidget {
  final dynamic listData;
  const LessonPlanDetailScreen({super.key, this.listData});

  @override
  State<LessonPlanDetailScreen> createState() => _LessonPlanDetailScreenState();
}

class _LessonPlanDetailScreenState extends State<LessonPlanDetailScreen> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 0,
          backgroundColor: Color.fromRGBO(145, 181, 8, 1),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Hi'), Text('Deepesh@Youngengineers.org')],
          ),
      
          
        ),
        body: SafeArea(
          child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg.jpg'))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.home_filled,
                                  color: primaryColor,
                                  size: 40,
                                )),
                            Text('')
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(
                                Icons.arrow_circle_left_outlined,
                                color: primaryColor,
                                size: 40,
                              ),
                            ),
                            Text('Lesson Plan')
                          ],
                        )
                      ],
                    ),
                    // Center(
                    //   child: Image.network(
                    //     widget.listData['programLogo'],
                    //     height: height * 0.12,
                    //   ),
                    // ),
                    // Container(
                    //   height: height * 0.68,
                    //   child: ModelCard(

                    //       views: 7690,
                    //       heading: 'Catapult',
                    //       imagePath: 'assets/images/Catapult.jpg'),
                    // )
                  ])),
        ));
  }
}
