import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googlesigninwith0auth/profile_page.dart';

import 'api.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Future signIn() async {
    final user = await GoogleSigninApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login Failed")));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ProfilePage(user: user,)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("SignIn"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: signIn, child: const Text("Google Sign In")),
      ),
    );
  }
}
