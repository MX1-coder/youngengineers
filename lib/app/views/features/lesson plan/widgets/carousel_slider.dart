import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ye_app/app/views/features/building%20instructions/screens/zoom_slider.dart';
// import 'package:ye_app/app/views/features/lesson%20plan/building%20instructions/screens/zoom_slider.dart';
import 'package:ye_app/app/views/widgets/colors.dart';

List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class ModelSlider extends StatefulWidget {
  const ModelSlider({super.key});

  @override
  State<ModelSlider> createState() => _ModelSliderState();
}

class _ModelSliderState extends State<ModelSlider> {
  final CarouselController _controller = CarouselController();
  // final CarouselController _controllerImage = CarouselController();

  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Center(
                        child: Image.network(item,
                            fit: BoxFit.cover, width: 1000.0),
                      )),
                ),
                Positioned(
                    bottom: 5,
                    right: 5,
                    child: InkWell(
                      onTap: () {
                        Get.to(ZoomSliderScreen(
                          imgList: imgList,
                        ));
                      },
                      child: Container(
                        child: Icon(
                          Icons.zoom_out_map_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ))
              ],
            ),
          ))
      .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('Manually controlled slider')),
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 1,
                ),
                carouselController: _controller,
              ),
              Positioned(
                  // top: 50,
                  bottom: 75,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: IconButton(
                            onPressed: () {
                              // _currentIndex= _controller
                              _controller.previousPage();
                            },
                            icon: Icon(Icons.arrow_back_ios,
                                color: Colors.white)),
                      ),
                      Flexible(
                        child: IconButton(
                            onPressed: () => _controller.nextPage(),
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  )),
            ],
          ),
          Container(
            height: 60,
            // width: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imgList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _controller.animateToPage(index);
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: Container(
                      height: 50,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: index == _currentIndex
                                ? primaryColor
                                : Colors.white,
                            width: 2.5),
                      ),
                      child: Image.network(
                        imgList[index],
                        fit: BoxFit.cover,
                      )),
                );
              },
            ),
          ),
          // Container(
          //   height: 80,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: <Widget>[
          //       ...Iterable<int>.generate(imgList.length).map(
          //         (int pageIndex) => Flexible(
          //           child: GestureDetector(
          //             onTap: () => _controller.animateToPage(pageIndex),
          // child:Container(
          // height: 50,
          // width: 50,
          // decoration: BoxDecoration(
          //   border: Border.all(
          //       color: (index == imgList[index])
          //           ? primaryColor
          //           : Colors.white,
          //       width: 2.5),
          // ),
          // child: Image.network(
          //   imgList[index],
          //   fit: BoxFit.cover,
          // )),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    ));
  }
}
