import 'package:employeebyte/controllers/auth_controller.dart';
import 'package:employeebyte/pages/app_entry_pages/app_main_page.dart';
import 'package:employeebyte/pages/dashboard_pages/dashboard_page.dart';
import 'package:employeebyte/pages/verification_pages/resend_email_verification_link_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppStarterPage extends HookWidget{
  const AppStarterPage();
  @override
  Widget build(BuildContext context) {
    final authControllerState = useProvider(authControllerProvider);
    if(authControllerState==null){
      //App Starter Page/Entry Page

      return const AppEntryMainPage();
    }else{
      if(!authControllerState.emailVerified){
        // Resend Email Verification Link
        return ResendEmailVerificationLinkPage();
      } {
        return const DashBoardPage();
      }
    }
  }

}