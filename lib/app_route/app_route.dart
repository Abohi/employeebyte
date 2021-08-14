import 'package:auto_route/annotations.dart';
import 'package:employeebyte/pages/app_entry_pages/app_main_page.dart';
import 'package:employeebyte/pages/app_entry_pages/app_starter_page.dart';
import 'package:employeebyte/pages/auth_pages/login_page.dart';
import 'package:employeebyte/pages/auth_pages/signup_page.dart';
import 'package:employeebyte/pages/dashboard_pages/add_employee_page.dart';
import 'package:employeebyte/pages/dashboard_pages/dashboard_page.dart';
import 'package:employeebyte/pages/dashboard_pages/view_employee_page.dart';
import 'package:employeebyte/pages/verification_pages/resend_email_verification_link_page.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    const AutoRoute(page: AppStarterPage, initial: true),
    const AutoRoute(page: AppEntryMainPage),
    const AutoRoute(page: ResendEmailVerificationLinkPage),
    const AutoRoute(page: DashBoardPage),
    const AutoRoute(page: SignupPage),
    const AutoRoute(page: LoginPage),
    const AutoRoute(page: AddEmployeePage),
    const AutoRoute(page: ViewEmployeePage),
  ],
)
class $AppRouter {}