import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
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
import '../profilescreen/edit_user_profile_screen2.dart';
import 'filter_screen.dart';

class FoodAllergiesScreen extends StatefulWidget {
  const FoodAllergiesScreen({Key? key}) : super(key: key);

  @override
  State<FoodAllergiesScreen> createState() => _FoodAllergiesScreenState();
}

class _FoodAllergiesScreenState extends State<FoodAllergiesScreen> {
  List options = [
    {
      'name': 'Celery',
      'status': false,
    }
  ];
  String? selectedAllergy;
  List<String> selectedAllergies = [];
  @override
  Widget build(BuildContext context) {
    double _startValue = 500;
    double _endValue = 3000;
    int selectedOption = 1;
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
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 50),
                  PageHorizontalMargin(
                    widget: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(ImageUtils.blackbackarrow)),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Food Allergies ",
                              style: TextStyle(
                                  fontFamily: FontUtils.proxima,
                                  fontSize: 18,
                                  //color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(147, 153, 166, 0.09),
                              // color: Colors.white,
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
                                    onPressed: () {},
                                    icon: const Icon(Icons.search))),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        CheckboxListTile(
                          title: Text(
                            "Balsam of Peru",
                            style: TextStyle(
                              fontFamily: FontUtils.proxima,
                              fontSize: 14,
                              // color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: selectedAllergies.contains('Balsam of Peru'),
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectedAllergies.add('Balsam of Peru');
                              } else {
                                selectedAllergies.remove('Balsam of Peru');
                              }
                            });
                          },
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Balsam of Peru",
                        //       style: TextStyle(
                        //         fontFamily: FontUtils.proxima,
                        //         fontSize: 14,
                        //         // color: Colors.black,
                        //         fontWeight: FontWeight.w600,
                        //       ),
                        //     ),
                        //     Radio(
                        //       value: 1,
                        //       groupValue: 0,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           selectedOption = value!;
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),

                        CheckboxListTile(
                          title: Text(
                            "Celery",
                            style: TextStyle(
                              fontFamily: FontUtils.proxima,
                              fontSize: 14,
                              // color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: selectedAllergies.contains('Celery'),
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectedAllergies.add('Celery');
                              } else {
                                selectedAllergies.remove('Celery');
                              }
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            "Egg",
                            style: TextStyle(
                              fontFamily: FontUtils.proxima,
                              fontSize: 14,
                              // color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: selectedAllergies.contains('Egg'),
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectedAllergies.add('Egg');
                              } else {
                                selectedAllergies.remove('Egg');
                              }
                            });
                          },
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Egg",
                        //       style: TextStyle(
                        //           fontFamily: FontUtils.proxima,
                        //           fontSize: 14,
                        //           // color: Color(0xFFFFFFFF),
                        //           fontWeight: FontWeight.w600),
                        //     ),
                        //     Radio(
                        //       value: 1,
                        //       groupValue: 0,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           selectedOption = value!;
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        CheckboxListTile(
                          title: Text(
                            "Fish",
                            style: TextStyle(
                              fontFamily: FontUtils.proxima,
                              fontSize: 14,
                              // color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: selectedAllergies.contains('Fish'),
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectedAllergies.add('Fish');
                              } else {
                                selectedAllergies.remove('Fish');
                              }
                            });
                          },
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Fish",
                        //       style: TextStyle(
                        //           fontFamily: FontUtils.proxima,
                        //           fontSize: 14,
                        //           // color: Color(0xFFFFFFFF),
                        //           fontWeight: FontWeight.w600),
                        //     ),
                        //     Radio(
                        //       value: 1,
                        //       groupValue: 0,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           selectedOption = value!;
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        CheckboxListTile(
                          title: Text(
                            "Fruit",
                            style: TextStyle(
                              fontFamily: FontUtils.proxima,
                              fontSize: 14,
                              // color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: selectedAllergies.contains('Fruit'),
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectedAllergies.add('Fruit');
                              } else {
                                selectedAllergies.remove('Fruit');
                              }
                            });
                          },
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Fruit",
                        //       style: TextStyle(
                        //           fontFamily: FontUtils.proxima,
                        //           fontSize: 14,
                        //           // color: Color(0xFFFFFFFF),
                        //           fontWeight: FontWeight.w600),
                        //     ),
                        //     Radio(
                        //       value: 1,
                        //       groupValue: selectedOption,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           selectedOption = value!;
                        //         });
                        //       },
                        //       activeColor: ColorUtils.tuple,
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        CheckboxListTile(
                          title: Text(
                            "Garlic",
                            style: TextStyle(
                              fontFamily: FontUtils.proxima,
                              fontSize: 14,
                              // color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: selectedAllergies.contains('Garlic'),
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectedAllergies.add('Garlic');
                              } else {
                                selectedAllergies.remove('Garlic');
                              }
                            });
                          },
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Garlic",
                        //       style: TextStyle(
                        //           fontFamily: FontUtils.proxima,
                        //           fontSize: 14,
                        //           // color: Color(0xFFFFFFFF),
                        //           fontWeight: FontWeight.w600),
                        //     ),
                        //     Radio(
                        //       value: 1,
                        //       groupValue: selectedOption,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           selectedOption = value!;
                        //         });
                        //       },
                        //       activeColor: ColorUtils.tuple,
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Oats",
                        //       style: TextStyle(
                        //           fontFamily: FontUtils.proxima,
                        //           fontSize: 14,
                        //           // color: Color(0xFFFFFFFF),
                        //           fontWeight: FontWeight.w600),
                        //     ),
                        //     Radio(
                        //       value: 1,
                        //       groupValue: 0,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           selectedOption = value!;
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        CheckboxListTile(
                          title: Text(
                            "Mustard",
                            style: TextStyle(
                              fontFamily: FontUtils.proxima,
                              fontSize: 14,
                              // color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: selectedAllergies.contains('Mustard'),
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectedAllergies.add('Mustard');
                              } else {
                                selectedAllergies.remove('Mustard');
                              }
                            });
                          },
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Mustard",
                        //       style: TextStyle(
                        //           fontFamily: FontUtils.proxima,
                        //           fontSize: 14,
                        //           // color: Color(0xFFFFFFFF),
                        //           fontWeight: FontWeight.w600),
                        //     ),
                        //     Radio(
                        //       value: 1,
                        //       groupValue: 0,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           selectedOption = value!;
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        CheckboxListTile(
                          title: Text(
                            "Peanut",
                            style: TextStyle(
                              fontFamily: FontUtils.proxima,
                              fontSize: 14,
                              // color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: selectedAllergies.contains('Peanut'),
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectedAllergies.add('Peanut');
                              } else {
                                selectedAllergies.remove('Peanut');
                              }
                            });
                          },
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Peanut",
                        //       style: TextStyle(
                        //           fontFamily: FontUtils.proxima,
                        //           fontSize: 14,
                        //           // color: Color(0xFFFFFFFF),
                        //           fontWeight: FontWeight.w600),
                        //     ),
                        //     Radio(
                        //       value: 1,
                        //       groupValue: 0,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           selectedOption = value!;
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        CheckboxListTile(
                          title: Text(
                            "Poultry Meat",
                            style: TextStyle(
                              fontFamily: FontUtils.proxima,
                              fontSize: 14,
                              // color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: selectedAllergies.contains('Poultry Meat'),
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectedAllergies.add('Poultry Meat');
                              } else {
                                selectedAllergies.remove('Poultry Meat');
                              }
                            });
                          },
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Poultry Meat",
                        //       style: TextStyle(
                        //           fontFamily: FontUtils.proxima,
                        //           fontSize: 14,
                        //           // color: Color(0xFFFFFFFF),
                        //           fontWeight: FontWeight.w600),
                        //     ),
                        //     Radio(
                        //       value: 1,
                        //       groupValue: 0,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           selectedOption = value!;
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 3.h,
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
                                  borderRadius: BorderRadius.circular(25)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: EditUserProfileScreen2()));
                              },
                              child: Text(
                                "Submit",
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
