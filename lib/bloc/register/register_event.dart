part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class SendData extends RegisterEvent {
  final String firstname;
  final String lastname;

  SendData(this.firstname, this.lastname);
}
