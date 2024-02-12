import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'home_page.dart'; // Import your home page

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');

    // Check if the username and password are both "usuario"
    if (data.name == 'usu@usu.com' && data.password == 'usuario') {
      // Successful login, navigate to HomePage
      return Future.delayed(loginTime).then((_) => null);
    } else {
      // Incorrect credentials, return an error message
      return Future.delayed(loginTime).then((_) => 'Invalid credentials');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Marvel',
      onLogin: _authUser,
      onSubmitAnimationCompleted: () {
        // Navigate to HomePage after successful login
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      onRecoverPassword: (String email) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Recovery not implemented for the example.'),
          ),
        );


      },
    );
  }
}
