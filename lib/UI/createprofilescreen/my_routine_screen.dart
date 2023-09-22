import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/custom_text_field.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../Widgets/text_widget.dart';
import '../../Widgets/textfiled_widget.dart';
import '../../app/locator.dart';
import '../Home/location_confirm_screen.dart';
import '../profilescreen/user_profile_screen1.dart';
import '../questionnaire/questionnaire_screen1.dart';
import '../questionnaire/questionnaire_screen2.dart';
import '../questionnaire/questionnaire_screen3.dart';

class MyRoutineScreen extends StatelessWidget {
  const MyRoutineScreen({Key? key}) : super(key: key);

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
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(ImageUtils.back)),
                            SizedBox(
                              width: 3.w,
                            ),
                            TextWidget(
                              textValue: "My Routine",
                              fontFamily: FontUtils.interMedium,
                              fontSize: 2.t,
                              textColor: ColorUtils.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: PageHorizontalMargin(
                        widget: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              // const SizedBox(
                              //   height: 30,
                              // ),
                              // GridView.builder(
                              //   itemCount: model.myRoutine.length,
                              //   // model.DeliveryList.length,
                              //   padding: EdgeInsets.zero,
                              //   shrinkWrap: true,
                              //   primary: false,
                              //   gridDelegate:
                              //       // ignore: prefer_const_constructors
                              //       SliverGridDelegateWithFixedCrossAxisCount(
                              //           crossAxisCount: 1,
                              //           crossAxisSpacing: 10.0,
                              //           mainAxisSpacing: 10.0,
                              //           //1.35
                              //           childAspectRatio: 2.2),
                              //   itemBuilder: (context, index) {
                              //     return GestureDetector(
                              //       onTap: () {
                              //         // Navigator.push(
                              //         //     context,
                              //         // PageTransition(
                              //         //     type: PageTransitionType.fade,
                              //         //     child: const ())

                              //         //    );
                              //       },
                              //       child: Container(
                              //         decoration: const BoxDecoration(
                              //           shape: BoxShape.rectangle,
                              //           borderRadius: BorderRadius.all(
                              //               Radius.circular(25.0)),
                              //         ),
                              //         child: AnimatedContainer(
                              //             padding: const EdgeInsets.all(15.0),
                              //             duration:
                              //                 const Duration(milliseconds: 400),
                              //             width: MediaQuery.of(context)
                              //                     .size
                              //                     .width /
                              //                 1,
                              //             // height: 16.h,
                              //             //margin: EdgeInsets.symmetric(horizontal: 5.w),
                              //             decoration: BoxDecoration(
                              //               border: Border.all(
                              //                   color: ColorUtils.silver1),
                              //               borderRadius:
                              //                   BorderRadius.circular(8),
                              //             ),
                              //             child: Column(
                              //               children: [
                              //                 Row(
                              //                   children: [
                              //                     TextWidget(
                              //                       textValue: model
                              //                           .myRoutine[index]
                              //                               ['question']
                              //                           .toString(),
                              //                       //"Do you exerciese?",
                              //                       fontFamily:
                              //                           FontUtils.interMedium,
                              //                       fontSize: 2.t,
                              //                       textColor: ColorUtils.black,
                              //                     ),
                              //                   ],
                              //                 ),
                              //                 SizedBox(
                              //                   height: 5.h,
                              //                 ),
                              //                 Container(
                              //                   decoration: const BoxDecoration(
                              //                     shape: BoxShape.rectangle,
                              //                     borderRadius:
                              //                         BorderRadius.all(
                              //                             Radius.circular(
                              //                                 25.0)),
                              //                   ),
                              //                   child: AnimatedContainer(
                              //                     duration: const Duration(
                              //                         milliseconds: 400),
                              //                     width: MediaQuery.of(context)
                              //                             .size
                              //                             .width /
                              //                         1,
                              //                     height: 6.h,
                              //                     //margin: EdgeInsets.symmetric(horizontal: 5.w),
                              //                     decoration: BoxDecoration(
                              //                       border: Border.all(
                              //                           color: const Color
                              //                                   .fromRGBO(
                              //                               68, 199, 176, 1)),
                              //                       borderRadius:
                              //                           BorderRadius.circular(
                              //                               8),
                              //                       color: const Color.fromRGBO(
                              //                           68, 199, 176, 0.1),
                              //                     ),
                              //                     child: MaterialButton(
                              //                       padding: EdgeInsets.zero,
                              //                       shape:
                              //                           RoundedRectangleBorder(
                              //                               borderRadius:
                              //                                   BorderRadius
                              //                                       .circular(
                              //                                           25)),
                              //                       onPressed: () {
                              //                         // Navigator.push(
                              //                         //     context,
                              //                         //     PageTransition(
                              //                         //         type: PageTransitionType.fade,
                              //                         //         child: MyHomePage()));
                              //                       },
                              //                       child: Text(
                              //                         model.myRoutine[index]
                              //                             ['ans'],
                              //                         //  "Regular",
                              //                         style: TextStyle(
                              //                           fontFamily:
                              //                               FontUtils.proxima,
                              //                           fontSize: 1.8.t,
                              //                           color: ColorUtils.tuple,
                              //                           // Color.fromRGBO(2, 104, 81, 1)
                              //                         ),
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //               ],
                              //             )),
                              //       ),
                              //     );
                              //   },
                              // ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: QuestionnaireScreen1()));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25.0)),
                                  ),
                                  child: AnimatedContainer(
                                      padding: const EdgeInsets.all(15.0),
                                      duration:
                                          const Duration(milliseconds: 400),
                                      width:
                                          MediaQuery.of(context).size.width / 1,
                                      // height: 16.h,
                                      //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorUtils.silver1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              TextWidget(
                                                textValue: "Do you exerciese?",
                                                fontFamily:
                                                    FontUtils.interMedium,
                                                fontSize: 2.t,
                                                textColor: ColorUtils.black,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25.0)),
                                            ),
                                            child: AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 400),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1,
                                              height: 6.h,
                                              //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        68, 199, 176, 1)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color.fromRGBO(
                                                    68, 199, 176, 0.1),
                                              ),
                                              child: MaterialButton(
                                                padding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                onPressed: () {
                                                  // Navigator.push(
                                                  //     context,
                                                  //     PageTransition(
                                                  //         type: PageTransitionType.fade,
                                                  //         child: MyHomePage()));
                                                },
                                                child: Text(
                                                  "Regular",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontUtils.proxima,
                                                    fontSize: 1.8.t,
                                                    color: ColorUtils.tuple,
                                                    // Color.fromRGBO(2, 104, 81, 1)
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: QuestionnaireScreen2()));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25.0)),
                                  ),
                                  child: AnimatedContainer(
                                      padding: const EdgeInsets.all(15.0),
                                      duration:
                                          const Duration(milliseconds: 400),
                                      width:
                                          MediaQuery.of(context).size.width / 1,
                                      // height: 16.h,
                                      //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorUtils.silver1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              TextWidget(
                                                textValue:
                                                    "Which type of food do \n you usually eat?",
                                                fontFamily:
                                                    FontUtils.interMedium,
                                                fontSize: 2.t,
                                                textColor: ColorUtils.black,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25.0)),
                                            ),
                                            child: AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 400),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1,
                                              height: 6.h,
                                              //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        68, 199, 176, 1)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color.fromRGBO(
                                                    68, 199, 176, 0.1),
                                              ),
                                              child: MaterialButton(
                                                padding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                onPressed: () {
                                                  // Navigator.push(
                                                  //     context,
                                                  //     PageTransition(
                                                  //         type: PageTransitionType.fade,
                                                  //         child: MyHomePage()));
                                                },
                                                child: Text(
                                                  "Junk Food",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontUtils.proxima,
                                                    fontSize: 1.8.t,
                                                    color: ColorUtils.tuple,
                                                    // Color.fromRGBO(2, 104, 81, 1)
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: QuestionnaireScreen3()));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25.0)),
                                  ),
                                  child: AnimatedContainer(
                                      padding: const EdgeInsets.all(15.0),
                                      duration:
                                          const Duration(milliseconds: 400),
                                      width:
                                          MediaQuery.of(context).size.width / 1,
                                      // height: 16.h,
                                      //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorUtils.silver1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              TextWidget(
                                                textValue: "Do you Smoke?",
                                                fontFamily:
                                                    FontUtils.interMedium,
                                                fontSize: 2.t,
                                                textColor: ColorUtils.black,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25.0)),
                                            ),
                                            child: AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 400),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1,
                                              height: 6.h,
                                              //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        68, 199, 176, 1)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color.fromRGBO(
                                                    68, 199, 176, 0.1),
                                              ),
                                              child: MaterialButton(
                                                padding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                onPressed: () {
                                                  // Navigator.push(
                                                  //     context,
                                                  //     PageTransition(
                                                  //         type: PageTransitionType.fade,
                                                  //         child: MyHomePage()));
                                                },
                                                child: Text(
                                                  "Regular",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontUtils.proxima,
                                                    fontSize: 1.8.t,
                                                    color: ColorUtils.tuple,
                                                    // Color.fromRGBO(2, 104, 81, 1)
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                ),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  width: MediaQuery.of(context).size.width / 1,
                                  height: 7.h,
                                  //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: ColorUtils.tuple),
                                  child: MaterialButton(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: LocationsConfirmScreen()));
                                    },
                                    child: Text(
                                      "Continue",
                                      style: TextStyle(
                                        fontFamily: FontUtils.interSemiBold,
                                        fontSize: 1.8.t,
                                        color: ColorUtils.white,
                                        // Color.fromRGBO(2, 104, 81, 1)
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                            ],
                          ),
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
