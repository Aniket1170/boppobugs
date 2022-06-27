part of 'contactus_bloc.dart';

abstract class ContactusState extends Equatable {
  const ContactusState();

  @override
  List<Object> get props => [];
}

class ContactusInitial extends ContactusState {
  const ContactusInitial();

  @override
  List<Object> get props => [];
}

class ContactusLoading extends ContactusState {
  const ContactusLoading();

  @override
  List<Object> get props => [];
}

class ContactusSuccess extends ContactusState {
  const ContactusSuccess();

  @override
  List<Object> get props => [];
}

class ContactusError extends ContactusState {
  final String error;
  const ContactusError({required this.error});

  @override
  List<Object> get props => [error];
}
