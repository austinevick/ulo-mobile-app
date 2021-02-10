import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ulo_mobile_spa/providers/network_provider.dart';
import 'package:ulo_mobile_spa/widgets/login_button.dart';
import 'package:ulo_mobile_spa/widgets/text_input_field.dart';

class GiftFormScreen extends StatefulWidget {
  @override
  _GiftFormScreenState createState() => _GiftFormScreenState();
}

class _GiftFormScreenState extends State<GiftFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NetworkProvider>(
        builder: (context, gifts, child) => Scaffold(
            body: ListView(
              children: [
                Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                            hint: Text('Gift Type'),
                            items: gifts.giftTypes
                                .map((items) => DropdownMenuItem(
                                      child: Text(items.desc),
                                      value: items,
                                    ))
                                .toList(),
                            value: gifts.selectedGift,
                            onChanged: (value) => gifts.setselectedGift(value)),
                      ),
                      TextInputField(
                        hintText: 'Recipient Name',
                      ),
                      TextInputField(
                        hintText: 'Recipient email address',
                      ),
                      TextInputField(
                        hintText: 'Message(optional)',
                        maxLines: null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextInputField(
                        hintText: 'Your name',
                      ),
                      TextInputField(
                        hintText: 'Your email address',
                      ),
                      TextInputField(
                        hintText: 'Your phone number',
                        textInputType: TextInputType.phone,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: buildButton('SEND GIFT', () {})));
  }

  buildButton(String text, Function onPressed) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: LoginButton(
          buttonColor: Color(0xfffdd13f),
          radius: 8,
          height: 50,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          width: double.infinity,
        ),
      );
}
