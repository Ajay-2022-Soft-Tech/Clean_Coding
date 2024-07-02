import 'package:clean_coding/bloc/login/login_bloc.dart';
import 'package:clean_coding/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// A widget representing the email input field.
class EmailInput extends StatelessWidget {
  const EmailInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
        return BlocBuilder<LoginBloc,LoginStates>(
          buildWhen: (current, previous)=> current.email != previous.email,
            builder: (context,state){
              return TextFormField(
                  focusNode: focusNode, // Setting focus node
                  decoration: const InputDecoration(
                      hintText: 'Email',
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder()

                  ),

                  keyboardType: TextInputType.emailAddress, // Setting keyboard type to email address
                  onChanged: (value) {
                    context.read<LoginBloc>().add(EmailChanged(email: value));
                  },
                  validator: (value) {

                    if (value!.isEmpty) {
                      return 'Enter Email';
                    }

                    if (!Validations.emailValidator(value)) {
                      return 'Email is not correct';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value){

                  }


              );
            });
  }

  }
