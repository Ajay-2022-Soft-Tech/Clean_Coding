import 'package:clean_coding/bloc/login/login_bloc.dart';
import 'package:clean_coding/repository/auth/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import 'widget/widgets.dart'; // Importing custom widget components

/// A widget representing the login screen of the application.
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// The state of the [LoginScreen] widget.
class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBloc;
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc(loginRepository: getIt());
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_)=> _loginBloc,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                EmailInput(focusNode: _emailFocusNode), // Widget for email input field
                SizedBox(height: 40,),
                PasswordInput(focusNode: _passwordFocusNode), // Widget for password input field
                SubmitButton(
                  formKey: _formKey,
                ), // Widget for submit button
              ],
            ),
          ),
        ),
      )
    );
  }
}