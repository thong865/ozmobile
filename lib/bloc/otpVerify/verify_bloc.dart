import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ozmobile/Data/models/response_header_model.dart';
import 'package:ozmobile/Data/repository/otp_repository.dart';

part 'verify_event.dart';
part 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  late RespnoseHeaderModel data;
  final OtpRepository otpRepo;

  VerifyBloc(this.otpRepo) : super(VerifyInitial()) {
    on<VerifyEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SendVerifyOtp>((event, emit) async {
      try {
        emit(VerifyLoading());
        data =
            await otpRepo.sumbitOtp(event.contract, event.tag, event.otpType);
        emit(VerifyLoaded(data));
      } catch (e) {
        throw e;
      }
    });
    on<VerifyOtp>((event, emit) async {
      try {
        emit(VerifyLoading());
        data = await otpRepo.submitVerify(
            event.contract, event.tag, event.otpType, event.otpCode);
        print(data);
        emit(VerifyLoaded(data));
      } catch (e) {
        throw e;
      }
    });
  }
}
