import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/utils/validators.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/buttons/custom_button.dart';
import 'package:mastery_hub_its_task/features/auth/presentation/widgets/auth_header.dart';

import '../../../../core/utils/widgets/app_text_form_field.dart';
import '../widgets/auth_footer.dart';

class SignUpView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const AuthHeader(text: 'Sign Up'),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                          hintText: 'Username',
                          validator: (value) {
                            return Validators.validateNotEmpty(
                              context: context,
                              title: 'Username',
                              value: value,
                            );
                          }),
                      const SizedBox(height: 16.0),
                      CustomTextFormField(
                          hintText: 'Email',
                          validator: (value) {
                            return Validators.validateEmail(value, context);
                          }),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: CustomTextFormField(
                            hintText: 'Password',
                            obscureText: true,
                            validator: (value) {
                              return Validators.validatePassword(
                                  value, context);
                            }),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: CustomButton(text: 'Sign Up')),
                      AuthFooter(),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
