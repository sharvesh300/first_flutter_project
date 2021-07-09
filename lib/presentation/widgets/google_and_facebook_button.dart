import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FacebookAndGoogleButton extends StatelessWidget {
  const FacebookAndGoogleButton({
    required this.text,
    required this.icon,
    required this.color,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 50,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          child: Row(children: [
            SizedBox(width: 20),
            FaIcon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(text,
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Ubuntu', fontSize: 17))
          ]),
        ),
      ),
    );
  }
}
