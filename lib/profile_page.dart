import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googlesigninwith0auth/signin_page.dart';

import 'api.dart';

class ProfilePage extends StatefulWidget {
  final GoogleSignInAccount user;

  const ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           /* CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(widget.user.photoUrl!),
            ),*/ CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(widget.user.photoUrl!),
            ),
            Text("Email : ${widget.user.email}"),
            Text("Name : ${widget.user.displayName}"),
            Text("ID : ${widget.user..id}"),
            ElevatedButton(
                onPressed: () async {
                  await GoogleSigninApi.logout();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
                child: Text("Log Out"))
          ],
        ),
      ),
    );
  }
}
