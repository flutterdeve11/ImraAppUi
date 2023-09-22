import 'package:country_flags/country_flags.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:intl_phone_field/countries.dart';
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
import '../createprofilescreen/profile_screen1.dart';
import '../profilescreen/edit_user_profile_screen2.dart';
import 'filter_screen.dart';
import 'package:country_icons/country_icons.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  int? selectedOption = 1;
  @override
  Widget build(BuildContext context) {
    double _startValue = 500;
    double _endValue = 3000;
    // int selectedOption = 1;
    String? selectedCountry;
    String countryValue = "";
    String stateValue = "";
    String cityValue = "";
    String address = "";

    List<Map<String, dynamic>> countries = [
      {'name': 'USA', 'imagePath': '"assets/images/us.png"'},
      {'name': 'Canada', 'imagePath': '"assets/images/us.png"'},
      {'name': 'Australia', 'imagePath': '"assets/images/us.png"'},
    ];
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
                        // Center(
                        //   child: CountryFlag.fromCountryCode(
                        //     'ES',
                        //     height: 48,
                        //     width: 62,
                        //     borderRadius: 8,
                        //   ),
                        // ),
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
                              "Selcet country ",
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
                                hintText: 'Search Country',
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.search))),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),

                        // CSCPicker(
                        //   showStates: false,
                        //   showCities: false,
                        //   countrySearchPlaceholder: "Country",
                        //   selectedItemStyle: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 14,
                        //   ),
                        //   onCountryChanged: (value) {
                        //     setState(() {
                        //       ///store value in country variable
                        //       countryValue = value;
                        //     });
                        //   },
                        //
                        //   ///triggers once state selected in dropdown
                        //
                        //
                        //   ///triggers once city selected in dropdown
                        //
                        //
                        //   ///Show only specific countries using country filter
                        //   // countryFilter: ["United States", "Canada", "Mexico"],
                        // ),

                        // Text(countryValue),
                        // CSCPicker(
                        //   showStates: true,
                        //   showCities: true,
                        //   /// Enable disable
                        //   countrySearchPlaceholder: "Country",
                        //   selectedItemStyle: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 14,
                        //   ),
                        //   onCountryChanged: (value) {
                        //     setState(() {
                        //       ///store value in country variable
                        //       countryValue = value;
                        //     });
                        //   },
                        //   onStateChanged: (value) {
                        //     setState(() {
                        //       ///store value in state variable
                        //       stateValue = value!;
                        //     });
                        //   },
                        //
                        // ),
                        // ListTile(
                        //   title: const Text('United States'),
                        //   leading: Image.asset(ImageUtils.us),
                        //   trailing: Radio<int>(
                        //     value: 1,
                        //     groupValue: selectedOption,
                        //     onChanged: (int? value) {
                        //       setState(() {
                        //         selectedOption = value!;
                        //         print("Selected Option: $selectedOption");
                        //       });
                        //     },
                        //   ),
                        // ),
                        // //2
                        // Text(selectedOption.toString()),
                        // ListTile(
                        //   title: const Text('Australia'),
                        //   leading: Image.asset(ImageUtils.australia),
                        //   trailing: Radio<int>(
                        //     value: 2,
                        //     groupValue: selectedOption,
                        //     onChanged: (int? value) {
                        //       setState(() {
                        //         selectedOption = value!;
                        //         // print("Selected Option: $selectedOption");
                        //       });
                        //     },
                        //   ),
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         Image.asset(ImageUtils.us),
                        //         SizedBox(
                        //           width: 3.w,
                        //         ),
                        //         Text(
                        //           "United States",
                        //           style: TextStyle(
                        //             fontFamily: FontUtils.proxima,
                        //             fontSize: 14,
                        //             // color: Colors.black,
                        //             fontWeight: FontWeight.w600,
                        //           ),
                        //         ),
                        //       ],
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
                          height: 2.h,
                        ),
                        ListTile(
                          title: const Text('United Kingdom'),
                          leading: Image.asset(ImageUtils.uk),
                          trailing: Radio<int>(
                            value: 3,
                            groupValue: selectedOption,
                            onChanged: (int? value) {
                              setState(() {
                                selectedOption = value!;
                                // print("Selected Option: $selectedOption");
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ListTile(
                          title: const Text('Netherland'),
                          leading: Image.asset(ImageUtils.netherland),
                          trailing: Radio<int>(
                            value: 4,
                            groupValue: selectedOption,
                            onChanged: (int? value) {
                              setState(() {
                                selectedOption = value!;
                                // print("Selected Option: $selectedOption");
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ListTile(
                          title: const Text('Germany'),
                          leading: Image.asset(ImageUtils.germany),
                          trailing: Radio<int>(
                            value: 5,
                            groupValue: selectedOption,
                            onChanged: (int? value) {
                              setState(() {
                                selectedOption = value!;
                                // print("Selected Option: $selectedOption");
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ListTile(
                          title: const Text('United ArabEnirates'),
                          leading: Image.asset(ImageUtils.flagimg),
                          trailing: Radio<int>(
                            value: 6,
                            groupValue: selectedOption,
                            onChanged: (int? value) {
                              setState(() {
                                selectedOption = value!;
                                // print("Selected Option: $selectedOption");
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ListTile(
                          title: const Text('Canada'),
                          leading: Image.asset(ImageUtils.canada),
                          trailing: Radio<int>(
                            value: 7,
                            groupValue: selectedOption,
                            onChanged: (int? value) {
                              setState(() {
                                selectedOption = value!;
                                // print("Selected Option: $selectedOption");
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
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
                                  borderRadius: BorderRadius.circular(25)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: ProfileScreen1()
                                        //EditUserProfileScreen2()

                                        ));
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
