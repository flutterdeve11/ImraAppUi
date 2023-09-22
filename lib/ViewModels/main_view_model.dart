import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imraapp/UI/createprofilescreen/profile_screen2.dart';
import 'package:imraapp/UI/splash_screen.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Utils/image_utils.dart';
import 'package:imraapp/model/medication_history_model.dart';
import 'package:imraapp/services/post/create_mdeical.dart';
import 'package:imraapp/services/post/create_profile.dart';
import 'package:imraapp/services/post/post_signup.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../App/locator.dart';
import '../UI/AUthScreen/login_screen.dart';
import '../UI/Home/location_confirm_screen.dart';
import '../UI/Home/location_screen.dart';
import '../UI/createprofilescreen/profile_screen1.dart';
import '../UI/createprofilescreen/profile_screen3.dart';
import '../UI/profilescreen/edit_user_profile_screen2.dart';
import '../Utils/font_utils.dart';
import '../Widgets/bottom_navigation_bar.dart';
import '../model/login/userLoginModel.dart';
import '../model/medical_history_model.dart';
import '../modules/navigation_service.dart' as my_nav_service;
import '../services/get/get_medical_history.dart';
import '../services/get/get_medication_history.dart';
import '../services/post/create_document.dart';
import '../services/post/create_medication.dart';
import '../services/post/post_login.dart';
import 'prefrences_view_model.dart';

class MainViewModel extends BaseViewModel {
  var navigationService = my_nav_service.NavigationService();
  bool loadingWidget = false;
  var prefService = locator<PreferencesViewModel>();
  String? token;
  String? fullname;
  String? email;
  String? phone;
  String? userID;
  String? avatar;
  String? country;
  String? loction;

  void goToLogin(BuildContext context) async {
    await prefService.getUserToken();
    token = prefService.userToken;
    await prefService.getUserID();
    userID = prefService.userID;
    await prefService.getUserName();
    fullname = prefService.userName;
    await prefService.getUserEmail();
    email = prefService.userEmail;
    await prefService.getUserPhone();
    phone = prefService.userPhone;
    await prefService.getUserAvatar();
    avatar = prefService.userAvatar;

    if (token != null) {}
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: token == null ? const Login() : MyBottomNavBar())),
    );
  }

  List myRoutine = [
    {
      "question": "Do you exercise?",
      "ans": "Regular ",
    },
    {
      "question": "Which type of food do\nyou usually eat?",
      "ans": "Junk Food",
    },
    {
      "question": "Do You smoke?",
      "ans": "Regular",
    },
  ];

  List FAQs = [
    {
      "question": "What is IMRA??",
      "answer":
          "Lorem ipsum dolor sit amet consectetur. In ut fermentum elementum vestibulum quam urna purus eu morbi. Platea aliquet duis sed massa imperdiet aliquet nec. Risus lorem neque in urna accumsan leo sagittis. Tristique blandit sit tellus tortor.",
    },
    {
      "question": "Lorem ipsum dolor sit amet consectetur.",
      "answer":
          "Lorem ipsum dolor sit amet consectetur. In ut fermentum elementum vestibulum quam urna purus eu morbi. Platea aliquet duis sed massa imperdiet aliquet nec. Risus lorem neque in urna accumsan leo sagittis. Tristique blandit sit tellus tortor.",
    },
    {
      "question": "Lorem ipsum dolor sit consectetur?",
      "answer":
          "Lorem ipsum dolor sit amet consectetur. In ut fermentum elementum vestibulum quam urna purus eu morbi. Platea aliquet duis sed massa imperdiet aliquet nec. Risus lorem neque in urna accumsan leo sagittis. Tristique blandit sit tellus tortor.",
    },
    {
      "question": "Lorem ipsum dolor sit amet.?",
      "answer":
          "Lorem ipsum dolor sit amet consectetur. In ut fermentum elementum vestibulum quam urna purus eu morbi. Platea aliquet duis sed massa imperdiet aliquet nec. Risus lorem neque in urna accumsan leo sagittis. Tristique blandit sit tellus tortor.",
    },
    {
      "question": "Lorem ipsum dolor amet consectetur.",
      "answer":
          "Lorem ipsum dolor sit amet consectetur. In ut fermentum elementum vestibulum quam urna purus eu morbi. Platea aliquet duis sed massa imperdiet aliquet nec. Risus lorem neque in urna accumsan leo sagittis. Tristique blandit sit tellus tortor.",
    },
    {
      "question": "Lorem ipsum dolor sit amet consectetur?",
      "answer":
          "Lorem ipsum dolor sit amet consectetur. In ut fermentum elementum vestibulum quam urna purus eu morbi. Platea aliquet duis sed massa imperdiet aliquet nec. Risus lorem neque in urna accumsan leo sagittis. Tristique blandit sit tellus tortor.",
    },
  ];
  //news highlights
  List news = [
    {
      "image": Image.asset(ImageUtils.newsimg1),
      // "ans": "Regular test",
    },
    {
      "image": Image.asset(ImageUtils.newsimg2),
      // "ans": "Regular test",
    },
    {
      "image": Image.asset(ImageUtils.newsimg3),
      // "ans": "Regular test",
    },
  ];

  //document

  //news highlights
  List documentList = [
    {
      "image": ImageUtils.pdf,
      // "ans": "Regular test",
    },
    {
      "image": ImageUtils.jpg,
      // "ans": "Regular test",
    },
    {
      "image": ImageUtils.pdf,
      // "ans": "Regular test",
    },
    {
      "image": ImageUtils.pdf,
      // "ans": "Regular test",
    },
    {
      "image": ImageUtils.jpg,
      // "ans": "Regular test",
    },
  ];
