import 'package:flutter/material.dart';
import 'package:recycle_plus/screens/_Admin/member/member.dart';
import 'package:recycle_plus/screens/_Admin/news/news.dart';
import 'package:recycle_plus/screens/_Admin/news/news_add.dart';
import 'package:recycle_plus/screens/_Admin/setting/setting.dart';
import 'package:recycle_plus/screens/_Admin/setting/sponsor%20logo/sponsor_logo.dart';
import 'package:recycle_plus/screens/_Admin/tabbar_control.dart';
import 'package:recycle_plus/screens/_NoLogin/tabbar_control.dart';
import 'package:recycle_plus/screens/forgotPass/forgotPass.dart';
import 'package:recycle_plus/screens/login/body_login.dart';
import 'package:recycle_plus/screens/login_no/login_no.dart';
import 'package:recycle_plus/screens/register/body_register.dart';
import 'package:recycle_plus/screens/start/start.dart';
import 'package:recycle_plus/screens/success/success_login.dart';
import 'package:recycle_plus/screens/success/success_register.dart';

final Map<String, WidgetBuilder> routes = {
  StartScreen.routeName: (context) => StartScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  PleaseLogin.routeName: (context) => PleaseLogin(),
  ForgotPasswordScreen.routeName:(context) => ForgotPasswordScreen(),
  LoginSuccess.routeName: (context) => LoginSuccess(),
  RegisterSuccess.routeName: (context) => RegisterSuccess(),
  Member_TabbarHome.routeName: (context) => Member_TabbarHome(),
  Admin_TabbarHome.routeName: (context) => Admin_TabbarHome(0),
  Admin_MemberScreen.routeName: (context) => Admin_MemberScreen(),
  Admin_NewsScreen.routeName:(context) => Admin_NewsScreen(),
  Admin_NewsAdd.routeName:(context) => Admin_NewsAdd(),
  Admin_SettingMore.routeName:(context) => Admin_SettingMore(),
  Admin_LogoSponsor.routeName:(context) => Admin_LogoSponsor(),
};
