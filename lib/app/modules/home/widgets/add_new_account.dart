import '../../auth/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewAccount extends StatelessWidget {
  final _auth = Get.find<AuthController>();
  final _homecontroller = Get.put(HomeController());
  final _formkey = GlobalKey<FormBuilderState>();

  void _submit() async {
    final isValid = _formkey.currentState!.validate();
    final data = _formkey.currentState!.fields;

    if (isValid) {
      _formkey.currentState!.save();
      await _homecontroller.addAccount(
        data['name']!.value,
        data['wallet']!.value,
        _auth.user!,
      );
      Get.back();
    }
    // _formkey.currentState!.value.clear();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FormBuilderTextField(
              name: 'name',
              key: ValueKey('name'),
              decoration: InputDecoration(
                labelText: 'Account Name',
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(context),
                ],
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 20,
            ),
            FormBuilderTextField(
              name: 'wallet',
              key: ValueKey('wallet'),
              decoration: InputDecoration(
                labelText: 'Ronin Address',
                hintText: 'Example: 0x000000000000000000',
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.minLength(context, 25,
                      errorText: 'Password must greater than 15 characters'),
                  FormBuilderValidators.match(context, "^0x.*\$")
                ],
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 10,
            ),
            TextButton.icon(
              onPressed: _submit,
              icon: Icon(Icons.add_box_rounded),
              label: Text(
                'Add account',
                style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
