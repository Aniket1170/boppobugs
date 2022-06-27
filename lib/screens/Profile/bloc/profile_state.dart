part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();

  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();

  @override
  List<Object> get props => [];
}

class ProfileSuccess extends ProfileState {
  const ProfileSuccess();

  @override
  List<Object> get props => [];
}

class ProfileError extends ProfileState {
  final String error;
  const ProfileError({required this.error});

  @override
  List<Object> get props => [error];
}
