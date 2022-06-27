part of 'otp_bloc.dart';

class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}

class VerificationLoading extends OtpState {
  const VerificationLoading();

  @override
  List<Object> get props => [];
}

class VerificationSuccess extends OtpState {
  final int statusCode;
  const VerificationSuccess({required this.statusCode});
  @override
  List<Object> get props => [statusCode];
}

class ResendOtpSuccess extends OtpState {
  const ResendOtpSuccess();
  @override
  List<Object> get props => [];
}

class VerificationError extends OtpState {
  final String error;
  const VerificationError({required this.error});

  @override
  List<Object> get props => [error];
}
