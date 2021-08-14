// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../pages/app_entry_pages/app_main_page.dart' as _i4;
import '../pages/app_entry_pages/app_starter_page.dart' as _i3;
import '../pages/auth_pages/login_page.dart' as _i8;
import '../pages/auth_pages/signup_page.dart' as _i7;
import '../pages/dashboard_pages/add_employee_page.dart' as _i9;
import '../pages/dashboard_pages/dashboard_page.dart' as _i6;
import '../pages/dashboard_pages/view_employee_page.dart' as _i10;
import '../pages/verification_pages/resend_email_verification_link_page.dart'
    as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    AppStarterRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.AppStarterPage();
        }),
    AppEntryMainRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.AppEntryMainPage();
        }),
    ResendEmailVerificationLinkRoute.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(
            routeData: routeData,
            builder: (_) {
              return _i5.ResendEmailVerificationLinkPage();
            }),
    DashBoardRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.DashBoardPage();
        }),
    SignupRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.SignupPage();
        }),
    LoginRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.LoginPage();
        }),
    AddEmployeeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i9.AddEmployeePage();
        }),
    ViewEmployeeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i10.ViewEmployeePage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(AppStarterRoute.name, path: '/'),
        _i1.RouteConfig(AppEntryMainRoute.name, path: '/app-entry-main-page'),
        _i1.RouteConfig(ResendEmailVerificationLinkRoute.name,
            path: '/resend-email-verification-link-page'),
        _i1.RouteConfig(DashBoardRoute.name, path: '/dash-board-page'),
        _i1.RouteConfig(SignupRoute.name, path: '/signup-page'),
        _i1.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i1.RouteConfig(AddEmployeeRoute.name, path: '/add-employee-page'),
        _i1.RouteConfig(ViewEmployeeRoute.name, path: '/view-employee-page')
      ];
}

class AppStarterRoute extends _i1.PageRouteInfo {
  const AppStarterRoute() : super(name, path: '/');

  static const String name = 'AppStarterRoute';
}

class AppEntryMainRoute extends _i1.PageRouteInfo {
  const AppEntryMainRoute() : super(name, path: '/app-entry-main-page');

  static const String name = 'AppEntryMainRoute';
}

class ResendEmailVerificationLinkRoute extends _i1.PageRouteInfo {
  const ResendEmailVerificationLinkRoute()
      : super(name, path: '/resend-email-verification-link-page');

  static const String name = 'ResendEmailVerificationLinkRoute';
}

class DashBoardRoute extends _i1.PageRouteInfo {
  const DashBoardRoute() : super(name, path: '/dash-board-page');

  static const String name = 'DashBoardRoute';
}

class SignupRoute extends _i1.PageRouteInfo {
  const SignupRoute() : super(name, path: '/signup-page');

  static const String name = 'SignupRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/login-page');

  static const String name = 'LoginRoute';
}

class AddEmployeeRoute extends _i1.PageRouteInfo {
  const AddEmployeeRoute() : super(name, path: '/add-employee-page');

  static const String name = 'AddEmployeeRoute';
}

class ViewEmployeeRoute extends _i1.PageRouteInfo {
  const ViewEmployeeRoute() : super(name, path: '/view-employee-page');

  static const String name = 'ViewEmployeeRoute';
}
