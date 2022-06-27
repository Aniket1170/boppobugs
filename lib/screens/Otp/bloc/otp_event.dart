part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class VerifyOtp extends OtpEvent {
  final String mobileNumber;
  final String otpValue;

  const VerifyOtp({required this.mobileNumber, required this.otpValue});

  @override
  List<Object> get props => [mobileNumber, otpValue];
}

class ResendOtp extends OtpEvent {
  final String mobileNumber;

  const ResendOtp({required this.mobileNumber});

  @override
  List<Object> get props => [mobileNumber];
}
