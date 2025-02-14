import 'package:cs_project_2/sql_form/databasehelper.dart';
import 'package:cs_project_2/widgets/schedule_card.dart';
import 'package:flutter/material.dart';


class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> bookings = [];

  @override
  void initState() {
    super.initState();
    fetchBookings();
  }

  Future<void> fetchBookings() async {
    final data = await dbHelper.getBookings();
    setState(() {
      bookings = data;
    });
  }

  
  Future<void> cancelBooking(int bookingId) async {
    await dbHelper.deleteBooking(bookingId);
    fetchBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white
      ,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Schedule',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 89, 148, 248),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Upcoming',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bookings.isEmpty
              ? SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "No bookings available.",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                )
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final booking = bookings[index];
                        return SchedulCard(
                          doctorName: booking['doctorName'],
                          specialty: booking['specialty'],
                          appointmentDate: booking['selectedDate'],
                          appointmentTime: booking['selectedTime'],
                          
                          
                          bookingId: booking['id'],
                          onCancel: cancelBooking,
                        );
                      },
                      childCount: bookings.length,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
