import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:planty/constants/colors.dart';
import 'package:planty/widgets/num_row_widget.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController1;
  late AnimationController _animationController2;
  late AnimationController _animationController3;
  late AnimationController _animationControllertile1;
  late AnimationController _animationControllertile2;
  final List<String> _list = ["All", "Outdoor", "Indoor", "Sunlight"];
  final _logger = Logger(); // Create an instance of the Logger

  int _selectedItem = 0;
  final List<String> _images = [
    "assets/images/plant1.png",
    "assets/images/plant5.png",
    "assets/images/plant4.png",
    "assets/images/plant2.png",
    "assets/images/plant6.png",
    "assets/images/plant3.png",
    "assets/images/plant9.png",
    "assets/images/plant4.png",
    "assets/images/plant7.png",
    "assets/images/plant8.png",
  ];
  late ScrollController _controller;

  void _scrollListner() {
    if (_controller.offset >= 100) {
      if (mounted) {
        setState(() {
          _logger.i('Scroll started'); // Use logger.i for info-level logging
          // _secDot = 10;
          _boxHeight = 350;
          _topPickHight = 340;

          _imageSize = 200;
          // _animationController2.repeat();
        });
      }
    }
    if (_controller.offset <= 10) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted) {
          setState(() {
            _logger.i('Reached top'); // Use logger.i for info-level logging
            _boxHeight = 460;
            _topPickHight = 450;
            _imageSize = 250;
          });
        }
      });
    }
  }

  double _boxHeight = 460;
  double _imageSize = 250;
  double _topPickHight = 450;
  @override
  void dispose() {
    super.dispose();
    _animationController1.dispose();
    _animationController2.dispose();
    _animationController3.dispose();
    _animationControllertile1.dispose();
    _animationControllertile2.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller.addListener(_scrollListner);
    _animationController1 = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800),
        animationBehavior: AnimationBehavior.preserve)
      ..addListener(() {
        setState(() {});
      });
    Future.delayed(const Duration(milliseconds: 500), () {
      _animationController1.forward();
    });
    _animationController2 = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1200),
        animationBehavior: AnimationBehavior.preserve)
      ..addListener(() {
        setState(() {});
      });
    Future.delayed(const Duration(seconds: 1), () {
      _animationController2.forward();
    });
    _animationController3 = AnimationController(
        //
        vsync: this,
        duration: const Duration(milliseconds: 1500),
        animationBehavior: AnimationBehavior.preserve)
      ..addListener(() {
        setState(() {});
      });
    Future.delayed(const Duration(seconds: 1), () {
      _animationController3.forward();
    });

    // * tile 1 animation
  }

  final double _secDot = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: _boxHeight,
          width: double.infinity,
          // color: Colors.amber,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: _topPickHight,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: kPrimaryColor,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        // Color.fromARGB(255, 37, 110, 39),
                        kPrimaryColor.withOpacity(1),
                        kPrimaryColor.withOpacity(1),
                      ]),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(
                      60,
                    ),
                  ),
                ),
                child: Stack(children: [
                  // * app bar
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Planty",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 25,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(.3)),
                              child: const Icon(
                                Icons.shopping_bag,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  // * top picks
                  const Positioned(
                    bottom: 30,
                    left: 20,
                    child: Text(
                      "Top\n Picks",
                      style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // * plant image
                  Positioned(
                    right: 20,
                    bottom: 50,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: _imageSize,
                      width: _imageSize,
                      child: Image.asset("assets/images/plant2.png"),
                    ),
                  )
                ]),
              ),
              Positioned(
                bottom: 0,
                // left: 20,
                child: Row(
                  children: [
                    AnimatedBuilder(
                        animation: _animationController1,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(10 * _animationController1.value, 0),
                            child: const NumberWidget(
                              color: Colors.black,
                              number: 23,
                            ),
                          );
                        }),
                    AnimatedBuilder(
                        animation: _animationController2,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(
                                _secDot * _animationController2.value, 0),
                            child: const NumberWidget(
                              color: Colors.grey,
                              number: 10,
                            ),
                          );
                        }),
                    AnimatedBuilder(
                        animation: _animationController3,
                        builder: (context, child) {
                          return Transform.translate(
                            offset:
                                Offset(200 * _animationController3.value, 0),
                            child: const NumberWidget(
                              color: Colors.grey,
                              number: 8,
                            ),
                          );
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
        // * top picks container

        // * menu bar
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 60,
            width: double.infinity,
            child: ListView.builder(
                itemCount: _list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedItem = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: 60,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black),
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            _list[index],
                            style: TextStyle(
                                color: _selectedItem == index
                                    ? kSecondaryColor
                                    : Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  );
                }))),

        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView(
          controller: _controller,
          padding: EdgeInsets.zero,
          children: [
            FadeInRight(
              child: PlantTileWidget(
                  plantName: "Ilex glabra \n  Inkberry ", imgUrl: _images[3]),
            ),
            FadeInLeft(
              child: PlantTileWidget(
                  plantName: "Bird's Nest \n Fern", imgUrl: _images[1]),
            ),
            FadeInUp(
              child: PlantTileWidget(
                  plantName: "Adiantum \n Pedatum L.", imgUrl: _images[0]),
            ),
            FadeInDown(
              child: PlantTileWidget(
                  plantName: "Dumb \n Cane", imgUrl: _images[5]),
            ),
            FadeInRight(
              child: PlantTileWidget(
                  plantName: "Hydrangea \n Macrophylla", imgUrl: _images[2]),
            ),
            FadeInLeft(
              child: PlantTileWidget(
                  plantName: "Peace \nLily", imgUrl: _images[4]),
            ),
            FadeInRight(
              child: PlantTileWidget(
                  plantName: "Tufted \nAirplant", imgUrl: _images[9]),
            ),
            FadeInLeft(
              child: PlantTileWidget(
                  plantName: "Parry's \nAgave", imgUrl: _images[6]),
            ),
            FadeInUp(
              child:
                  PlantTileWidget(plantName: "Tulips \n", imgUrl: _images[8]),
            ),
          ],
        ))

        // Stack(
        //   children: [
        //     PlantTileWidget(
        //         plantName: "Adiantum \n pedatum L.", imgUrl: "assets/images/plant1.png"),
        //     Positioned(
        //       top: 50,
        //       right: 0,
        //       child: PlantTileWidget(
        //           plantName: "Aloe Tela \n Vera", imgUrl: "assets/images/plant5.png"),
        //     ),
        //   ],
        // ),

        // * row dots widgets
      ]),
    );
  }
}

class PlantTileWidget extends StatefulWidget {
  final String plantName;
  final String imgUrl;
  const PlantTileWidget({
    super.key,
    required this.plantName,
    required this.imgUrl,
  });

  @override
  State<PlantTileWidget> createState() => _PlantTileWidgetState();
}

class _PlantTileWidgetState extends State<PlantTileWidget> {
  double _boxWidth = 400;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _boxWidth = 350;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 150,
                width: _boxWidth,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    color: kPrimaryColor),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 85, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.plantName,
                          style: const TextStyle(
                              color: kSecondaryColor,
                              fontSize: 23,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            IconWidget(icon: Icons.water_drop_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            IconWidget(icon: Icons.thermostat_auto),
                            SizedBox(
                              width: 10,
                            ),
                            IconWidget(icon: Icons.sunny),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 30,
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ),
            Positioned(
              left: 10,
              child: SizedBox(
                height: 150,
                width: 150,
                child: ZoomIn(
                    duration: const Duration(seconds: 2),
                    child: Image.asset(widget.imgUrl)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final IconData icon;
  const IconWidget({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(.7)),
          borderRadius: BorderRadius.circular(10)),
      child: Icon(
        icon,
        color: Colors.white.withOpacity(.7),
      ),
    );
  }
}
