
import 'package:cs_project_2/model/doctor_model.dart';
import 'package:cs_project_2/screen/appointment_screen.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doctorinfo, required this.doctorList, });
  final DoctorModel doctorinfo;
    final List<DoctorModel> doctorList;
 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>AppointmentScreen(doctorList: [doctorinfo], selectedDoctor: doctorinfo, )));
      },
      child: Center(
        child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            )
          ]
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage:AssetImage(doctorinfo.image),
              
            ),
            Text(doctorinfo.doctorName,style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black54
        
            ),),
             Text(doctorinfo.kind,style: TextStyle(
              color: Colors.black45
        
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star,color: Colors.amber,),
                
             Text(doctorinfo.rate,style: TextStyle(
              color: Colors.black45,
              fontSize: 14
        
            ),),
                
        
              ],
            )
        
        
          ],
        ),
        ),
      ),
    );
  }
}