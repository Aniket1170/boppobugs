part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class Login extends LoginEvent {
  final String mobileNumber;
  const Login({required this.mobileNumber});

  @override
  List<Object> get props => [mobileNumber];
}

class Upbasicdetail extends LoginEvent {
  final String mobileNumber;
  final String dateOfBirth;
  final int age;
  final int gender;
  final String name;
  const Upbasicdetail(
      {required this.mobileNumber,
      required this.dateOfBirth,
      required this.age,
      required this.gender,
      required this.name});

  @override
  List<Object> get props => [mobileNumber, dateOfBirth, age, gender, name];
}
