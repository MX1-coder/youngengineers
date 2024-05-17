import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ye_app/app/controllers/data_controller.dart';
import 'package:ye_app/app/routes/pages.dart';
import 'package:ye_app/app/routes/routes.dart';
import 'package:ye_app/app/views/features/lesson%20plan/screens/lesson_plan_details.dart';
import 'package:ye_app/app/views/widgets/drawer.dart';

class LessonPlanScreen extends StatefulWidget {
  const LessonPlanScreen({super.key});

  @override
  State<LessonPlanScreen> createState() => _LessonPlanScreenState();
}

class _LessonPlanScreenState extends State<LessonPlanScreen> {
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
              image:
                  DecorationImage(image: AssetImage('assets/images/bg.jpg'))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Lessons Plan',
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
                                Pages().goToLessonPlanDetailScreen(item),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
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
                                                  image: NetworkImage(
                                                      item['legoLogo']))),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              // margin:EdgeInsets.all(5),
                                              width: width * 0.83,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Image.network(
                                                item['programLogo'],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
