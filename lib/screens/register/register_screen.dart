import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozmobile/Data/repository/otp_repository.dart';
import 'package:ozmobile/bloc/otpVerify/verify_bloc.dart';
import 'package:ozmobile/screens/otpform/otp_form_screen.dart';
import 'package:ozmobile/widgets/PhoneInput_widget.dart';
import 'package:ozmobile/widgets/TextInput_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String isType = "MOBILE";
  String isTage = "REGISTER";
  final mobileInputController = TextEditingController();
  final isContractController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (context) => VerifyBloc(OtpRepo()),
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.clear_all))
              ],
              pinned: true,
              expandedHeight: 100.0,
              stretch: true,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('ສະໝັກສະມາຊິກ'),
                stretchModes: <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
              ),
            ),
            SliverToBoxAdapter(
                // child: WebViewWidget(controller: _webViewController),
                child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(13.0)),
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Container(
                                color: Colors.white10,
                                child: RadioListTile(
                                    title: const Text(
                                      'ເບີໂທລະສັບ',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    value: 'MOBILE',
                                    activeColor:
                                        const Color.fromARGB(255, 145, 39, 39),
                                    groupValue: isType,
                                    onChanged: (val) {
                                      setState(() {
                                        isType = val!;
                                        isContractController.text = '';
                                      });
                                    }),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Container(
                                color: Colors.white10,
                                child: RadioListTile(
                                    title: const Text(
                                      'ອີເມວ໌',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    value: 'EMAIL',
                                    activeColor:
                                        const Color.fromARGB(255, 145, 39, 39),
                                    groupValue: isType,
                                    onChanged: (val) {
                                      setState(() {
                                        isType = val!;
                                        isContractController.text = '';
                                      });
                                    }),
                              ),
                            ),
                          ),
                          BlocConsumer<VerifyBloc, VerifyState>(
                            listener: (context, state) {
                              if (state is VerifyLoaded) {
                                var _otpCode = state.data?.data.toString();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => OtpFormScreen(
                                        contract: isContractController.text,
                                        isType: isType,
                                        otpType: isType == 'MOBILE'
                                            ? 'WHA'
                                            : 'EMAIL',
                                        tag: isTage,
                                        code: _otpCode),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is VerifyLoading) {
                                return AlertDialog(
                                    title: Text(
                                        'Welcome'), // To display the title it is optional
                                    content: Text('GeeksforGeeks'));
                              }
                              if (state is VerifyLoaded) {}
                              return const Row(
                                children: [],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: isType == 'MOBILE'
                        ? TextInputPhone(
                            fieldName: 'ເບີໂທລະສັບ',
                            inputController: isContractController,
                          )
                        : TextInput(
                            fieldName: 'ອີເມວ໌',
                            inputController: isContractController,
                            autofocus: true,
                          ),
                  ),
                ],
              ),
            ))
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (context) {
              return MaterialButton(
                onPressed: () {
                  BlocProvider.of<VerifyBloc>(context).add(SendVerifyOtp(
                      isType == 'MOBILE' ? 'WHA' : 'EMAIL',
                      isTage,
                      isContractController.text));
                },
                minWidth: MediaQuery.of(context).size.width - 200,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.red,
                child: const Text('ສະໝັກສະມາຊິກ'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
