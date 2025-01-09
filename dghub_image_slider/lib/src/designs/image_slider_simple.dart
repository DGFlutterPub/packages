import 'package:card_swiper/card_swiper.dart';
import 'package:dghub_image_slider/dghub_image_slider.dart';
import 'package:dghub_image_slider/src/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliderSimple extends StatelessWidget {
  final ImageSliderConfig config;
  const ImageSliderSimple({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    if (Tools.isDesktop(context)) {
      return _DesktopSlide(config: config);
    }
    return _MobileSlide(config: config);
  }
}

class _MobileSlide extends StatefulWidget {
  final ImageSliderConfig config;
  const _MobileSlide({required this.config, super.key});

  @override
  State<_MobileSlide> createState() => _MobileSlideState();
}

class _MobileSlideState extends State<_MobileSlide> {
  var pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: widget.config.height,
          child: Swiper(
            loop: false,
            outer: true,
            viewportFraction: 1,
            autoplay: widget.config.autoPlay ?? false,
            itemWidth: MediaQuery.sizeOf(context).width,
            itemHeight: widget.config.height,
            onIndexChanged: (value) {
              setState(() {
                pageController.jumpToPage(value);
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: widget.config.itemBuilder(context, index),
              );
            },
            itemCount: widget.config.itemCount,
            pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    activeSize: 7, color: Colors.grey.shade300, size: 7)),
          ),
        ),
      ],
    );
  }
}

class _DesktopSlide extends StatelessWidget {
  final ImageSliderConfig config;
  const _DesktopSlide({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context).width / 3.5;
    return SizedBox(
      height: size,
      child: Swiper(
        loop: false,
        itemHeight: size,
        onIndexChanged: (value) {},
        itemBuilder: (BuildContext context, int index) {
          return config.itemBuilder(context, index);
        },
        itemCount: config.itemCount,
        control: SwiperControl(color: Colors.white),
      ),
    );
  }
}
