// import 'package:boppo_stream/CommomWidgets/build_app_bar.dart';
// import 'package:boppo_stream/CommomWidgets/custom_button.dart';
// import 'package:boppo_stream/CommomWidgets/image_helper.dart';
// import 'package:boppo_stream/CommomWidgets/input_field.dart';
// import 'package:boppo_stream/Sizer/sizer.dart';
// import 'package:boppo_stream/screens/Login/bloc/login_bloc.dart';
// import 'package:boppo_stream/utils/app_preference.dart';
// import 'package:boppo_stream/utils/flushbar/flushbar_loader.dart';
// import 'package:boppo_stream/utils/progress_loader.dart';
// import 'package:boppo_stream/utils/validation_alert.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../AutoSizeText/auto_size_text.dart';
//
// class MyAccountPage extends StatefulWidget {
//   const MyAccountPage({Key? key}) : super(key: key);
//
//   @override
//   _MyAccountPageState createState() => _MyAccountPageState();
// }
//
// class _MyAccountPageState extends State<MyAccountPage> {
//   final TextEditingController _nameEditingController = TextEditingController();
//   final TextEditingController _dobTextController = TextEditingController();
//   final TextEditingController _ageTextController = TextEditingController();
//   final LoginBloc _loginBloc = LoginBloc();
//   final AppPreferences _preferences = AppPreferences();
//   String? _mobileNumber;
//   String? _genderValue;
//
//   // DateTime? _dateOfBirth;
//   int _age = 1;
//
//   void _getMobileNumber() async {
//     _mobileNumber = await _preferences.getMobileNumber();
//     final _v = await _preferences.getGender();
//     if (_v != '') _genderValue = _v;
//     await _preferences.getDob().then((_value) {
//       print(_value);
//       _dobTextController.text = _value;
//     });
//     await _preferences.getAGE().then((_value) {
//       print(_value);
//       _ageTextController.text = _value;
//     });
//     await _preferences.getFullName().then((_value) {
//       print(_value);
//       _nameEditingController.text = _value;
//     });
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _getMobileNumber();
//   }
//
//   @override
//   void dispose() {
//     _nameEditingController.dispose();
//     _dobTextController.dispose();
//     _ageTextController.dispose();
//     _loginBloc.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: BuildAppBar(title: 'My Profile'),
//         body: _buildLoginBloc(),
//       );
//
//   BlocConsumer<LoginBloc, LoginState> _buildLoginBloc() =>
//       BlocConsumer<LoginBloc, LoginState>(
//         bloc: _loginBloc,
//         listener: (context, state) {
//           if (state is LoginLoading) {
//             showProgressDialog(context);
//           }
//
//           if (state is LoginSuccess) {
//             hideProgressDialog(context);
//             _preferences.saveFullName(name: _nameEditingController.text);
//             _preferences.saveDob(dob: _dobTextController.text);
//             _preferences.saveAGE(age: _ageTextController.text);
//             _preferences.saveGender(gender: _genderValue ?? '');
//             showSuccessFlushbar(context,
//                 message: 'Your profile updated successfully!');
//           }
//
//           if (state is LoginError) {
//             hideProgressDialog(context);
//             showValidationAlert(context, errorMessage: state.error,
//                 onClose: () {
//               Navigator.pop(context);
//             });
//           }
//         },
//         builder: (context, state) => _buildBody(),
//       );
//
//   Widget _buildBody() => SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               AutoSizeText(
//                 'My Account',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 12.sp),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: ImageHelper(
//                   image: 'assets/images/profile_placeholder.png',
//                   imageType: ImageType.asset,
//                   imageShape: ImageShape.circle,
//                   width: 30.w,
//                   height: 30.w,
//                 ),
//               ),
//               InputField(
//                   textEditingController: _nameEditingController,
//                   hintText: "Full name",
//                   onChanged: _loginBloc.onFieldChanged,
//                   charLimit: 50,
//                   textInputType: TextInputType.text,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
//                   ]),
//               const SizedBox(height: 20),
//               // DOBTextWidget(
//               //   textEditingController: _dobTextController,
//               //   onDateTimeChanged: (date) {
//               //     _dateOfBirth = date;
//               //   },
//               // ),
//               InputField(
//                   textEditingController: _ageTextController,
//                   hintText: "Age",
//                   onChanged: _loginBloc.onFieldChanged,
//                   charLimit: 2,
//                   textInputType: TextInputType.number,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(
//                         RegExp('[0-9]{1}[0-9]{0,2}')),
//                   ]),
//               const SizedBox(height: 20),
//               _genderDropdown(),
//               const SizedBox(height: 50),
//               CustomButton(onPressed: _onContinue, label: 'Save')
//             ],
//           ),
//         ),
//       );
//
//   Widget _genderDropdown() => Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(8.0))),
//         padding: const EdgeInsets.all(8.0),
//         child: DropdownButton<String>(
//           value: _genderValue,
//           hint: Text(
//             'Select gender',
//             style: TextStyle(fontSize: 8.sp, color: Colors.black),
//           ),
//           items: <String>[
//             'Male',
//             'Female',
//           ]
//               .map((String value) => DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(
//                       value,
//                       style: TextStyle(fontSize: 8.sp),
//                     ),
//                   ))
//               .toList(),
//           style: TextStyle(color: Colors.black, fontSize: 9.sp),
//           underline: Container(),
//           dropdownColor: Colors.white,
//           onChanged: (value) {
//             setState(() => _genderValue = value);
//           },
//         ),
//       );
//
//   void _calculateAge(DateTime birthDate) {
//     DateTime currentDate = DateTime.now();
//     _age = currentDate.year - birthDate.year;
//     int month1 = currentDate.month;
//     int month2 = birthDate.month;
//     if (month2 > month1) {
//       _age--;
//     } else if (month1 == month2) {
//       int day1 = currentDate.day;
//       int day2 = birthDate.day;
//       if (day2 > day1) {
//         _age--;
//       }
//     }
//   }
//
//   void _onContinue() {
//     if (_ageTextController.text != '') {
//       // _calculateAge(_dateOfBirth!);
//       if (_mobileNumber != null)
//         _loginBloc.add(Upbasicdetail(
//             mobileNumber: _mobileNumber!,
//             dateOfBirth: _dobTextController.text,
//             age: int.parse(_ageTextController.text),
//             gender: (_genderValue == "Male") ? 1 : 2,
//             name: _nameEditingController.text));
//     }
//   }
// }

