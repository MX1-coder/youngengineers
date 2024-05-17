import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ye_app/app/views/features/building%20instructions/screens/model_detail.dart';
import 'package:ye_app/app/views/widgets/colors.dart';
import '/app/routes/routes.dart';

class ModelCard extends StatelessWidget {
  final String views;
  final String heading;
  final String imagePath;
  final String headerPath;
  const ModelCard(
      {super.key,
      required this.views,
      required this.heading,
      required this.imagePath,
      required this.headerPath});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
        height: height * 0.35,
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
                height: 70,
                width: width * 0.8,
                decoration: BoxDecoration(
                    // color: Colors.amber,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          headerPath,
                        ))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(color: Colors.white, fontSize: 17),
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
                    child: CachedNetworkImage(
                      // height: 300,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                      imageUrl: imagePath,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),

                    // Image.network(
                    //   imagePath,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
              ),
              Container(
                width: width * 0.8,
                height: 50,
                color: green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        views,
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
        ));
  }
}
