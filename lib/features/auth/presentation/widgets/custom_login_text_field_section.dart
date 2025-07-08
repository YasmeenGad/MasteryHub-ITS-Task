import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/routes/app_routes.dart';
import 'package:mastery_hub_its_task/core/utils/extension/navigation.dart';

import '../../../../core/utils/validators.dart';
import '../../../../core/utils/widgets/app_text_form_field.dart';
import '../../../../core/utils/widgets/buttons/custom_button.dart';
import '../viewModel/auth_action.dart';
import '../viewModel/auth_view_model_cubit.dart';
import 'auth_footer.dart';

class CustomSignInTextFormFieldSection extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AuthViewModelCubit viewModel;

  const CustomSignInTextFormFieldSection({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: emailController,
          hintText: 'Email',
          validator: (value) {
            return Validators.validateEmail(value, context);
          },
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: CustomTextFormField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
            validator: (value) {
              return Validators.validatePassword(value, context);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: CustomButton(
            text: 'Sign Up',
            onTap: () {
              if (formKey.currentState!.validate()) {
                viewModel.doAction(LoginAction(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                ));
              }
            },
          ),
        ),
        AuthFooter(
          onPressed: () {
            context.pushReplacementNamed(AppRoutes.signup);
          },
          actionText: 'Sign Up',
          leadingText: 'Don\'t have an account?',
        ),
      ],
    );
  }
}
