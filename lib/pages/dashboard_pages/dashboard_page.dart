import 'package:employeebyte/app_route/app_route.gr.dart';
import 'package:employeebyte/controllers/auth_controller.dart';
import 'package:employeebyte/general_widgets/custombutton.dart';
import 'package:employeebyte/pages/dashboard_pages/add_employee_page.dart';
import 'package:employeebyte/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class DashBoardPage extends HookWidget {
  const DashBoardPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: WillPopScope(
        onWillPop: ()async{
          showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit  App'),
              actions: <Widget>[
                new GestureDetector(
                  onTap: () => Navigator.of(context).pop(false),
                  child: Text("NO"),
                ),
                SizedBox(height: 16),
                new GestureDetector(
                  onTap: (){
                    context.read(authControllerProvider.notifier).signOut();
                    context.popRoute();
                  },
                  child: Text("YES"),
                ),
              ],
            ),
          );
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "DashBoard",
              style: GoogleFonts.josefinSans(
                  textStyle: TextStyle(
                      color: const Color(0xff3E3E3E),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: Container(
            width: size.width,
            height: size.height,
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height*0.15,),
                CustomButton(buttonBg: colorPrimary, buttonTitle: "Add Employee", buttonFontColor: colorWhite, onButtonPressed: (){
                  //add employee route
                  context.router.navigate(AddEmployeeRoute());
                }),
                SizedBox(height: 16,),
                CustomButton(buttonBg: colorWhite, buttonTitle: "View Employee's", buttonFontColor: colorPrimary,isBorder: true,onButtonPressed: ()async{
                  context.router.navigate(ViewEmployeeRoute());
                },),
                SizedBox(height: size.height*0.2,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
