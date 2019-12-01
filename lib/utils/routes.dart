import 'package:flutter/material.dart';
import 'package:senja/pages/home/bottomNavbar.dart';
import 'package:senja/auth/auth_page.dart';
import 'package:senja/pages/splashscreen/splashscreen.dart';

final routes = {
  '/auth':         (BuildContext context) => new AuthPage(),
  '/home':         (BuildContext context) => new Home(),
  '/' :          (BuildContext context) => new SplashScreen(),
};