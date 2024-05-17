import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ye_app/app/views/features/building%20instructions/screens/zoom_slider.dart';
import 'package:ye_app/app/views/features/building%20instructions/widgets/model_slider.dart';
import 'package:ye_app/app/views/widgets/colors.dart';
import 'package:ye_app/app/views/widgets/drawer.dart';

class ModelDetailScreen extends StatefulWidget {
  final List<dynamic> listImage;
  const ModelDetailScreen({super.key, required this.listImage});

  @override
  State<ModelDetailScreen> createState() => _ModelDetailScreenState();
}

class _ModelDetailScreenState extends State<ModelDetailScreen> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      // key: _scaffoldKey,
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
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            // decoration: BoxDecoration(
            //     image:
            //         DecorationImage(image: AssetImage('assets/images/bg.jpg'))),
            child: Center(
                child: Container(
              height: height * 0.6,
              child: ZoomSliderScreen(
                imgList: widget.listImage,
              ),
            ))),
      ),
    );
  }
}
