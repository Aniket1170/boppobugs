import 'dart:io';

import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/build_app_bar.dart';
import 'package:boppo_stream/CommomWidgets/custom_button.dart';
import 'package:boppo_stream/CommomWidgets/input_field.dart';
import 'package:boppo_stream/DottedBorder/dotted_border.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/utils/flushbar/flushbar_loader.dart';
import 'package:boppo_stream/utils/hide_keyboard.dart';
import 'package:boppo_stream/utils/progress_loader.dart';
import 'package:boppo_stream/utils/validation_alert.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/contactus_bloc.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final ContactusBloc _bloc = ContactusBloc();
  FilePickerResult? _pickerResult;
  File? _file;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: BuildAppBar(title: ''),
        body: SafeArea(
          child: _buildBloc(),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(onPressed: _onContinue, label: 'Submit'),
        ),
      );

  BlocConsumer<ContactusBloc, ContactusState> _buildBloc() =>
      BlocConsumer<ContactusBloc, ContactusState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is ContactusLoading) {
            showProgressDialog(context);
          }

          if (state is ContactusSuccess) {
            hideProgressDialog(context);

            showSuccessFlushbar(context,
                message: 'Your query submitted successfully!');
          }

          if (state is ContactusError) {
            hideProgressDialog(context);
            showValidationAlert(context, errorMessage: state.error,
                onClose: () {
              Navigator.pop(context);
            });
          }
        },
        builder: (context, state) => _messageWidget(),
      );

  Widget _messageWidget() => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10.w),
              Row(
                children: [
                  AutoSizeText(
                    'Contact Us',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(width: 10),
                  Icon(Icons.messenger_outline, size: 25),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: InputField(
                  textEditingController: _textEditingController,
                  // borderColor: Colors.black,
                  multilines: true,
                  hintColor: Colors.grey,
                  hintText: "Message",
                  // onChanged: _bloc.onFieldChanged,
                  charLimit: 300,
                  textInputType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                ),
              ),
              const SizedBox(height: 30),
              AutoSizeText("Attach File",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp)),
              const SizedBox(height: 16),
              (_file != null)
                  ? Container(
                      width: 200,
                      height: 300,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.file(
                            _file!,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                              left: 120,
                              top: -10,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54),
                                child: InkWell(
                                  onTap: _removeSelectedImage,
                                  child: Icon(Icons.close_outlined, size: 30),
                                ),
                              ))
                        ],
                      ),
                    )
                  : DottedBorder(
                      color: Colors.white,
                      dashPattern: [14, 14],
                      child: Container(
                          width: double.infinity,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: ElevatedButton(
                                child: AutoSizeText('Upload',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                onPressed: _onAddFile),
                          )),
                    ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );

  void _removeSelectedImage() {
    setState(() => _file = null);
  }

  Future<void> _onAddFile() async {
    hideKeyboard(context);
    _pickerResult = await FilePicker.platform.pickFiles(type: FileType.image);

    if (_pickerResult != null) {
      _file = File(_pickerResult!.files.single.path!);
    } else {
      // User canceled the picker
    }
    setState(() {});
  }

  void _onContinue() {
    hideKeyboard(context);
    if (_textEditingController.text != '') {
      if (_file != null) {
        _bloc.add(Contactus(
            message: _textEditingController.text, filePath: _file!.path));
      } else {
        showValidationAlert(context, errorMessage: 'Please select file',
            onClose: () {
          Navigator.pop(context);
        });
      }
    } else {
      showValidationAlert(context, errorMessage: 'Please enter message',
          onClose: () {
        Navigator.pop(context);
      });
    }
  }
}
