import 'package:flutter/material.dart';
import 'package:parafeed/common/app_assets.dart';
import 'package:parafeed/common/app_color.dart';
import 'package:parafeed/common/custom_widgets.dart';
import 'package:parafeed/common/textstyle.dart';

import 'login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      //Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  color: Colors.red,
                  child: CustomWidgets.customIcon(iconData: AppIcons.appLogo,size: Size(50,50),)),
              Text("ParaFeed", style: mediumTextStyle(fontSize: 48,color: primary),)
            ],
          )
        ),
      ),
    );
  }
}

