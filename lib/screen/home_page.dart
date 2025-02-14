import 'package:cs_project_2/model/doctor_data.dart';
import 'package:cs_project_2/model/doctor_model.dart';
import 'package:cs_project_2/model/user_model.dart';
import 'package:cs_project_2/screen/booking_doctor.dart';
import 'package:cs_project_2/widgets/provider_model.dart';
import 'package:provider/provider.dart';
import 'package:cs_project_2/screen/profile_screen.dart';
import 'package:cs_project_2/widgets/category.dart';
import 'package:cs_project_2/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.uerdet});
  final Users? uerdet;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DoctorModel> docinfo = DoctorData.doctorList;

  List<String> catName = [
    'Dental',
    'Heart',
    'Eye',
    'Brain',
    'Ear',
    'Orthopedic ',
  ];

  List<Icon> catIcons = [
    Icon(MdiIcons.toothOutline, color: Colors.blueAccent, size: 35),
    Icon(MdiIcons.heartPlus, color: Colors.blueAccent, size: 35),
    Icon(MdiIcons.eye, color: Colors.blueAccent, size: 35),
    Icon(MdiIcons.brain, color: Colors.blueAccent, size: 35),
    Icon(MdiIcons.earHearing, color: Colors.blueAccent, size: 35),
    Icon(MdiIcons.bone, color: Colors.blueAccent, size: 35),
  ];

  @override
  Widget build(BuildContext context) {
   
    final userData =
        Provider.of<UserProvider>(context, listen: true).getUserData();
    String name = userData['firstName']??'Guest';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: Padding(
            padding: const EdgeInsets.only(top: 13),
            child: Text(
              "Welcome $name",
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w500,
                fontSize: 35,
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      'assets/11.jpg',
                    ),
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SearchBar(
                  leading: Icon(
                    Icons.search,
                    size: 35,
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 255, 255, 255)),
                  hintText: 'Search here',
                  hintStyle:
                      WidgetStatePropertyAll(TextStyle(color: Colors.black54)),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingDoctor()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 110,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            spreadRadius: 4,
                          )
                        ]),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, right: 15, left: 15),
                                child: Text(
                                  'Clinic Visit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                'Make an appointment',
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        207, 255, 255, 255),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 115,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 19, left: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.blueAccent,
                                size: 60,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  'What are you suffering from?',
                  style: TextStyle(
                      color: const Color.fromARGB(207, 0, 0, 0),
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: catName.length,
                  itemBuilder: (context, index) {
                    return Category(
                        categoryName: catName[index],
                        categoryIcons: catIcons[index]);
                  },
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: Text('Popular Doctors',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return DoctorCard(
                      doctorinfo: docinfo[index],
                      doctorList: docinfo, 
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
