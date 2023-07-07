import 'package:dio/dio.dart';
import 'package:ozmobile/Data/api.dart';
import 'package:ozmobile/Data/models/register_model.dart';

final dio = Dio();

abstract class RegisterReposity {
  Future<RegisterModel> fetchRegister(String firstname, String lastname);
}

class RegisterRepo extends RegisterReposity {
  @override
  Future<RegisterModel> fetchRegister(
    String firstname,
    String lastname,
  ) async {
    final response =
        await dio.post("https://api.ozzao.com/api/v1/register", data: {
      "isType": "MOBILE",
      "mobile": "2055057246",
      "personal": {
        "firstname": "$firstname",
        "lastname": "$lastname",
        "dob": "1995-01-18"
      },
      "password": "12345678",
      "cpassword": "123",
      "referal": "ref0032"
    });

    if (response.statusCode == 201) {
      return RegisterModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load API data');
    }
  }
}