//######################## Start create medical history api ############################
  TextEditingController procedureController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController centerController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var userMedical = CreateMedical();

  Future UserMedicalHistory(BuildContext context, String userId,
      String procedure, String reason, String medCenter, String date) async {
    if (procedureController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Procedure");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (reasonController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Reason");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (centerController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Center name");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (dateController.text.isEmpty) {
      showErrorMessage(context, "Please Selected date");
      //gotPhoneOtp = false;
      notifyListeners();
    } else {
      loadingWidget = true;
      notifyListeners();
      var medicalResponse = await userMedical.medical(
        userId.toString(),
        procedureController.text.toString(),
        reasonController.text.toString(),
        centerController.text.toString(),
        dateController.text.toString(),
      );
      // print(signupResponse);
      // showErrorMessage(context, signupResponse);
      loadingWidget = false;
      notifyListeners();
      //Navigator.pop(context);
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: const EditUserProfileScreen2()
              //Login()

              ));
    }
  }
//######################## End create medical history api ############################

//######################## Start create medication history api ############################

  TextEditingController medicineController = TextEditingController();
  TextEditingController reasonsController = TextEditingController();
  TextEditingController prescribedController = TextEditingController();
  TextEditingController datefromController = TextEditingController();
  TextEditingController datetoController = TextEditingController();
  var userMedication = CreateMedication();

  Future UserMedicationHistory(
      BuildContext context,
      String userId,
      String medicine,
      String reason,
      String prescribed,
      String datefrom,
      String dateto) async {
    if (medicineController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Medicine");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (reasonsController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Reason");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (prescribedController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Prescribed");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (datefromController.text.isEmpty) {
      showErrorMessage(context, "Please Selected date form");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (datetoController.text.isEmpty) {
      showErrorMessage(context, "Please Selected date to");
    } else {
      loadingWidget = true;
      notifyListeners();
      var medicalResponse = await userMedication.medication(
          userId.toString(),
          medicineController.text.toString(),
          reasonsController.text.toString(),
          prescribedController.text.toString(),
          datefromController.text.toString(),
          datetoController.text.toString());
      // print(signupResponse);
      // showErrorMessage(context, signupResponse);
      loadingWidget = false;
      notifyListeners();
      //Navigator.pop(context);
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: const EditUserProfileScreen2()
              //Login()

              ));
    }
  }

//######################## end create medication history api ############################
//######################## Start singup api ############################
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPhoneController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController =
      TextEditingController();

  var userSignup = UserSignUp();

  Future doUserSignup(BuildContext context, String fullname, String email,
      String phonenumber, String password, String confirmPassword) async {
    if (signupNameController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Name");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (signupEmailController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Email");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (signupPhoneController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Phone No");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (signupPasswordController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Password");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (signupConfirmPasswordController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Confirm Password");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (signupPasswordController.text !=
        signupConfirmPasswordController.text) {
      showErrorMessage(context, "Passwords don't match");
      //gotPhoneOtp = false;
      notifyListeners();
    } else {
      loadingWidget = true;
      notifyListeners();
      var signupResponse = await userSignup.signup(
          signupNameController.text.toString(),
          signupEmailController.text.toString(),
          signupPhoneController.text.toString(),
          signupPasswordController.text.toString(),
          signupConfirmPasswordController.text.toString());
      // print(signupResponse);
      // showErrorMessage(context, signupResponse);
      loadingWidget = false;
      notifyListeners();
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade, child: const ProfileScreen1()
              // Login()

              ));
    }
  }

//######################## End singup api ############################

