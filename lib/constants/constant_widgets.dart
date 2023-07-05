import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

vspace({double height = 10}) {
  return SizedBox(
    height: height,
  );
}

hspace({double width = 10}) {
  return SizedBox(
    width: width,
  );
}

atext(String name, {bool isBold = false, Color color = Colors.black}) {
  return Text(
    name,
    style: TextStyle(
        fontWeight: (isBold) ? FontWeight.bold : FontWeight.normal,
        color: color),
  );
}

// IconButton errorButton = IconButton(onPressed: () {} ,icon: Icon(Icons.add));

TextStyle greenBold = TextStyle(
  color: agreenColor,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
Color agreenColor = Colors.teal.shade500;
TextStyle blackBold = const TextStyle(
    fontSize: 16, color: Colors.black, decoration: TextDecoration.none);

// aKeyPair(atext(String name, {bool isBold = false, Color color = Colors.black}), atext())

aresultText(
  String Key,
  String Value,
) {
  return RichText(
    text: TextSpan(text: Key, style: greenBold, children: <TextSpan>[
      TextSpan(
          text: "\n" + Value,
          style: blackBold,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // navigate to desired screen
              // _copyToClipboard(Value);
            }),
    ]),
  );
}
