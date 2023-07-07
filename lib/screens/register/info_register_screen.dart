import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ozmobile/Data/repository/register/register_repository.dart';
import 'package:ozmobile/bloc/register/register_bloc.dart';
import 'package:ozmobile/screens/terms/term_screen.dart';
import 'package:ozmobile/widgets/TextInput_widget.dart';

class InfoRegisterScreen extends StatefulWidget {
  const InfoRegisterScreen({super.key});

  @override
  State<InfoRegisterScreen> createState() => _InfoRegisterScreenState();
}

class _InfoRegisterScreenState extends State<InfoRegisterScreen> {
  final RegFristnameController = TextEditingController();
  final RegLastnameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late final String firstname, lastname, mobile;
  late final DateTime dob;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(RegisterRepo()),
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
                title: Text('Register'),
                stretchModes: <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextInput(
                      inputController: RegFristnameController,
                      fieldName: 'firstname',
                    ),
                    TextInput(
                      inputController: RegLastnameController,
                      fieldName: 'lastname',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            label: Text('date of birth'),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white10)),
                            filled: true),
                        validator: (val) {
                          // if (val!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(val!)) {
                          //   return "enter incorrect";
                          // } else {
                          //   return null;
                          // }
                        },
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Done')),
                                    Expanded(child: CupertinoDatePicker(
                                      onDateTimeChanged: (data) {
                                        setState(() {});
                                      },
                                    ))
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Builder(builder: (context) {
                      return MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterBloc>(context).add(SendData(
                                RegFristnameController.text,
                                RegLastnameController.text));
                          }
                        },
                        minWidth: MediaQuery.of(context).size.width - 200,
                        height: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.red,
                        child: const Text('Accept'),
                      );
                    })
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
