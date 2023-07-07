part of 'verify_bloc.dart';

@immutable
abstract class VerifyEvent {}

class SendVerifyOtp extends VerifyEvent {
  final String otpType;
  final String tag;
  final String contract;

  SendVerifyOtp(this.otpType, this.tag, this.contract);
}

class VerifyOtp extends VerifyEvent {
  final String otpType;
  final String tag;
  final String contract;
  final String otpCode;

  VerifyOtp(this.otpType, this.tag, this.contract, this.otpCode);
}
