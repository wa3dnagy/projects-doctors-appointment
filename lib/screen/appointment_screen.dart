
import 'package:cs_project_2/model/doctor_model.dart';
import 'package:cs_project_2/screen/booking_doctor.dart';


import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppointmentScreen extends StatelessWidget {
  final List<DoctorModel> doctorList;
  final DoctorModel selectedDoctor;

 const AppointmentScreen(
      {super.key, required this.doctorList, required this.selectedDoctor});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 112, 212),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 85,
                          backgroundImage: AssetImage(selectedDoctor.image),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          selectedDoctor.doctorName,
                          style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          selectedDoctor.kind,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        223, 126, 164, 231),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        223, 126, 164, 231),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.message,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2.1,
                          width: double.infinity,
                          padding:
                              EdgeInsets.only(top: 20, left: 15, right: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'About Doctor',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                selectedDoctor.about,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Reviews',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 27,
                                  ),
                                  Text(
                                    selectedDoctor.rate,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    selectedDoctor.count,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            188, 45, 90, 194)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 150,
                                child: Card(
                                    child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: const Color.fromARGB(
                                          224, 255, 255, 255),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          spreadRadius: 5,
                                        )
                                      ]),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Location',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromARGB(
                                                  255, 0, 0, 0)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    223, 126, 164, 231),
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.location_on,
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              size: 25,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 45),
                                                child: Text(
                                                  'Cairo, medical Center',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  'address line of the medical center.',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        height: 130,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          )
        ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Consultation Price',
                  style: TextStyle(color: Colors.black54),
                ),
                Text(
                  selectedDoctor.price,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                )
              ],
            ),
            SizedBox(height: 9),
            InkWell(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => BookingDoctor()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 53, 112, 212),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text('Book Appointment',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
