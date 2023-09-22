import 'package:flutter/material.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/bottom_navigation_bar.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../Widgets/text_widget.dart';
import '../../app/locator.dart';
import '../profilescreen/user_profile_screen1.dart';
import '../searchScreen/search_screen2.dart';

class HomeMapViewScreen extends StatefulWidget {
  const HomeMapViewScreen({Key? key}) : super(key: key);

  @override
  State<HomeMapViewScreen> createState() => _HomeMapViewScreenState();
}

class _HomeMapViewScreenState extends State<HomeMapViewScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            // backgroundColor: ColorUtils.tuple,
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorUtils.tuple,
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    ColorUtils.tuple,
                    ColorUtils.tuple,
                    ColorUtils.tuple,
                    // Colors.orange,
                    // Colors.orange
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(ImageUtils.logopic),
                            SizedBox(
                              width: 3.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: UserProfileScreen1()));
                              },
                              child: Image.network(
                                // model.avatar.toString(),
                                ImageUtils.personimg,
                                width: 10.w,
                                height: 10.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 15,
                                  top: 15,
                                ),
                                border: InputBorder.none,
                                hintText: 'Search',
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: SeachScreen2()));
                                    },
                                    icon: const Icon(Icons.search))),
                          ),
                          // SvgPicture.asset(
                          //       ImageUtils.search,
                          //       width: 10,
                          //       height: 10,
                          //       fit: BoxFit.cover,
                          //     ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  ImageUtils.fullmap,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: 30,
                                  left: 60.w,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: MyBottomNavBar(
                                                  //index: 1,
                                                  )

                                              //HomeBottombarNavScreen()

                                              ));
                                      //
                                    },
                                    child: Container(
                                        //height: 40,
                                        // width: 100,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white),
                                        child: Row(
                                          children: [
                                            Image.asset(ImageUtils.vectoricon),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text(
                                              'List View',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: FontUtils.proxima,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorUtils.tuple),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 370),
                                  child: SizedBox(
                                    height: 20.h,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          //  height: 50,
                                          width: 87.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  // color: Color(0xFF9399A6)
                                                  color: ColorUtils.grayf),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading:
                                                    Image.asset(ImageUtils.img),
                                                title: TextWidget(
                                                  textValue:
                                                      "Emirates Hospital Jumeirah",
                                                  fontFamily: FontUtils.proxima,
                                                  fontSize: 2.3.t,
                                                  textColor: ColorUtils.black,
                                                ),
                                                subtitle: Row(
                                                  children: [
                                                    // ignore: prefer_const_constructors
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    TextWidget(
                                                      textValue:
                                                          "4.5 |  2.7 km",
                                                      fontFamily:
                                                          FontUtils.proxima,
                                                      fontSize: 2.2.t,
                                                      textColor:
                                                          ColorUtils.black,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(13),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9),
                                                                color: const Color
                                                                    .fromRGBO(
                                                                    50,
                                                                    198,
                                                                    195,
                                                                    0.09)),
                                                            child: Image.asset(
                                                                ImageUtils
                                                                    .save)),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            _shareModalBottomSheet(
                                                                context);
                                                          },
                                                          child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(13),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              9),
                                                                  color: const Color
                                                                      .fromRGBO(
                                                                      50,
                                                                      198,
                                                                      195,
                                                                      0.09)),
                                                              child: Image.asset(
                                                                  ImageUtils
                                                                      .share)),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 8.2.w,
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15,
                                                              top: 10,
                                                              bottom: 10,
                                                              right: 15),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: const Color(
                                                            0xFF32C6C3),
                                                      ),
                                                      child: TextWidget(
                                                        textValue:
                                                            "Get Direction",
                                                        fontFamily: FontUtils
                                                            .interMedium,
                                                        fontSize: 2.t,
                                                        textColor:
                                                            ColorUtils.white,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Container(
                                          //  height: 50,
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  // color: Color(0xFF9399A6)
                                                  color: ColorUtils.grayf),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading:
                                                    Image.asset(ImageUtils.img),
                                                title: TextWidget(
                                                  textValue:
                                                      "Emirates Hospital Jumeirah",
                                                  fontFamily: FontUtils.proxima,
                                                  fontSize: 2.6.t,
                                                  textColor: ColorUtils.black,
                                                ),
                                                subtitle: Row(
                                                  children: [
                                                    // ignore: prefer_const_constructors
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    TextWidget(
                                                      textValue:
                                                          "4.5 |  2.7 km",
                                                      fontFamily:
                                                          FontUtils.proxima,
                                                      fontSize: 2.2.t,
                                                      textColor:
                                                          ColorUtils.black,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(13),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9),
                                                                color: const Color
                                                                    .fromRGBO(
                                                                    50,
                                                                    198,
                                                                    195,
                                                                    0.09)),
                                                            child: Image.asset(
                                                                ImageUtils
                                                                    .save)),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            _shareModalBottomSheet(
                                                                context);
                                                          },
                                                          child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(13),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              9),
                                                                  color: const Color
                                                                      .fromRGBO(
                                                                      50,
                                                                      198,
                                                                      195,
                                                                      0.09)),
                                                              child: Image.asset(
                                                                  ImageUtils
                                                                      .share)),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 8.2.w,
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15,
                                                              top: 10,
                                                              bottom: 10,
                                                              right: 15),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: const Color(
                                                            0xFF32C6C3),
                                                      ),
                                                      child: TextWidget(
                                                        textValue:
                                                            "Get Direction",
                                                        fontFamily: FontUtils
                                                            .interMedium,
                                                        fontSize: 2.t,
                                                        textColor:
                                                            ColorUtils.white,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// share modelBOttom sheet
void _shareModalBottomSheet(context) {
  showModalBottomSheet(
      backgroundColor: Colors.grey,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 40.w,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: PageHorizontalMargin(
            widget: Column(
              children: <Widget>[
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    TextWidget(
                      textValue: "Share",
                      fontFamily: FontUtils.interMedium,
                      fontSize: 2.3.t,
                      textColor: ColorUtils.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(ImageUtils.messanger),
                    Image.asset(ImageUtils.whatapp1),
                    Image.asset(ImageUtils.mail),
                    Image.asset(ImageUtils.skype),
                    Image.asset(ImageUtils.moreh),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
