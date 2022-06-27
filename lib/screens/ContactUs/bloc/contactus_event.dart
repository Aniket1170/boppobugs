part of 'contactus_bloc.dart';

abstract class ContactusEvent extends Equatable {
  const ContactusEvent();

  @override
  List<Object> get props => [];
}

class Contactus extends ContactusEvent {
  final String message;
  final String filePath;
  const Contactus({required this.message, required this.filePath});

  @override
  List<Object> get props => [message, filePath];
}
