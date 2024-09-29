import 'package:flutter/material.dart';
import 'package:vonc_website/view/auth/authscreen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Authscreen.routeName:
      return MaterialPageRoute(builder: (context) => Authscreen());
    
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: ImageIcon('assets/images/icons/cart_icon-rbg-for-all.png'
                as ImageProvider<Object>?),
          ),
        ),
      );
  }
}
