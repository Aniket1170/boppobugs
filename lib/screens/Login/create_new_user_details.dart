import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/custom_button.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/CommomWidgets/input_field.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/Home/home_tab_page.dart';
import 'package:boppo_stream/screens/Login/bloc/login_bloc.dart';
import 'package:boppo_stream/utils/app_preference.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:boppo_stream/utils/progress_loader.dart';
import 'package:boppo_stream/utils/static_repository.dart';
import 'package:boppo_stream/utils/validation_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewUserDetailsPage extends StatefulWidget {
  final String mobileNumber;

  const CreateNewUserDetailsPage({Key? key, required this.mobileNumber})
      : super(key: key);

  @override
  _CreateNewUserDetailsPageState createState() =>
      _CreateNewUserDetailsPageState();
}

class _CreateNewUserDetailsPageState extends State<CreateNewUserDetailsPage> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _dobTextController = TextEditingController();
  final TextEditingController _ageTextController = TextEditingController();
  final LoginBloc _loginBloc = LoginBloc();
  final AppPreferences _preferences = AppPreferences();
  String? _genderValue;
  DateTime? _dateOfBirth;
  int _age = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _dobTextController.dispose();
    _ageTextController.dispose();
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: blackGradient),
          child: SingleChildScrollView(
            child: _buildLoginBloc(),
          ),
        ),
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
            _navToHome();
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

  Column _buildBody() => Column(
        children: [
          // PersonImageTopWidget(),
          const SizedBox(height: 100),
          ImageHelper(
            image: kSplashImage,
            imageType: ImageType.asset,
            height: 40.w,
            width: 60.w,
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(
                color: tileColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // TextField(
                //   controller: _nameEditingController,
                //   decoration: InputDecoration(
                //     filled: false,
                //     hintText: "Full name",
                //     counterText: '', // to hide charLimit text
                //     // errorText: snapshot.error,
                //     hintStyle: TextStyle(fontSize: 9.sp),
                //   ),
                //   onChanged: _loginBloc.onFieldChanged,
                //   maxLength: 50,
                //   style: TextStyle(fontSize: 9.sp),
                //   keyboardType: TextInputType.text,
                // ),
                const SizedBox(height: 100),
                InputField(
                  borderColor: Colors.transparent,
                  textEditingController: _nameEditingController,
                  // focusNode: _phoneNumberNode,
                  hintText: "Full name",
                  onChanged: _loginBloc.onFieldChanged,
                  charLimit: 50,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                // DOBTextWidget(
                //   textEditingController: _dobTextController,
                //   onDateTimeChanged: (date) {
                //     _dateOfBirth = date;
                //   },
                // ),
                // TextField(
                //   controller: _ageTextController,
                //   decoration: InputDecoration(
                //     filled: false,
                //     hintText: "Age",
                //     counterText: '', // to hide charLimit text
                //     // errorText: snapshot.error,
                //     hintStyle: TextStyle(fontSize: 9.sp),
                //   ),
                //   onChanged: _loginBloc.onFieldChanged,
                //   maxLength: 3,
                //   style: TextStyle(fontSize: 9.sp),
                //   keyboardType: TextInputType.number,
                // ),
                InputField(
                  borderColor: Colors.transparent,
                  textEditingController: _ageTextController,
                  // focusNode: _phoneNumberNode,
                  hintText: "Age",
                  onChanged: _loginBloc.onFieldChanged,
                  charLimit: 3,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                _genderDropdown(),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Spacer(),
                    ElevatedButton(
                        child: AutoSizeText('SKIP',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onPressed: _navToHome),
                    const SizedBox(width: 20),
                    ElevatedButton(
                        child: AutoSizeText('CONTINUE',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onPressed: _onContinue)
                  ],
                )
                // Row(
                //   children: [
                //     CustomButton(onPressed: _navToHome, label: 'SKIP'),
                //     const SizedBox(width: 20),
                //     CustomButton(onPressed: _onContinue, label: 'CONTINUE')
                //   ],
                // ),
              ],
            ),
          ),
        ],
      );

  Widget _genderDropdown() => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        padding: const EdgeInsets.all(8.0),
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

  void _onContinue() {
    if (_ageTextController.text != '') {
      // _calculateAge(_dateOfBirth!);
      _loginBloc.add(Upbasicdetail(
          mobileNumber: widget.mobileNumber,
          dateOfBirth: _dobTextController.text,
          age: int.parse(_ageTextController.text),
          gender: (_genderValue == "Male") ? 1 : 2,
          name: _nameEditingController.text));
    }
  }

  void _navToHome() {
    StaticRepository().setRegistered(register: true);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeTabPage()));
  }
}
