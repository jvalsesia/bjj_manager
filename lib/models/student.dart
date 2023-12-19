// [
//     {
//         "phone_number": "968-633-4737",
//         "person_profile": "Student",
//         "belt_id": null,
//         "last_name": "Rau",
//         "date_of_birth": "2023-07-21",
//         "email": "Cletus65@gmail.com",
//         "person_address": "2442 Randy Island",
//         "person_gender": "Male",
//         "cpf_rg": "40621136948",
//         "id": 101,
//         "first_name": "Deangelo"
//     }
// ]
class Student {
  final String phoneNumber;
  final String personProfile;
  final int beltId;
  final String lastName;
  final String dateOfBirth;
  final String email;
  final String personAddress;
  final String personGender;
  final String cpfRg;
  final int id;
  final String firstName;
  const Student(
      {required this.phoneNumber,
      required this.personProfile,
      required this.beltId,
      required this.lastName,
      required this.dateOfBirth,
      required this.email,
      required this.personAddress,
      required this.personGender,
      required this.cpfRg,
      required this.id,
      required this.firstName});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        phoneNumber: json['phone_number'] as String,
        personProfile: json['person_profile'] as String,
        beltId: json['belt_id'] as int,
        lastName: json['last_name'] as String,
        dateOfBirth: json['date_of_birth'] as String,
        email: json['email'] as String,
        personAddress: json['person_address'] as String,
        personGender: json['person_gender'] as String,
        cpfRg: json['cpf_rg'] as String,
        id: json['id'] as int,
        firstName: json['first_name'] as String);
  }
}
