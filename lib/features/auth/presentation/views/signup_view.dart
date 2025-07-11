import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastery_hub_its_task/core/utils/extension/navigation.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/base/snack_bar.dart';
import 'package:mastery_hub_its_task/features/auth/presentation/viewModel/auth_view_model_cubit.dart';
import 'package:mastery_hub_its_task/features/auth/presentation/widgets/auth_header.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../di/di.dart';
import '../widgets/custom_signup_text_form_field_section.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _userNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final AuthViewModelCubit _viewModel;

  @override
  void initState() {
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _viewModel = getIt.get<AuthViewModelCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _viewModel,
      child: BlocListener<AuthViewModelCubit, AuthViewModelState>(
        listener: (context, state) {
          switch (state) {
            case SignUpLoading():
              return aweSnackBar(
                title: 'Creating your account...',
                msg: 'Please wait while we set things up for you.',
                context: context,
                type: MessageTypeConst.help,
              );
            case SignUpSuccess():
              aweSnackBar(
                title: 'Account Created',
                msg: 'Your account has been successfully created.',
                context: context,
                type: MessageTypeConst.success,
              );
              context.pushReplacementNamed(AppRoutes.login);
            case SignUpFailure():
              return aweSnackBar(
                title: 'Oops! Something went wrong',
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
                const AuthHeader(text: 'Sign Up'),
                Form(
                  key: _formKey,
                  child: CustomSignUpTextFormFieldSection(
                    formKey: _formKey,
                    userNameController: _userNameController,
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
