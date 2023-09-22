import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imraapp/UI/Facilities/select_county_screen.dart';
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
import 'edit_user_profile_screen2.dart';

class EditUserProfileScreen1 extends StatefulWidget {
  const EditUserProfileScreen1({Key? key}) : super(key: key);

  @override
  State<EditUserProfileScreen1> createState() => _EditUserProfileScreen1State();
}

class _EditUserProfileScreen1State extends State<EditUserProfileScreen1> {
  File? _image; // This will hold the selected image file

// Function to pick an image from the gallery or camera
  ImagePicker _imagePicker = ImagePicker();
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      print('this is image url ${_image} ');
    }
  }

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
                            Row(
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
                                  textValue: "Edit Profile",
                                  fontFamily: FontUtils.interMedium,
                                  fontSize: 2.t,
                                  textColor: ColorUtils.white,
                                ),
                              ],
                            ),
                            //Image.asset(ImageUtils.edit),
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
                              SizedBox(
                                height: 3.h,
                              ),
                              // Stack(
                              //   children: [
                              //     Container(
                              //         decoration: BoxDecoration(
                              //           color: Colors.grey[50],
                              //           borderRadius:
                              //               BorderRadius.circular(50.0),
                              //         ),
                              //         height: 100,
                              //         width: 100,
                              //         child: _image != null
                              //             ? ClipRRect(
                              //                 borderRadius:
                              //                     BorderRadius.circular(50.0),
                              //                 child: Image.file(_image!,
                              //                     fit: BoxFit.cover),
                              //               )
                              //             :
                              //             //Image.asset(ImageUtils.editprofile),
                              //             Image.network(
                              //                 model.avatar.toString(),
                              //                 fit: BoxFit.cover,
                              //               )
                              //         // Icon(
                              //         //   Icons.person,
                              //         //   size: 40,
                              //         //   color: Colors.grey,
                              //         // ), // Display the selected image if available
                              //         ),
                              //     Positioned(
                              //       top: 94,
                              //       left: 69,
                              //       child: InkWell(
                              //         onTap: () {
                              //           _pickImage(ImageSource.gallery);
                              //         },
                              //         child:
                              //             Image.asset(ImageUtils.editprofile),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              Image.asset(ImageUtils.editprofile),
                              SizedBox(
                                height: 4.h,
                              ),
                              DefaultTabController(
                                  length: 2,
                                  child: Column(
                                    children: [
                                      TabBar(
                                          indicatorColor: ColorUtils.tuple,
                                          labelPadding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          indicatorPadding: EdgeInsets.zero,
                                          // labelStyle: const TextStyle(
                                          //     fontSize: 16.0,
                                          //     fontWeight: FontWeight.bold),
                                          unselectedLabelStyle:
                                              const TextStyle(fontSize: 16.0),
                                          tabs: [
                                            TextWidget(
                                              textValue: "Personal Info",
                                              fontFamily: FontUtils.proxima,
                                              fontSize: 2.3.t,
                                              textColor: ColorUtils.tuple,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child:
                                                            EditUserProfileScreen2()));
                                              },
                                              child: TextWidget(
                                                textValue: "Medical Info",
                                                fontFamily: FontUtils.proxima,
                                                fontSize: 2.3.t,
                                                textColor: ColorUtils.textcolor,
                                              ),
                                            ),
                                          ]),
                                    ],
                                  )),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Date of Birth",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.3.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorUtils.silver1,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: '23 May, 1965',
                                      hintStyle: TextStyle(
                                          color: ColorUtils.black,
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 16),
                                      contentPadding: EdgeInsets.only(
                                          left: 5.w,
                                          top: 2.h,
                                          right: 2.w,
                                          bottom: 3.h),
                                      //labelStyle: ,
                                      border: InputBorder.none),
                                  //enabled: false,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Email Address",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.3.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                // padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF32C6C3)),
                                  //  color: ColorUtils.silver1,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'davisschleifer@gmail.com|',
                                      hintStyle: TextStyle(
                                          color: ColorUtils.black,
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 16),
                                      contentPadding: EdgeInsets.only(
                                          left: 5.w,
                                          top: 2.h,
                                          right: 2.w,
                                          bottom: 3.h),
                                      //labelStyle: ,
                                      border: InputBorder.none),
                                  //enabled: false,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Phone",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.3.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorUtils.silver1,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: '+971 55 253 3541',
                                      hintStyle: TextStyle(
                                          color: ColorUtils.black,
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 16),
                                      contentPadding: EdgeInsets.only(
                                          left: 5.w,
                                          top: 2.h,
                                          right: 2.w,
                                          bottom: 3.h),
                                      //labelStyle: ,
                                      border: InputBorder.none),
                                  //enabled: false,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Country",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.3.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                  color: ColorUtils.silver1,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // height: 50,
                                        // width: 220,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText: 'United Arab Emirates',
                                              hintStyle: TextStyle(
                                                  color: ColorUtils.black,
                                                  fontFamily: FontUtils.proxima,
                                                  fontSize: 16),
                                              contentPadding: EdgeInsets.only(
                                                  left: 5.w,
                                                  top: 2.h,
                                                  right: 2.w,
                                                  bottom: 3.h),
                                              //labelStyle: ,
                                              border: InputBorder.none),
                                          //enabled: false,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     PageTransition(
                                        //         type: PageTransitionType.fade,
                                        //         child: SelectCountryScreen()));
                                      },
                                      child: Row(
                                        children: [
                                          Image.asset(ImageUtils.flagimg),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Image.asset(ImageUtils.fowardicon)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Location",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.3.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                  color: ColorUtils.silver1,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // height: 50,
                                        // width: 220,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText:
                                                  'University City, University Street, Sh...',
                                              hintStyle: TextStyle(
                                                  color: ColorUtils.black,
                                                  fontFamily: FontUtils.proxima,
                                                  fontSize: 16),
                                              contentPadding: EdgeInsets.only(
                                                  left: 5.w,
                                                  top: 2.h,
                                                  right: 2.w,
                                                  bottom: 3.h),
                                              //labelStyle: ,
                                              border: InputBorder.none),
                                          //enabled: false,
                                        ),
                                      ),
                                    ),
                                    Image.asset(ImageUtils.loctionIcon),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
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
                                      // Navigator.push(
                                      //     context,
                                      //     PageTransition(
                                      //         type: PageTransitionType.fade,
                                      //         child: MyHomePage()));
                                    },
                                    child: Text(
                                      "Save Change",
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
                                height: 5.h,
                              )
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
