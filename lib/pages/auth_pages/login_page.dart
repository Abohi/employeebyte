
import 'package:employeebyte/app_route/app_route.gr.dart';
import 'package:employeebyte/controllers/auth_controller.dart';
import 'package:employeebyte/exception_handlers/custom_exception.dart';
import 'package:employeebyte/general_widgets/custombutton.dart';
import 'package:employeebyte/providers/exception_provider/exception_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';

final passwordVisibilityProvider = StateProvider<bool>((ref) => false);
class LoginPage extends HookWidget {
const LoginPage();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();
    final passVisibilityProvider = useProvider(passwordVisibilityProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ProviderListener(
          provider: exceptionMessageProvider,
          onChange: (BuildContext context, StateController<CustomException?> customException,) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: const Color(0xff3E3E3E),
                content: Text(customException.state!.message!),
              ),
            );
          },
          child: ProgressHUD(
            backgroundColor:const Color(0xff0000FF),
            indicatorColor: Colors.white,
            child: Builder(
              builder: (BuildContext context){
                return Container(
                  width: width,
                  height: height,
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        elevation: 0,
                        title: Text(
                          "Login",
                          style: GoogleFonts.josefinSans(
                              textStyle: TextStyle(
                                  color: const Color(0xff3E3E3E),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        centerTitle: true,
                        pinned: true,
                        backgroundColor: Colors.white,
                        leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: const Color(0xff0000FF),
                            size: 24,
                          ),
                          onPressed: () {
                            context.popRoute();
                          },
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate([
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Center(
                              child: Text(
                                "Welcome back",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 34,
                                        color: const Color(0xff0000FF),
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.08,
                            ),
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(splashColor: Colors.transparent),
                              child: TextField(
                                autofocus: false,
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: const Color(0xff29283C), fontSize: 14)),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Email/username",
                                  labelStyle: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: const Color(0xff29283C), fontSize: 14)),
                                  suffixIcon: Icon(
                                    Icons.email,
                                    size: 24,
                                    color: const Color(0xffACACAC),
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color(0xff0000FF), width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color(0xffACACAC), width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.04),
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(splashColor: Colors.transparent),
                              child: TextField(
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                controller: _passwordController,
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: const Color(0xff29283C), fontSize: 14)),
                                obscureText: !passVisibilityProvider.state,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Password",
                                  labelStyle: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: const Color(0xff29283C), fontSize: 14)),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      passVisibilityProvider.state
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: const Color(0xffACACAC),
                                      size: 24,
                                    ),
                                    onPressed: () {
                                      passVisibilityProvider.state=!passVisibilityProvider.state;
                                    },
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color(0xff0000FF), width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color(0xffACACAC), width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.04),
                            CustomButton(
                              buttonBg: const Color(0xff0000FF),
                              buttonTitle: "LOGIN",
                              buttonFontColor: Colors.white,
                              onButtonPressed: () async {
                                if(_emailController.text.isEmpty || _passwordController.text.isEmpty)
                                  return Fluttertoast.showToast(msg: "Fields Cannot be empty",toastLength: Toast.LENGTH_LONG);
                                final progress = ProgressHUD.of(context);
                                progress!.showWithText('Login User...');
                                await context.read(authControllerProvider.notifier).loginUser({
                                  "email":_emailController.text.toString(),
                                  "password":_passwordController.text.toString()
                                });
                                progress.dismiss();
                                if(context.read(authControllerProvider)!=null){
                                  context.router.navigate(AppStarterRoute());
                                }
                              }
                            ),
                            SizedBox(height: height * 0.04),
                          ]),
                        ),
                      ),
                    ],
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

class CircularButton extends StatelessWidget {
  final SvgPicture iconImage;
  final Color bgColor;
  final Function onButtonPressed;

  const CircularButton({required this.iconImage,required this.bgColor,required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
          boxShadow: [
            BoxShadow(
                color: const Color(0xffACACAC),
                blurRadius: 6.0,
                offset: Offset(0, 3))
          ],
        ),
        child: Center(
          child: iconImage,
        ),
      ),
    );
  }
}
