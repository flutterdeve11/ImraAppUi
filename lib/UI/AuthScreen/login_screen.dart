import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/svg.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:local_auth/local_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/widget_loader.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../Widgets/text_widget.dart';
import '../../Widgets/textfiled_widget.dart';
import '../../app/locator.dart';
import '../Home/home_bottombarnav_screen.dart';
import '../Home/location_confirm_screen.dart';
import '../Home/location_screen.dart';
import 'forgot_screen.dart';
import 'signup_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final LocalAuthentication auth;
  bool _supportState = false;
  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(
          () {
            _supportState = isSupported;
          },
        ));
  }

  bool _rememberMe = false;
  bool _obscureText = true;
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
                    height: 35,
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
                  const SizedBox(height: 10),
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
                              TextWidget(
                                textValue: "Login",
                                fontFamily: FontUtils.proxima,
                                fontSize: 3.t,
                                textColor: ColorUtils.black,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              // ignore: prefer_const_constructors
                              TextField(
                                controller: model.loginEmailController,
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset(ImageUtils.email),
                                  hintText: 'Enter email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            ColorUtils.tuple.withOpacity(0.5),
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: ColorUtils.tuple, width: 1.5),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //       color: ColorUtils.silver1,
                              //       borderRadius: BorderRadius.circular(10)),
                              //   child: TextField(
                              //     //  controller: controller,
                              //     style: TextStyle(color: ColorUtils.black),
                              //     obscureText: true,
                              //     decoration: InputDecoration(
                              //         prefixIcon: Image.asset(
                              //           ImageUtils.keyicon,
                              //         ),
                              //         suffixIcon: InkWell(
                              //             onTap: () {
                              //               setState(() {
                              //                 _obscureText = !_obscureText;
                              //               });
                              //             },
                              //             child: _obscureText
                              //                 ? Image.asset(
                              //                     ImageUtils.key1icon,
                              //                   )
                              //                 : Image.asset(
                              //                     ImageUtils.key1icon,
                              //                   )),
                              //         contentPadding: EdgeInsets.only(
                              //             left: 5.w,
                              //             top: 2.h,
                              //             right: 2.w,
                              //             bottom: 3.h),
                              //         border: InputBorder.none,
                              //         hintStyle: TextStyle(
                              //             color: ColorUtils.hinttextcolor,
                              //             fontFamily: FontUtils.proxima)),
                              //   ),
                              // ),

                              TextFormFieldCustom(
                                controller: model.loginPasswordController,
                                hintText: "Password",
                              ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //       color: ColorUtils.silver1,
                              //       borderRadius: BorderRadius.circular(10)),
                              //   child: TextField(
                              //     style: TextStyle(color: ColorUtils.black),
                              //     obscureText: true,
                              //     decoration: InputDecoration(
                              //       contentPadding: EdgeInsets.only(
                              //           left: 5.w,
                              //           top: 2.h,
                              //           right: 2.w,
                              //           bottom: 3.h),
                              //       border: InputBorder.none,
                              //       prefixIcon: Image.asset(ImageUtils.keyicon),
                              //       suffixIcon:
                              //           Image.asset(ImageUtils.key1icon),
                              //       hintText: "Password",
                              //     ),
                              //   ),
                              // ),

                              SizedBox(
                                height: 2.h,
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: _rememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              _rememberMe = value!;
                                            });
                                          }),
                                      // SvgPicture.asset(ImageUtils.checkbox),
                                      //SizedBox(width: 1.w),
                                      TextWidget(
                                        textValue: "Remember me",
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 1.6.t,
                                        textColor: ColorUtils.textcolor,
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: ForgotScreen()
                                              //HomeBottombarNavScreen()

                                              ));
                                    },
                                    child: TextWidget(
                                      textValue: "Forgot password?",
                                      fontFamily: FontUtils.proxima,
                                      fontSize: 1.6.t,
                                      textColor: ColorUtils.textcolor,
                                    ),
                                  ),
                                ],
                              ),
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
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      onPressed: () {
                                        model.loadingWidget == true
                                            ? () {}
                                            : model.doUserLogin(
                                                context,
                                                model.loginEmailController.text
                                                    .toString(),
                                                model.loginPasswordController
                                                    .text
                                                    .toString());
                                        // Navigator.push(
                                        //     context,
                                        //     PageTransition(
                                        //         type: PageTransitionType.fade,
                                        //         child: locationScreen()
                                        //         //LocationsConfirmScreen()
                                        //         //HomeBottombarNavScreen()

                                        //         ));
                                      },
                                      child: model.loadingWidget == false
                                          ? Text("Login",
                                              style: TextStyle(
                                                fontFamily:
                                                    FontUtils.interSemiBold,
                                                fontSize: 1.8.t,
                                                color: ColorUtils.white,
                                                // Color.fromRGBO(2, 104, 81, 1)
                                              ))
                                          : WidgetLoader()),
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              TextWidget(
                                textValue: "Continue with Account ",
                                fontFamily: FontUtils.proxima,
                                fontSize: 1.8.t,
                                textColor: ColorUtils.textcolor,
                              ),
                              SizedBox(
                                height: 4.h,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: Image.asset(ImageUtils.google)),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  InkWell(
                                      onTap: () {},
                                      child: Image.asset(ImageUtils.faceBook)),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  InkWell(
                                      onTap: () {},
                                      child: Image.asset(ImageUtils.apple)),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),

                              TextButton(
                                  onPressed: () {},
                                  //Biometrics,
                                  // _getAvailableBiometrics,
                                  child: Image.asset(ImageUtils.thumlock)),
                              // InkWell(
                              //     onTap: () {
                              //       _getAvailableBiometrics;
                              //     },
                              //     child: Image.asset(ImageUtils.thumlock)),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    textValue: "Create new account? ",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.8.t,
                                    textColor: ColorUtils.textcolor,
                                  ),
                                  // SizedBox(
                                  //   width: 1.w,
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: SignUpScreen()));
                                    },
                                    child: TextWidget(
                                      textValue: "Sign Up",
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

  Future<void> Biometrics() async {
    try {
      bool authenticated = await auth.authenticate(
          localizedReason: 'biometics',
          options: const AuthenticationOptions(
              stickyAuth: true, biometricOnly: false));
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade, child: LocationsConfirmScreen()
              //HomeBottombarNavScreen()

              ));
      print('Authenticated : $authenticated');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    print('list of availablebiometire: $availableBiometrics');
    if (!mounted) {
      return;
    }
  }
}
