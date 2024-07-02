import 'package:flutter/material.dart';
import '../../../config/routes/routes_name.dart';
import '../../../services/storage/local_storage.dart'; // Importing the LocalStorage class for managing local storage

/// A widget representing the logout button.
class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        LocalStorage localStorage = LocalStorage();
        localStorage.clearValue('token').then((value) {
          localStorage.clearValue('isLogin');
          Navigator.pushNamed(context, RoutesName.loginScreen); // Navigating to the login screen after clearing token and isLogin value
        });
      },
      child: Center(
        child: Text(
          'Log Out'// Localized text for logout button
        ),
      ),
    );
  }
}
