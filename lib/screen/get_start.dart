import 'package:cs_project_2/screen/welcome_screen.dart';
import 'package:flutter/material.dart';

class GetStart extends StatelessWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Image(
              image: AssetImage(
                  'assets/WhatsApp Image 2024-12-17 at 03.17.10_d641c929.jpg'),height:450,fit: BoxFit.fill ,
            ),
            
          ),
          SizedBox(height: 20,),
          Text('The Best Specialists!',style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),),
             SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40 ,vertical: 10),
            child: Text('A team of experienced doctor with diverse specialties is ready to assist you at every step',style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
          ),
          SizedBox(
            height: 30,
          ),
           Card(
                color: Colors.blueAccent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>WelcomeScreen()));
                  },
                  
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

        ],
      ),
    );
  }
}
