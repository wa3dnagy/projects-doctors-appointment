import 'package:cs_project_2/model/user_model.dart';

import 'package:cs_project_2/screen/sign_up_screen.dart';
import 'package:cs_project_2/sql_log/databasehelper.dart';
import 'package:cs_project_2/widgets/navbar_roots.dart';
import 'package:cs_project_2/widgets/provider_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = true;
  final email = TextEditingController();
  final password = TextEditingController();

  bool isLoginTrue = false;
  final db = DatabaseHelper();
login() async {
  if (email.text.isEmpty || password.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Please fill all fields")),
    );
    return;
  }

  bool isAuthenticated = await db.authenticate(Users(
    email: email.text,
    password: password.text,
  ));

  if (isAuthenticated) {
    Users? usrDetails = await db.getUser(email.text);

  
    Provider.of<UserProvider>(context, listen: false).setUserData(
      usrDetails!.firstName ?? '',
      usrDetails.lastName ?? '',
      usrDetails.email ?? '',
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => NavbarRoots()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Invalid email or password")),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset(
                  'assets/WhatsApp Image 2024-12-17 at 05.06.21_eb9044c7.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Email'),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: password,
                obscureText: passToggle,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text('Enter Password'),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        passToggle = !passToggle;
                      });
                    },
                    child: Icon(
                      passToggle
                          ? CupertinoIcons.eye_slash_fill
                          : CupertinoIcons.eye_fill,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () async {
                await login();
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 160, vertical: 10),
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text(
                'Log In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            isLoginTrue
                ? Text(
                    'Email or Password is incorrect',
                    style: TextStyle(color: Colors.red.shade900),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
