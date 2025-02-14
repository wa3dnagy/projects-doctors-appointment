
import 'package:cs_project_2/screen/login_screen.dart';
import 'package:cs_project_2/screen/sign_up_screen.dart';
import 'package:cs_project_2/widgets/navbar_roots.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:
              (context)=> NavbarRoots()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'SKIP',
                style: TextStyle(color: Colors.blueAccent, fontSize: 25),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
              child: Image(
                  image: AssetImage(
                'assets/WhatsApp Image 2024-12-17 at 03.12.23_e14fc3f5.jpg',
              )),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Doctor Appointment',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Appoint Your Doctor',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
           SizedBox(
            height: 60,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                
                color: Colors.blueAccent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:
                    (context)=>LoginScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 10),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              Card(
                
                color: Colors.blueAccent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:
                    (context)=>SignUpScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
