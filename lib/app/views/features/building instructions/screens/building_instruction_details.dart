// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ye_app/app/controllers/data_controller.dart';
import 'package:ye_app/app/views/features/building%20instructions/screens/model_detail.dart';
import 'package:ye_app/app/views/features/building%20instructions/widgets/model_card.dart';
import 'package:ye_app/app/views/widgets/colors.dart';
import 'package:ye_app/app/views/widgets/drawer.dart';

class BuildingInstructionDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> listData;
  const BuildingInstructionDetailsScreen({super.key, required this.listData});

  @override
  State<BuildingInstructionDetailsScreen> createState() =>
      _BuildingInstructionDetailsScreenState();
}

class _BuildingInstructionDetailsScreenState
    extends State<BuildingInstructionDetailsScreen> {
  List<Map<String, dynamic>> listModel = [];
  DataController dataController = DataController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  bool isLoading = false;

  void getData() async {
    setState(() {
      isLoading = true;
    });
    listModel =
        await dataController.getModelData(id: widget.listData['id'].toString());
    setState(() {
      isLoading = false;
    });
    // print(listModel);
  }

  // final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey();

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
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    widget.listData['programMobileBI'],
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.home_filled,
                        color: primaryColor,
                        size: 40,
                      ),
                      Text('')
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_circle_left_outlined,
                            color: primaryColor,
                            size: 40,
                          )),
                      Text('Select Model')
                    ],
                  )
                ],
              ),
              Center(
                child:
                    //  Image.asset('assets/images/pm1.png',height: height * 0.12 ,),
                    Image.network(
                  widget.listData['programLogo'],
                  height: height * 0.12,
                ),
              ),
              Expanded(
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: listModel.length,
                          itemBuilder: (context, index) {
                            final item = listModel[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => ModelDetailScreen(
                                    listImage: item['listImages']));
                              },
                              child: ModelCard(
                                  headerPath: widget.listData['legoLogo'],
                                  views: "6960",
                                  heading: item['title'],
                                  imagePath: item['smallImage']),
                            );
                          },
                        ))
              // Expanded(
              //   child: DefaultTabController(
              //     length: 2,
              //     child: Column(
              //       children: <Widget>[
              //         Stack(
              //           children: [
              //             ButtonsTabBar(
              //               backgroundColor: green,
              //               unselectedBackgroundColor: Colors.transparent,
              //               unselectedLabelStyle:
              //                   TextStyle(color: Colors.black),
              //               labelStyle: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold),
              //               tabs: [
              //                 Tab(
              //                   text: "Main Models",
              //                 ),
              //                 Tab(
              //                   text: "Experimental Models",
              //                 ),
              //               ],
              //             ),
              //             Positioned(
              //               top: 40,
              //               left: 6,
              //               right: 6,
              //               child: Container(
              //                 color: green,
              //                 width: width,
              //                 height: 2,
              //               ),
              //             ),
              //           ],
              //         ),
              //         Expanded(
              //           child: TabBarView(
              //             children: <Widget>[
              //               ModelCard(
              //                   views: 7690,
              //                   heading: 'Catapult',
              //                   imagePath: 'assets/images/Catapult.jpg'),
              //               ModelCard(
              //                   views: 7069,
              //                   heading: 'Force',
              //                   imagePath: 'assets/images/Catapult.jpg'),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
