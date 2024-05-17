import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ye_app/app/views/widgets/colors.dart';
import '/app/routes/routes.dart';

class ModelCard extends StatelessWidget {
  final int views;
  final String heading;
  final String imagePath;
  const ModelCard(
      {super.key,
      required this.views,
      required this.heading,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Get.toNamed(RoutesClass.modelDetailScreen),
          child: Container(
              height: height * 0.33,
              width: width * 0.8,
              decoration: BoxDecoration(
                  // color: Colors.amber,
                  ),
              child: Container(
                height: height * 0.33,
                width: width * 0.8,
                // color: Colors.amber,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                          // color: Colors.amber,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/hd.png',
                              ))),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            heading,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: width * 0.8,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.8,
                      height: 45,
                      color: green,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              views.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
