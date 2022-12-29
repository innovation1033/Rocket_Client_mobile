
import 'package:flutter/material.dart';

import '../../../resource/colors_manager.dart';
import '../../../resource/routes_manager.dart';
import '../../shared_widget/custom_button_widget.dart';
import '../../shared_widget/custom_textFormField_widget.dart';

String password = '', confirm_password = '';

class RestNewPassword extends StatefulWidget {
  RestNewPassword();

  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<RestNewPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSwitched = false;
  bool isVisible = false;
  bool showPassword = true;

  bool showPasswordAgain = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordControllerVerify = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: (MediaQuery.of(context).size.width) - 20,
            padding: EdgeInsets.only(top: 40, right: 10, left: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "تغير كملة المرور",
                    style: TextStyle(
                      color: ColorManager.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CustomTextFormField(
                                isPassword: showPassword,
                                validator: (value) {
                                  if (value == null ||
                                      value.length < 8 ||
                                      value.isEmpty) {
                                    return 'كلمة المرور لا تقل عن 8  أحرف';
                                  }
                                  return null;
                                },
                                suffixIcon: showPassword == true
                                    ? IconButton(
                                        icon: Icon(Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            showPassword = !showPassword;
                                          });
                                        },
                                      )
                                    : IconButton(
                                        icon:
                                            Icon(Icons.remove_red_eye_rounded),
                                        onPressed: () {
                                          setState(() {
                                            showPassword = !showPassword;
                                          });
                                        },
                                      ),
                                textEditingController: passwordController,
                                text: 'كلمة المرور',
                                keyBoardType: TextInputType.visiblePassword),
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                                isPassword: showPassword,
                                validator: (value) {
                                  if (value == null ||
                                      value.length < 8 ||
                                      value.isEmpty) {
                                    return 'كلمة المرور لا تقل عن 8  أحرف';
                                  }
                                  return null;
                                },
                                suffixIcon: showPasswordAgain == true
                                    ? IconButton(
                                        icon: Icon(Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            showPasswordAgain =
                                                !showPasswordAgain;
                                          });
                                        },
                                      )
                                    : IconButton(
                                        icon:
                                            Icon(Icons.remove_red_eye_rounded),
                                        onPressed: () {
                                          setState(() {
                                            showPasswordAgain =
                                                !showPasswordAgain;
                                          });
                                        },
                                      ),
                                textEditingController: passwordControllerVerify,
                                text: 'تاكيد كلمة المرور',
                                keyBoardType: TextInputType.visiblePassword),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 2.5,
                            ),
                            CustomButton(
                              function: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushReplacementNamed(
                                      context, Routes.loginScreen);
                                }
                              },
                              text: "تغير كلمة المرور",
                              color: ColorManager.primaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
