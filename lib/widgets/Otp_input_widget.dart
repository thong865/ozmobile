import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInputWidget extends StatefulWidget {
  const OtpInputWidget({super.key});

  @override
  State<OtpInputWidget> createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<OtpInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white10)),
            focusColor: Colors.blueGrey),
        onChanged: (value) => {
          if (value.length == 1) {FocusScope.of(context).nextFocus()}
        },
        onSaved: (pin1) {},
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
