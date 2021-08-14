import 'package:employeebyte/controllers/auth_controller.dart';
import 'package:employeebyte/exception_handlers/custom_exception.dart';
import 'package:employeebyte/general_widgets/custombutton.dart';
import 'package:employeebyte/providers/exception_provider/exception_provider.dart';
import 'package:employeebyte/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class ResendEmailVerificationLinkPage extends HookWidget {
  const ResendEmailVerificationLinkPage();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async{
       return false;
      },
      child: Scaffold(
        body: ProviderListener(
          provider: exceptionMessageProvider,
          onChange: (BuildContext context, StateController<CustomException?> customException,) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: snackBarColor,
                content: Text(customException.state!.message!),
              ),
            );
          },
          child: ProgressHUD(
            backgroundColor:colorPrimary,
            indicatorColor: colorWhite,
            child:Builder(
              builder: (context){
                return SafeArea(
                  child: Container(
                    height: height,
                    width: width,
                    color: const Color(0xff0000FF),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:17.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: height*0.15,),
                            Center(child: Text("Email Verification",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 34,fontWeight: FontWeight.w500,color: Colors.white)),),),
                            Center(child: Text("Please click the button to verify your email account",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white)),),),
                            SizedBox(height: height*0.2,),
                            CustomButton(buttonBg: Colors.white, buttonTitle: "Resend Email Verification", buttonFontColor: colorPrimary, onButtonPressed: ()async{
                              final progress = ProgressHUD.of(context);
                              progress!.showWithText('Sending Email Verification...');
                              await context.read(authControllerProvider.notifier).sendEmailVerificationLink();
                              progress.dismiss();
                              //AppEntry route/main route
                            },),
                            SizedBox(height: 20,),
                            CustomButton(buttonBg: Colors.white, buttonTitle: "Already Verified", buttonFontColor: colorPrimary, onButtonPressed: (){
                              //AppEntry route/main route
                            }),
                            SizedBox(height: height*0.10,)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

}
