import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ozmobile/Data/models/register_model.dart';
import 'package:ozmobile/Data/repository/register/register_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  late RegisterModel data;
  final RegisterRepo regRepo;

  RegisterBloc(this.regRepo) : super(RegisterInitial()) {
    on<SendData>((event, emit) async {
      if (event is SendData) {
        emit(RegisterLoading());
        data = await regRepo.fetchRegister(event.firstname, event.lastname);
        emit(RegisterLoaded(data));
      }
    });
  }
}
