import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imraapp/UI/Facilities/select_county_screen.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Utils/widget_loader.dart';
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
import 'profile_screen2.dart';

class ProfileScreen1 extends StatefulWidget {
  const ProfileScreen1({Key? key}) : super(key: key);

  @override
  State<ProfileScreen1> createState() => _ProfileScreen1State();
}

class _ProfileScreen1State extends State<ProfileScreen1> {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Image.asset(ImageUtils.logopic)],
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
                              const SizedBox(
                                height: 30,
                              ),
                              TextWidget(
                                textValue: "Create Profile",
                                fontFamily: FontUtils.interSemiBold,
                                fontSize: 2.2.t,
                                textColor: ColorUtils.black,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[50],
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    height: 100,
                                    width: 100,
                                    child: _image != null
                                        ? ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.file(_image!, fit: BoxFit.cover),
                                    )
                                        : Icon(
                                      Icons.person,
                                      size: 40,
                                      color: Colors.grey,
                                    ), // Display the selected image if available
                                  ),
                                  Positioned(
                                    top: 65,
                                    left: 69,
                                    child: InkWell(
                                      onTap: () {
                                        _pickImage(ImageSource.gallery);
                                      },
                                      child: Image.asset(ImageUtils.plus),
                                    ),
                                  ),
                                ],
                              ),
                              // Stack(children: [
                              //   Container(
                              //     decoration: BoxDecoration(  color: Colors.grey[50],
                              //
                              //       borderRadius: BorderRadius.circular(50.0),
                              //     ),
                              //
                              //     height: 100,
                              //     width: 100,
                              //   ),
                              //   Positioned(
                              //       top: 65,
                              //       left: 69,
                              //       child: Image.asset(ImageUtils.plus)),
                              // ],),
                              SizedBox(
                                height: 3.h,
                              ),
                             // Image.asset(ImageUtils.profile),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Date of Birth",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.5.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              CustomTextField(
                                controller: model.dateofbithController,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Country",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.5.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              CustomTextField(
                                controller: model.countryController,
                              ),
                              // Container(
                              //   //width: 90.w,
                              //   //  height: 6.3.h,
                              //   decoration: BoxDecoration(
                              //       color: ColorUtils.silver1,
                              //       borderRadius: BorderRadius.circular(10)),
                              //   child: ListTile(
                              //     onTap: () {
                              //       Navigator.push(
                              //           context,
                              //           PageTransition(
                              //               type: PageTransitionType.fade,
                              //               child: SelectCountryScreen()
                              //               //SelectCountryScreen()
                              //
                              //           ));
                              //     },
                              //     trailing: Image.asset(ImageUtils.fowardicon),
                              //   ),
                              // ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Location",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.5.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              CustomTextField(
                                controller: model.addressController
                              ),
                              // Container(
                              //   //width: 90.w,
                              //   //  height: 6.3.h,
                              //   decoration: BoxDecoration(
                              //       color: ColorUtils.silver1,
                              //       borderRadius: BorderRadius.circular(10)),
                              //   child: ListTile(
                              //
                              //     onTap: () {},
                              //     trailing: Image.asset(ImageUtils.loctionIcon),
                              //   ),
                              // ),
                              SizedBox(
                                height: 4.h,
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
                                    onPressed: () async{
                                      model.loadingWidget == true
                                          ? () {}:

                                          model.doUserProfile(context,
                                              //model.prefService.userToken.toString(),
                                              model.prefService.userID.toString(),
                                              model.dateofbithController.text,
                                              model.countryController.text,
                                              model.addressController.text,
                                              _image.toString() );
                                      // Navigator.push(
                                      //     context,
                                      //     PageTransition(
                                      //         type: PageTransitionType.fade,
                                      //         child: ProfileScreen2()));
                                    },
                                    child:  model.loadingWidget==false?Text(
                                      "Continue",
                                      style: TextStyle(
                                        fontFamily: FontUtils.interSemiBold,
                                        fontSize: 1.8.t,
                                        color: ColorUtils.white,
                                        // Color.fromRGBO(2, 104, 81, 1)
                                      ),
                                    ):WidgetLoader()
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: TextWidget(
                                      textValue: "Skip",
                                      fontFamily: FontUtils.interMedium,
                                      fontSize: 1.8.t,
                                      textColor: ColorUtils.tuple,
                                    ),
                                  ),
                                ],
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
