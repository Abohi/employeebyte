import 'package:employeebyte/app_route/app_route.gr.dart';
import 'package:employeebyte/general_widgets/custombutton.dart';
import 'package:employeebyte/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:auto_route/auto_route.dart';
class AppEntryMainPage extends HookWidget {
  const AppEntryMainPage();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal:17.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CustomButton(buttonBg: colorPrimary, buttonTitle: "SIGN UP", buttonFontColor: colorWhite, onButtonPressed: (){
                //Signup route
                context.router.navigate(SignupRoute());
              }),
              SizedBox(height: 16,),
              CustomButton(buttonBg: colorWhite, buttonTitle: "LOGIN", buttonFontColor: colorPrimary,isBorder: true,onButtonPressed: ()async{
                context.router.navigate(LoginRoute());
              },),
            ],
          ),
        ),
      ),
    );
  }


}