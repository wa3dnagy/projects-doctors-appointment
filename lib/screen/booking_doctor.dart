
import 'package:cs_project_2/sql_form/databasehelper.dart';
import 'package:cs_project_2/widgets/navbar_roots.dart';
import 'package:flutter/material.dart';

class BookingDoctor extends StatefulWidget {
  const BookingDoctor({super.key});

  @override
  State<BookingDoctor> createState() => _BookingFromDoctorState();
}

class _BookingFromDoctorState extends State<BookingDoctor> {
  int selectedIndex = -1;
  int selectedIndextime = -1;
  final dbHelper = DatabaseHelper();
  final firstName = TextEditingController();
  final gender = TextEditingController();
  final age = TextEditingController();
  final phone = TextEditingController();
  final doctorName = TextEditingController();
  final specialty = TextEditingController();
  final chronicDiseases = TextEditingController();
  List<Map<String, dynamic>> bookings = [];

  @override
  void initState() {
    super.initState();
    _fetchBookings();
  }

  Future<void> _fetchBookings() async {
    final data = await dbHelper.getBookings();
    setState(() {
      bookings = data;
    });
  }

  Future<void> addBooking() async {
    final booking = {
      'firstName': firstName.text,
      'gender': gender.text,
      'age': age.text,
      'phoneNumber': phone.text,
      'doctorName': doctorName.text,
      'specialty': specialty.text,
      'chronicDiseases': chronicDiseases.text,
      'selectedDate': '${selectedIndex + 2} JAN',
      'selectedTime': '${selectedIndextime + 5}.00 PM',
    };

    await dbHelper.insertBooking(booking);
    _fetchBookings();

    
    firstName.clear();
    gender.clear();
    age.clear();
    phone.clear();
    doctorName.clear();
    specialty.clear();
    chronicDiseases.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Booking',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  children: [
                   
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        controller: firstName,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            'Full Name',
                            style: TextStyle(fontSize: 18),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 190,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: TextField(
                              controller: gender,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text(
                                  'Gender',
                                  style: TextStyle(fontSize: 18),
                                ),
                                prefixIcon: Icon(
                                  Icons.people_alt_outlined,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 190,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: TextField(
                              controller: age,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text(
                                  'Age',
                                  style: TextStyle(fontSize: 18),
                                ),
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  size: 30,
                                  color: Color.fromARGB(255, 21, 83, 134),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        controller: phone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            'Phone Number',
                            style: TextStyle(fontSize: 18),
                          ),
                          prefixIcon: Icon(
                            Icons.phone_android_outlined,
                            size: 30,
                            color: Color.fromARGB(255, 79, 78, 78),
                          ),
                        ),
                      ),
                    ),
                 
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        controller: doctorName,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            'Doctor Name',
                            style: TextStyle(fontSize: 18),
                          ),
                          prefixIcon: Icon(
                            Icons.person_2_outlined,
                            size: 30,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        controller: specialty,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            'Specialty in',
                            style: TextStyle(fontSize: 18),
                          ),
                          prefixIcon: Icon(
                            Icons.star_border_outlined,
                            size: 30,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        controller: chronicDiseases,
                        maxLines: 2,
                        decoration: const InputDecoration(
                          labelText: 'Any Chronic Diseases',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Book Date',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                        itemCount: 30,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 8),
                              decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? const Color.fromARGB(255, 53, 112, 212)
                                      : const Color.fromARGB(
                                          173, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    )
                                  ]),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${index + 2}',
                                    style: TextStyle(
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'JAN',
                                    style: TextStyle(
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Time',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                     SizedBox(
                    height: 50,
                    child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndextime = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 8),
                              decoration: BoxDecoration(
                                  color: selectedIndextime == index
                                      ? const Color.fromARGB(255, 53, 112, 212)
                                      : const Color.fromARGB(
                                          173, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    )
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${index + 5}.00',
                                    style: TextStyle(
                                      color: selectedIndextime == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'PM',
                                    style: TextStyle(
                                      color: selectedIndextime == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        height: 100,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          )
        ]),
        child: Column(
          children: [
            const SizedBox(height: 9),
            InkWell(
              onTap: () async {
                await addBooking();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NavbarRoots()),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 53, 112, 212),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
