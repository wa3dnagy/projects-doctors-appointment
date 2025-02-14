// import 'package:cs_project_2/screen/schedule_screen.dart';
// import 'package:flutter/material.dart';

// class BookingScreen extends StatefulWidget {
//   const BookingScreen({super.key});

//   @override
//   State<BookingScreen> createState() => _BookingScreenState();
// }

// class _BookingScreenState extends State<BookingScreen> {
//   int selectedIndex = -1;
//   int selectedIndextime = -1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//             padding: EdgeInsets.only(top: 50, left: 10, right: 10),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Text(
//                   'Booking',
//                   style: TextStyle(
//                     color: const Color.fromARGB(255, 0, 0, 0),
//                     fontWeight: FontWeight.w500,
//                     fontSize: 30,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Form(
//                   child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: TextField(
//                         decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       label: Text(
//                         'First Name',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       prefixIcon: Icon(
//                         Icons.person,
//                         size: 30,
//                         color: Colors.blue,
//                       ),
//                     )),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       SizedBox(
//                         width: 190,
//                         child: Padding(
//                           padding: const EdgeInsets.all(12),
//                           child: TextField(
//                               decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             label: Text(
//                               'Gender',
//                               style: TextStyle(fontSize: 18),
//                             ),
//                             prefixIcon: Icon(
//                               Icons.people_alt_outlined,
//                               size: 30,
//                             ),
//                           )),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 190,
//                         child: Padding(
//                           padding: const EdgeInsets.all(12),
//                           child: TextFormField(
//                               decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             label: Text(
//                               'Age',
//                               style: TextStyle(fontSize: 18),
//                             ),
//                             prefixIcon: Icon(
//                               Icons.calendar_today,
//                               size: 30,
//                               color: const Color.fromARGB(255, 21, 83, 134),
//                             ),
//                           )),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: TextField(
//                         decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       label: Text(
//                         'Phone Number',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       prefixIcon: Icon(
//                         Icons.phone_android_outlined,
//                         size: 30,
//                         color: const Color.fromARGB(255, 79, 78, 78),
//                       ),
//                     )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: TextField(
//                         decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       label: Text(
//                         'Doctor Name',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       prefixIcon: Icon(
//                         Icons.person_2_outlined,
//                         size: 30,
//                         color: Colors.blue,
//                       ),
//                     )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: TextField(
//                         decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       label: Text(
//                         'Specialty in',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       prefixIcon: Icon(
//                         Icons.star_border_outlined,
//                         size: 30,
//                         color: Colors.amber,
//                       ),
//                     )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: TextFormField(
//                       enabled: true,
//                       maxLines: 2,
//                       decoration: InputDecoration(
//                         labelText: ' Any Chronic Diseases',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
                  // ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(12),
                  //     child: Text(
                  //       'Book Date',
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 70,
                  //   child: ListView.builder(
                  //       itemCount: 30,
                  //       scrollDirection: Axis.horizontal,
                  //       shrinkWrap: true,
                  //       itemBuilder: (context, index) {
                  //         return InkWell(
                  //           onTap: () {
                  //             setState(() {
                  //               selectedIndex = index;
                  //             });
                  //           },
                  //           child: Container(
                  //             margin: EdgeInsets.symmetric(
                  //                 horizontal: 8, vertical: 5),
                  //             padding: EdgeInsets.symmetric(
                  //                 horizontal: 25, vertical: 8),
                  //             decoration: BoxDecoration(
                  //                 color: selectedIndex == index
                  //                     ? const Color.fromARGB(255, 53, 112, 212)
                  //                     : const Color.fromARGB(
                  //                         173, 255, 255, 255),
                  //                 borderRadius: BorderRadius.circular(10),
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                     color: Colors.black12,
                  //                     blurRadius: 4,
                  //                     spreadRadius: 2,
                  //                   )
                  //                 ]),
                  //             child: Column(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   '${index + 2}',
                  //                   style: TextStyle(
                  //                     color: selectedIndex == index
                  //                         ? Colors.white
                  //                         : Colors.black,
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   'JAN',
                  //                   style: TextStyle(
                  //                     color: selectedIndex == index
                  //                         ? Colors.white
                  //                         : Colors.black,
                  //                   ),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         );
                  //       }),
                  // ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(12),
                  //     child: Text(
                  //       'Time',
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 50,
                  //   child: ListView.builder(
                  //       itemCount: 6,
                  //       scrollDirection: Axis.horizontal,
                  //       shrinkWrap: true,
                  //       itemBuilder: (context, index) {
                  //         return InkWell(
                  //           onTap: () {
                  //             setState(() {
                  //               selectedIndextime = index;
                  //             });
                  //           },
                  //           child: Container(
                  //             margin: EdgeInsets.symmetric(
                  //                 horizontal: 8, vertical: 5),
                  //             padding: EdgeInsets.symmetric(
                  //                 horizontal: 25, vertical: 8),
                  //             decoration: BoxDecoration(
                  //                 color: selectedIndextime == index
                  //                     ? const Color.fromARGB(255, 53, 112, 212)
                  //                     : const Color.fromARGB(
                  //                         173, 255, 255, 255),
                  //                 borderRadius: BorderRadius.circular(10),
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                     color: Colors.black12,
                  //                     blurRadius: 4,
                  //                     spreadRadius: 2,
                  //                   )
                  //                 ]),
                  //             child: Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   '${index + 5}.00',
                  //                   style: TextStyle(
                  //                     color: selectedIndextime == index
                  //                         ? Colors.white
                  //                         : Colors.black,
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   'PM',
                  //                   style: TextStyle(
                  //                     color: selectedIndextime == index
                  //                         ? Colors.white
                  //                         : Colors.black,
                  //                   ),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         );
                  //       }),
                  // ),
//                   SizedBox(
//                     height: 20,
//                   )
//                 ],
//               ))
//             ])),
//       ),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.all(15),
//         height: 130,
//         decoration: BoxDecoration(color: Colors.white, boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 4,
//             spreadRadius: 2,
//           )
//         ]),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Consultation Price',
//                   style: TextStyle(color: Colors.black54),
//                 ),
//                 Text(
//                   '',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black54),
//                 )
//               ],
//             ),
//             SizedBox(height: 9),
//             InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ScheduleScreen()),
//                 );
//               },
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 60,
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 53, 112, 212),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Center(
//                   child: Text('Confirm',
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.w500,
//                         color: const Color.fromARGB(255, 255, 255, 255),
//                       )),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
