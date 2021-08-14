import 'package:employeebyte/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends HookWidget {
  final Color buttonBg,buttonFontColor;
  final String buttonTitle;
  final bool isBorder;
  final Function onButtonPressed;



  const CustomButton({required this.buttonBg,required this.buttonTitle,required this.buttonFontColor,this.isBorder=false,required this.onButtonPressed});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
          height: 50,
          width:size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: buttonBg,
            border: this.isBorder?Border.all(width: 1,color: colorPrimary):null
          ),
          child: Center(
            child: Text(buttonTitle,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: this.buttonFontColor)),),
          )),
    );
  }
}
