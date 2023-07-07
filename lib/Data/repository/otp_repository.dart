import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ozmobile/Data/api.dart';
import 'package:ozmobile/Data/models/register_model.dart';
import 'package:ozmobile/Data/models/response_header_model.dart';

final dio = Dio();

abstract class OtpRepository {
  Future<RespnoseHeaderModel> sumbitOtp(
      String contract, String tag, String otpType);
  Future<RespnoseHeaderModel> submitVerify(
      String contract, String tag, String otpType, String otpCode);
}

class OtpRepo extends OtpRepository {
  @override
  Future<RespnoseHeaderModel> sumbitOtp(
      String contract, String tag, String otpType) async {
    final response =
        await dio.post("https://api.ozzao.com/api/v1/verify/otp", data: {
      "channel": "MOBILE",
      "otpType": "$otpType",
      "tag": "$tag",
      "contract": "$contract"
    });
    if (response.statusCode == 201) {
      return RespnoseHeaderModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load API data');
    }
  }

  @override
  Future<RespnoseHeaderModel> submitVerify(
      String contract, String tag, String otpType, String otpCode) async {
    final response = await dio
        .post("https://api.ozzao.com/api/v1/verify/otpConfirm", data: {
      "channel": otpType,
      "tag": tag,
      "contract": contract,
      "otp": otpCode
    });
    if (response.statusCode == 201) {
      return RespnoseHeaderModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load API data');
    }
  }
}
