import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozmobile/Data/repository/otp_repository.dart';
import 'package:ozmobile/bloc/otpVerify/verify_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:rive/rive.dart';

class OtpFormScreen extends StatefulWidget {
  final String contract, isType, tag, otpType;
  final String? code;
  const OtpFormScreen(
      {super.key,
      required this.contract,
      required this.isType,
      required this.tag,
      required this.otpType,
      this.code});

  @override
  State<OtpFormScreen> createState() => _OtpFormScreenState();
}

class _OtpFormScreenState extends State<OtpFormScreen> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      appBar: AppBar(actions: []),
      body: RepositoryProvider(
        create: (context) => VerifyBloc(OtpRepo()),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: BlocListener<VerifyBloc, VerifyState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              child: BlocBuilder<VerifyBloc, VerifyState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      const Center(
                          child: SizedBox(
                        height: 200,
                        width: 200,
                        child: RiveAnimation.asset(
                          'assets/message-icon.riv',
                        ),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'ຢືນຢັນລະຫັດ',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          widget.otpType == 'WHA'
                              ? 'ກາລຸນາປ້ອນຕົວເລກ 6 ຫຼັກທີ່ພວກເຮົາສົ່ງໄປໃຫ້ທາງ Whastapp ທີ່ເບີ'
                              : widget.otpType == 'SMS'
                                  ? 'ກາລຸນາປ້ອນຕົວເລກ 6 ຫຼັກທີ່ພວກເຮົາສົ່ງໄປໃຫ້ທາງ SMS ທີ່ເບີ'
                                  : 'ກາລຸນາປ້ອນຕົວເລກ 6 ຫຼັກທີ່ພວກເຮົາສົ່ງໄປໃຫ້ທາງ email ທີ່',
                          style: const TextStyle(fontSize: 16, height: 1.5),
                          textAlign: TextAlign.start),
                      Text(widget.contract, textAlign: TextAlign.start),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Pinput(
                          length: 6,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          submittedPinTheme: submittedPinTheme,
                          validator: (s) {
                            return s == widget.code ? null : 'Pin is incorrect';
                          },
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          onCompleted: (pin) => print(0000),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context)=> (),
              //   ),
              // );
            },
            minWidth: MediaQuery.of(context).size.width - 200,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Colors.red,
            child: const Text('ຢືນຢັນລະຫັດ'),
          ),
        ],
      ),
    );
  }
}
