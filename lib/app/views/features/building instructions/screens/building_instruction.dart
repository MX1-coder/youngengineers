// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ye_app/app/controllers/data_controller.dart';
import 'package:ye_app/app/routes/pages.dart';
import 'package:ye_app/app/routes/routes.dart';
import 'package:ye_app/app/views/features/building%20instructions/screens/building_instruction_details.dart';
import 'package:ye_app/app/views/widgets/drawer.dart';

class BuildingInstructionScreen extends StatefulWidget {
  const BuildingInstructionScreen({super.key});

  @override
  State<BuildingInstructionScreen> createState() =>
      _BuildingInstructionScreenState();
}

class _BuildingInstructionScreenState extends State<BuildingInstructionScreen> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  DataController dataController = DataController();
  List<Map<String, dynamic>> listData = [];

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
    listData = await dataController.getData();
    setState(() {
      isLoading = false;
    });
    // print(listData);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      //    key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Color.fromRGBO(145, 181, 8, 1),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Hi'), Text('Deepesh@Youngengineers.org')],
        ),
      ),
      // endDrawer: CustomDrawer(),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Select Program',
                style: TextStyle(color: Colors.blue.shade900, fontSize: 20),
              ),
            ),
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: listData.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final item = listData[index];
                        return GestureDetector(
                          onTap: () =>
                              Get.to(() => BuildingInstructionDetailsScreen(
                                    listData: item,
                                  )),
                          // Pages().goToBuildingDetailScreen(item),
                          child: Container(
                              height: height * 0.3,
                              width: width * 0.85,
                              decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  ),
                              child: Container(
                                height: height * 0.3,
                                width: width * 0.85,
                                // color: Colors.amber,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: width * 0.85,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  //AssetImage('assets/images/hd.png'),
                                                  NetworkImage(
                                                      item['legoLogo']))),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            item['title'],
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        // margin:EdgeInsets.all(5),
                                        width: width * 0.83,
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                        child:
                                            //   Image.asset('assets/images/pm1.png')
                                            Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: CachedNetworkImage(
                                            height: height * 0.2,
                                            filterQuality: FilterQuality.high,
                                            fit: BoxFit.fitHeight,
                                            imageUrl: item['programLogo'],
                                            // placeholder: (context, url) =>
                                            //     Center(child: CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                        ),
                                        //     Image.network(
                                        //   item['programLogo'],
                                        // ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