import 'package:boppo_stream/CommomWidgets/build_app_bar.dart';
import 'package:boppo_stream/CommomWidgets/custom_button.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/CommomWidgets/input_field.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/Login/bloc/login_bloc.dart';
import 'package:boppo_stream/utils/app_preference.dart';
import 'package:boppo_stream/utils/flushbar/flushbar_loader.dart';
import 'package:boppo_stream/utils/progress_loader.dart';
import 'package:boppo_stream/utils/validation_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../AutoSizeText/auto_size_text.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _dobTextController = TextEditingController();
  final TextEditingController _ageTextController = TextEditingController();
  final LoginBloc _loginBloc = LoginBloc();
  final AppPreferences _preferences = AppPreferences();
  String? _mobileNumber;
  String? _genderValue;

  // DateTime? _dateOfBirth;
  int _age = 1;

  void _getMobileNumber() async {
    _mobileNumber = await _preferences.getMobileNumber();
    final _v = await _preferences.getGender();
    if (_v != '') _genderValue = _v;
    await _preferences.getDob().then((_value) {
      print(_value);
      _dobTextController.text = _value;
    });
    await _preferences.getAGE().then((_value) {
      print(_value);
      _ageTextController.text = _value;
    });
    await _preferences.getFullName().then((_value) {
      print(_value);
      _nameEditingController.text = _value;
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getMobileNumber();
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _dobTextController.dispose();
    _ageTextController.dispose();
    _loginBloc.close();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: BuildAppBar(title: 'My Profile'),
        body: _buildLoginBloc(),
      );

  BlocConsumer<LoginBloc, LoginState> _buildLoginBloc() =>
      BlocConsumer<LoginBloc, LoginState>(
        bloc: _loginBloc,
        listener: (context, state) {
          if (state is LoginLoading) {
            showProgressDialog(context);
          }

          if (state is LoginSuccess) {
            hideProgressDialog(context);
            _preferences.saveFullName(name: _nameEditingController.text);
            _preferences.saveDob(dob: _dobTextController.text);
            _preferences.saveAGE(age: _ageTextController.text);
            _preferences.saveGender(gender: _genderValue ?? '');
            showSuccessFlushbar(context,
                message: 'Your profile updated successfully!');
          }

          if (state is LoginError) {
            hideProgressDialog(context);
            showValidationAlert(context, errorMessage: state.error,
                onClose: () {
              Navigator.pop(context);
            });
          }
        },
        builder: (context, state) => _buildBody(),
      );

  Widget _buildBody() => Scaffold(
        body: Form(
          // padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0),
            children: [
              SingleChildScrollView(
                child: Column(children: [
                  AutoSizeText(
                    'My Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ImageHelper(
                      image: 'assets/images/profile_placeholder.png',
                      imageType: ImageType.asset,
                      imageShape: ImageShape.circle,
                      width: 30.w,
                      height: 30.w,
                    ),
                  ),
                  // InputField(
                  //     textEditingController: _nameEditingController,
                  //     hintText: "Full name",
                  //     onChanged: _loginBloc.onFieldChanged,
                  //     charLimit: 50,
                  //     textInputType: TextInputType.text,
                  //     inputFormatters: [
                  //       FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
                  //     ]),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    onChanged: _loginBloc.onFieldChanged,
                    controller: _nameEditingController,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
                    ],
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Full Name'
                        // label: Text('Name'),
                        // labelStyle: TextStyle(color: Colors.black)
                        ),
                    validator: (value) {
                      if (value != null && value.length < 3) {
                        return 'Please Enter your name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  // DOBTextWidget(
                  //   textEditingController: _dobTextController,
                  //   onDateTimeChanged: (date) {
                  //     _dateOfBirth = date;
                  //   },
                  // ),
                  // InputField(
                  //     textEditingController: _ageTextController,
                  //     hintText: "Age",
                  //     onChanged: _loginBloc.onFieldChanged,
                  //     charLimit: 2,
                  //     textInputType: TextInputType.number,
                  //     inputFormatters: [
                  //       FilteringTextInputFormatter.allow(
                  //           RegExp('[0-9]{1}[0-9]{0,2}')),
                  //     ]),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    onChanged: _loginBloc.onFieldChanged,
                    controller: _ageTextController,
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp('[0-9]{1}[0-9]{0,2}')),
                    ],
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Age'),
                    validator: (value) {
                      if (value != null && value.length < 1) {
                        return ' Please Enter your age';
                      } else {
                        return null;
                      }
                    },
                  ),

                  // const SizedBox(height: 10),
                  _genderDropdown(),
                  const SizedBox(height: 50),
                  CustomButton(onPressed: _onContinue, label: 'Save')
                ]),
              ),
            ],
          ),
        ),
      );

  Widget _genderDropdown() => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        // padding: const EdgeInsets.all(60.0),
        padding: const EdgeInsets.symmetric(horizontal: 135.0),
        child: DropdownButton<String>(
          value: _genderValue,
          hint: Text(
            'Select gender',
            style: TextStyle(fontSize: 8.sp, color: Colors.black),
          ),
          items: <String>[
            'Male',
            'Female',
          ]
              .map((String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 8.sp),
                    ),
                  ))
              .toList(),
          style: TextStyle(color: Colors.black, fontSize: 9.sp),
          underline: Container(),
          dropdownColor: Colors.white,
          onChanged: (value) {
            setState(() => _genderValue = value);
          },
        ),
      );

  void _calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    _age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      _age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        _age--;
      }
    }
  }

  // void _onContinue() {
  //   if (_ageTextController.text != '') {
  //     // _calculateAge(_dateOfBirth!);
  //     if (_mobileNumber != null)
  //       _loginBloc.add(Upbasicdetail(
  //           mobileNumber: _mobileNumber!,
  //           dateOfBirth: _dobTextController.text,
  //           age: int.parse(_ageTextController.text),
  //           gender: (_genderValue == "Male") ? 1 : 2,
  //           name: _nameEditingController.text));
  //   }
  // }
  void _onContinue() {
    final isValidForm = formKey.currentState!.validate();
    if (isValidForm) {
      if (_ageTextController.text != '') {
        // _calculateAge(_dateOfBirth!);
        if (_mobileNumber != null)
          _loginBloc.add(Upbasicdetail(
              mobileNumber: _mobileNumber!,
              dateOfBirth: _dobTextController.text,
              age: int.parse(_ageTextController.text),
              gender: (_genderValue == "Male") ? 1 : 2,
              name: _nameEditingController.text));
      }
    }
  }
}