//######################## Start login api ############################
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  var getLogin = UserLoginGet();
  bool rememberMe = true;

  Future doUserLogin(
      BuildContext context, String userId, String password) async {
    if (loginEmailController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Email");
    } else if (loginPasswordController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Password");
    } else {
      loadingWidget = true;
      notifyListeners();
      var response = await getLogin.loginUser(userId, password);
      if (response != null && response is UserLoginModel) {
        token = response.token!;
        prefService.saveUserToken(token!);
        userID = response.data!.id;
        prefService.saveUserID(userID!);
        print(' this is user id ${userID}');
        fullname = response.data!.fullname!;
        prefService.saveUserName(fullname!);
        print('this is name ${fullname}');
        // await prefService.getUserName();
        // fullname = prefService.userName;
        email = response.data!.email!;
        prefService.saveUserEmail(email!);
        phone = response.data!.phonenumber;
        prefService.saveUserPhone(phone!);
        avatar = response.data!.avatar!;
        prefService.saveUserAvatar(avatar!);
        // loction= response.data.l
        loadingWidget = false;
        navigationService.navigateToUntil(to: const locationScreen()

            // LocationsConfirmScreen()
            );
      } else {
        showErrorMessage(context, "Something Went Wrong");
      }
    }
    loadingWidget = false;
    notifyListeners();
  }

//######################## End login api ############################

//######################## Start create profile api ############################
  TextEditingController dateofbithController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  var profile = UserProfile();

  Future doUserProfile(
    BuildContext context,
    String date_of_birth,
    String country,
    String address,
    String avatar,
    String id,
  ) async {
    if (dateofbithController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Date of Birth");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (countryController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Country");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (addressController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Location");
      //gotPhoneOtp = false;
      notifyListeners();
    } else {
      loadingWidget = true;
      notifyListeners();
      var signupResponse = await profile.userProfile(
          // token!,
          userID.toString(),
          dateofbithController.text.toString(),
          countryController.text.toString(),
          addressController.text.toString(),
          avatar.toString());
      // print(signupResponse);
      // showErrorMessage(context, signupResponse);
      loadingWidget = false;
      notifyListeners();
      // Navigator.pop(context);
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade, child: const ProfileScreen2()
              // Login()

              ));
    }
  }

  TextEditingController docnameController = TextEditingController();
  TextEditingController descpController = TextEditingController();

  var doc = UserDocument();
  Future doDoc(BuildContext context, String doc_name, String description,
      String document) async {
    if (docnameController.text.isEmpty) {
      showErrorMessage(context, "Please Enter  doc Name");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (descpController.text.isEmpty) {
      showErrorMessage(context, "Please Enter description");
      //gotPhoneOtp = false;
      notifyListeners();
    } else {
      loadingWidget = true;
      notifyListeners();
      var docResponse = await doc.document(
        docnameController.text.toString(),
        descpController.text.toString(),
        document.toString(),
      );
      // print(signupResponse);
      // showErrorMessage(context, signupResponse);
      loadingWidget = false;
      notifyListeners();
      Navigator.pop(context);
      // Navigator.push(context,
      //     PageTransition(type: PageTransitionType.fade, child:
      //     ProfileScreen1()
      //       //Login()
      //
      //     ));
    }
  }

// On LogOut
  void onLogout() async {
    await prefService.removeUserToken();
    // prefService.removeUserAddress();
    navigationService.navigateToUntil(to: const Login());
  }

// ########### Get medical  histroy api start #############
  GetMedicalHostory getmedical = GetMedicalHostory();
  List<MedicalHistoryModel>? medicalhistory =
      MedicalHistoryCompleteModel().data;
  bool medicalhistoryLoader = false;
  Future gettingMedicalhistory(BuildContext context, String userId) async {
    medicalhistoryLoader = true;

    var gethistoryResponse = await getmedical.getmedicalHistory(userId);
    if (gethistoryResponse != null &&
        gethistoryResponse is List<MedicalHistoryModel>) {
      medicalhistory = gethistoryResponse;
      medicalhistoryLoader = false;
      notifyListeners();
    } else {
      medicalhistoryLoader = false;
      notifyListeners();
    }
    medicalhistoryLoader = false;
  }

// ########### Get medical  histroy api end #############
// ########### Get medical  histroy api start #############
  GetMedicationHostory getmedication = GetMedicationHostory();
  List<MedicationHistoryModel>? medicationhistory =
      MedicationHistoryCompleteModel().data;
  bool medicationhistoryLoader = false;
  Future gettingMedicationhistory(BuildContext context, String userId) async {
    medicationhistoryLoader = true;

    var getmedictionResponse = await getmedication.getmedicationHistory(userId);
    if (getmedictionResponse != null &&
        getmedictionResponse is List<MedicationHistoryModel>) {
      medicationhistory = getmedictionResponse;
      medicationhistoryLoader = false;
      notifyListeners();
    } else {
      medicationhistoryLoader = false;
      notifyListeners();
    }
    medicationhistoryLoader = false;
  }
// ########### Get medical  histroy api end #############

//####################### Show Error Message #########################
  void showErrorMessage(BuildContext context, String error) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        error,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: FontUtils.poppinsBold,
          fontSize: 1.8.t,
        ),
      ),
      backgroundColor: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      elevation: 10,
      duration: const Duration(seconds: 2),
    ));
  }
}
