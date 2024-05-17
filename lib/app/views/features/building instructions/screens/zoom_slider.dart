import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ye_app/app/views/features/building%20instructions/widgets/model_slider.dart';
import 'package:ye_app/app/views/widgets/colors.dart';

class ZoomSliderScreen extends StatefulWidget {
  final List<dynamic> imgList;
  const ZoomSliderScreen({
    super.key,
    required this.imgList,
  });

  @override
  State<ZoomSliderScreen> createState() => _ZoomSliderScreenState();
}

class _ZoomSliderScreenState extends State<ZoomSliderScreen> {
  final CarouselController _controller = CarouselController();

  int _currentIndex = 0;
  List<Widget> imageSliders = [];

  @override
  void initState() {
    super.initState();
    imageSliders = widget.imgList
        .map((item) => Container(
              // color: Colors.amber,
              child: Stack(
                children: [
                  Container(
                    // margin: EdgeInsets.all(5.0),
                    // height: 250,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Center(
                          child: CachedNetworkImage(
                            height: 300,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fitHeight,
                            imageUrl: item,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          // Image.network(item,
                          //     height: 300,
                          //     fit: BoxFit.fitHeight,
                          //     width: double.infinity),
                        )),
                  ),
                  // Positioned(
                  //     bottom: 5,
                  //     right: 5,
                  //     child: InkWell(
                  //       onTap: () {
                  //         Get.back();
                  //       },
                  //       child: Container(
                  //         child: Icon(
                  //           Icons.zoom_in_map_outlined,
                  //           size: 40,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //     )

                  //     )
                ],
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  CarouselSlider(
                    items: imageSliders,
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
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
                                onPressed: () => _controller.previousPage(),
                                icon: Icon(Icons.arrow_back_ios,
                                    color: Colors.black)),
                          ),
                          Flexible(
                            child: IconButton(
                                onPressed: () => _controller.nextPage(),
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
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
                  itemCount: widget.imgList.length,
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
                        child: CachedNetworkImage(
                          imageUrl: widget.imgList[index],
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ],
    ));
  }
}
