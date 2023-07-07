part of 'verify_bloc.dart';

@immutable
abstract class VerifyState {}

class VerifyInitial extends VerifyState {}

class VerifyLoading extends VerifyState {}

class VerifyLoaded extends VerifyState {
  final RespnoseHeaderModel data;
  VerifyLoaded(this.data);
}

class ErrorVerify extends VerifyState {}
