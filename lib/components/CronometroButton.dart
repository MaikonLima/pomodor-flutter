import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CronometroButton extends StatelessWidget {
  final String text;
  final IconData icone;

  final void Function()? click;

  const CronometroButton({super.key, required this.text, required this.icone, this.click});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        textStyle: TextStyle(
          fontSize: 35,
        ),
      ),
      onPressed: this.click,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: Icon(
              this.icone,
              size: 30,
            ),
          ),
          Text(
            this.text,
          )
        ],
      ),
    );
  }
}
