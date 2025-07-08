import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastery_hub_its_task/core/utils/extension/navigation.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/base/snack_bar.dart';
import 'package:mastery_hub_its_task/features/auth/presentation/viewModel/auth_view_model_cubit.dart';
import 'package:mastery_hub_its_task/features/auth/presentation/widgets/auth_header.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../di/di.dart';
import '../widgets/custom_login_text_field_section.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final AuthViewModelCubit _viewModel;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _viewModel = getIt.get<AuthViewModelCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _viewModel,
      child: BlocListener<AuthViewModelCubit, AuthViewModelState>(
        listener: (context, state) {
          switch (state) {
            case SignInLoading():
              return aweSnackBar(
                title: 'Signing you in...',
                msg: 'Please wait while we log you into your account.',
                context: context,
                type: MessageTypeConst.help,
              );

            case SignInSuccess():
              aweSnackBar(
                title: 'Welcome back!',
                msg: 'You have successfully signed in.',
                context: context,
                type: MessageTypeConst.success,
              );
              context.pushReplacementNamed(AppRoutes.home);

            case SignInFailure():
              return aweSnackBar(
                title: 'Sign in failed',
                msg: state.failureMessage.toString(),
                context: context,
                type: MessageTypeConst.failure,
              );
            default:
              return;
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const AuthHeader(text: 'Sign In'),
                Form(
                  key: _formKey,
                  child: CustomSignInTextFormFieldSection(
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    viewModel: _viewModel,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
