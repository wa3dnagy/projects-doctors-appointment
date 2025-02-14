
import 'package:cs_project_2/model/user_model.dart';
import 'package:cs_project_2/screen/login_screen.dart';
import 'package:cs_project_2/sql_log/databasehelper.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passToggle = true;
final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final db = DatabaseHelper();

  
  Future<void> saveUserData(String email, String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userEmail', email);
    await prefs.setString('userName', name);
  }

  
 singUp() async {
  
  if (firstName.text.isEmpty || lastName.text.isEmpty || email.text.isEmpty || phoneNumber.text.isEmpty || password.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Please complete all fields")), 
    );
    return;
  }

  try {
    var res = await db.createUser(
      Users(
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        phoneNumber: phoneNumber.text,
        password: password.text,
      ),
    );

    if (res > 0) {
      
      await saveUserData(email.text, firstName.text);

      if (!mounted) return;

      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  } catch (e) {
    
    if (e.toString().contains('UNIQUE constraint failed')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An account with this email already exists")), 
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred. Please try again.")), 
      );
    }
  }
}

 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                    child: Image(
                  image: AssetImage(
                      'assets/WhatsApp Image 2024-12-17 at 05.06.21_2c824ac3.jpg'),
                  height: 370,
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                         controller: firstName,
                          decoration: InputDecoration(
                            
                        border: OutlineInputBorder(),
                        label: Text(
                          'First Name',
                          style: TextStyle(fontSize: 18),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          size: 30,
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextFormField( controller: lastName,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text(
                                'Last Name',
                                style: TextStyle(fontSize: 18),
                              ),
                             
                              )),
                    ),
                  ),
                ],
              ),
               Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(controller: phoneNumber,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          'Phone Number',
                          style: TextStyle(fontSize: 18),
                        ),
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 30,
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField( controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          'Email Address',
                          style: TextStyle(fontSize: 18),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          size: 30,
                        ))),
              ),
             
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField( controller: password,
                  obscureText: passToggle ? true : false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(
                        'Email Password',
                        style: TextStyle(fontSize: 18),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 30,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          if (passToggle == true) {
                            passToggle = false;
                          } else {
                            passToggle = true;
                          }
                          setState(() {});
                        },
                        child: passToggle
                            ? Icon(CupertinoIcons.eye_slash_fill)
                            : Icon(CupertinoIcons.eye_fill),
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              
               SizedBox(height: 10),
             TextButton(
              onPressed:() async{ await singUp();},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 115, vertical: 15),
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text(
                'Create Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have account?",
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
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'log In',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              
          
            ],
          ),
        ),
      ),
    );
  }
}
