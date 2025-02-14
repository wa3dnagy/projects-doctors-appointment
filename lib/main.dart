import 'package:cs_project_2/screen/get_start.dart';
import 'package:cs_project_2/widgets/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;

  runApp(ChangeNotifierProvider(
      create: (context) => UserProvider(), child: DoctorAppointmentBooking()));
}

class DoctorAppointmentBooking extends StatelessWidget {
  const DoctorAppointmentBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GetStart(),
    );
  }
}
