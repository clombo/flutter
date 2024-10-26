
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizButton extends StatelessWidget{
  const QuizButton({super.key,required this.buttonText,required this.onClick});

  final String buttonText;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrange
      ),
      child:  Text(
        buttonText,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}