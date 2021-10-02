import '../../controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends GetView<AuthController> {
  final _formkey = GlobalKey<FormBuilderState>();

  void _submit() async {
    final isValid = _formkey.currentState!.validate();
    final data = _formkey.currentState!.fields;
    FocusManager.instance.primaryFocus?.unfocus();

    if (isValid) {
      _formkey.currentState!.save();
      controller.login(
        data['email']!.value,
        data['password']!.value,
      );
    }
    // _formkey.currentState!.value.clear();
  }

  void _createAccount() async {
    final isValid = _formkey.currentState!.validate();
    final data = _formkey.currentState!.fields;

    if (isValid) {
      _formkey.currentState!.save();
      controller.signUp(
        data['email']!.value,
        data['password']!.value,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 25),
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 6,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: FormBuilder(
                  key: _formkey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'email',
                        key: ValueKey('email'),
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.email(context),
                          ],
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      FormBuilderTextField(
                        name: 'password',
                        key: ValueKey('password'),
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.minLength(context, 7,
                                errorText:
                                    'Password must greater than 7 characters'),
                          ],
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => controller.isLogin.isFalse
                            ? TextButton.icon(
                                onPressed: _submit,
                                icon: Icon(Icons.send_rounded),
                                label: Text(
                                  'Login',
                                  style: GoogleFonts.openSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ))
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                      ),
                      Obx(
                        () => TextButton(
                          onPressed: _createAccount,
                          child: controller.isSignUp.isFalse
                              ? Text(
                                  'Create new account?',
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
