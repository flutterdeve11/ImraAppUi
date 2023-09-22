import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imraapp/UI/documents/add_document_screen2.dart';
import 'package:imraapp/UI/documents/document_screen.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../../Utils/color_utils.dart';
import '../../../Utils/font_utils.dart';
import '../../../Utils/image_utils.dart';
import '../../../ViewModels/main_view_model.dart';
import '../../../Widgets/custom_text_field.dart';
import '../../../Widgets/customtextfield.dart';
import '../../../Widgets/page_horizontal_margin.dart';
import '../../../Widgets/text_widget.dart';
import '../../../Widgets/textfiled_widget.dart';
import '../../../app/locator.dart';
import '../../Utils/widget_loader.dart';

class AddDocumentScreen extends StatefulWidget {
  const AddDocumentScreen({Key? key}) : super(key: key);

  @override
  State<AddDocumentScreen> createState() => _AddDocumentScreenState();
}

class _AddDocumentScreenState extends State<AddDocumentScreen> {
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
                                  textValue: "Add New Document",
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
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Document Name",
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
                                  controller: model.docnameController,
                                  decoration: InputDecoration(
                                      hintText: '',
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
                                    textValue: "Description",
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
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: ColorUtils.silver1,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextField(
                                  controller: model.descpController,
                                  //textAlign: TextAlign.justify,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                      hintText: '',
                                      hintStyle: TextStyle(
                                          color: ColorUtils.black,
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 16),
                                      contentPadding: EdgeInsets.only(
                                          left: 1.w,
                                          // top: 2.h,
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
                              InkWell(
                                onTap: () {
                                  _pickImage(ImageSource.gallery);
                                  //_settingModalBottomSheet(context);
                                },
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(5),
                                  color: const Color(0xFFAAAFBB),
                                  strokeWidth: 2,
                                  dashPattern: const [
                                    5,
                                    5,
                                  ],
                                  child: Container(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(ImageUtils.upload),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Text(
                                          "Upload Document",
                                          style: TextStyle(
                                            fontFamily: FontUtils.interSemiBold,
                                            fontSize: 1.4.t,
                                            color: ColorUtils.silver,
                                            // Color.fromRGBO(2, 104, 81, 1)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                             Container(
                               child: _image!=null? ListTile(
                                 leading:Container(
                                   width: 100,
                                   height: 50,
                                   child: Image.file(_image!,fit: BoxFit.cover,),
                                 ) ,
                                 title: Text('Documet')
                                 //Text(_image.toString()),
                               ):child
                             ),
                             // Row(children: [Container(
                             //   width: 100,
                             //   height: 50,
                             //   child: Image.file(_image!,fit: BoxFit.cover,),)],),
                              //Text(_image.toString()),
                              SizedBox(
                                height: 20.h,
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
                                      color: const Color(0xFFF7F7F9)),
                                  child: MaterialButton(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    onPressed: () async{

                                      model.loadingWidget == true
                                          ? () {} : await model.doDoc(context,
                                          model.docnameController.text,
                                          model.descpController.text,
                                          _image!.toString(),
                                      );
                                      // Navigator.push(
                                      //     context,
                                      //     PageTransition(
                                      //         type: PageTransitionType.fade,
                                      //         child: DocumentScreen()));
                                    },
                                    child: model.loadingWidget==false? Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontFamily: FontUtils.interSemiBold,
                                        fontSize: 1.8.t,
                                        color: ColorUtils.silver,
                                        // Color.fromRGBO(2, 104, 81, 1)
                                      ),
                                    ):WidgetLoader()
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

void _settingModalBottomSheet(context) {

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
          child: Column(
            children: <Widget>[
              ListTile(
                  leading: SvgPicture.asset(ImageUtils.camera),
                  title: TextWidget(
                    textValue: "Open Camera",
                    fontFamily: FontUtils.proxima,
                    fontSize: 2.3.t,
                    textColor: ColorUtils.black,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         type: PageTransitionType.fade,
                    //         child: const AddDocumentScreen2()));
                  }),
              // ignore: unnecessary_new
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: const AddDocumentScreen2()));
                },
                leading: SvgPicture.asset(ImageUtils.file),
                title: TextWidget(
                  textValue: "Browse File",
                  fontFamily: FontUtils.proxima,
                  fontSize: 2.3.t,
                  textColor: ColorUtils.black,
                ),
              ),
            ],
          ),
        );
      });
}
