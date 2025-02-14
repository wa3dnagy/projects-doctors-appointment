import 'package:cs_project_2/model/doctor_model.dart';

class DoctorData {
  static List<DoctorModel> doctorList = [
    DoctorModel(
        image: 'assets/WhatsApp Image 2024-12-17 at 03.17.10_bfc4d6d4.jpg',
        doctorName: 'Dr.Omar Mohamed',
        kind: 'Cardiologist',
        rate: '4.5',
        about:
            "A dedicated specialist focused on maintaining heart health and treating cardiovascular diseases. Known for providing expert care to manage and prevent heart-related conditions.",
        count: '(1143)',
        price: '\$200'),
    DoctorModel(
      image: 'assets/WhatsApp Image 2024-12-17 at 03.17.10_053514c6.jpg',
      doctorName: 'Dr.Mariam Ahmed',
      kind: 'Audiologist',
      rate: '4.9',
      about:
          'A compassionate professional skilled in diagnosing and treating hearing and balance issues. Committed to helping patients improve their quality of life through personalized auditory care.',
      count: '(1434)',
      price: '\$100',
    ),
    DoctorModel(
        image: 'assets/1.jpg',
        doctorName: 'Dr.Amira Youssef',
        kind: 'Dentist',
        rate: '4.8',
        about:
            'A trusted expert in oral health, ensuring bright smiles and healthy teeth. Renowned for their gentle approach to dental care and patient well-being.',
        count: '(1376)',
        price: '\$150'),
    DoctorModel(
        image: 'assets/99.jpg',
        doctorName: 'Dr.Samy Yasser',
        kind: 'Orthopedist',
        rate: '4.6',
        about:
            'A highly skilled doctor specializing in bones, joints, and muscle health. Devoted to restoring mobility and reducing pain for a more active lifestyle.',
        count: '(1289)',
        price: '\$100'),
  ];
}
