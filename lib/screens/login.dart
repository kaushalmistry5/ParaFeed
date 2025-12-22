// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:parafeed/common/app_button.dart';
// import 'package:parafeed/common/app_color.dart';
// import 'package:parafeed/common/custom_text_field.dart';
// import 'package:parafeed/common/textstyle.dart';
// import 'package:parafeed/screens/home_screen.dart';
// import 'package:parafeed/screens/sign_up.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   bool isPassHide = true;
//   final TextEditingController emailController = TextEditingController(text: kDebugMode ? "admin@gmail.com": null);
//   final TextEditingController passwordController = TextEditingController(text: kDebugMode ? "123456" : null);
//   String validEmail = "admin@gmail.com";
//   String validPassword = "123456";
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.all(25.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               spacing: 15.0,
//               children: [
//                 SizedBox(height: 20,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Login", style: littleDarkTextStyle(fontSize: 34,color: primary)),
//                   ],
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 CustomTextField(
//                     hintText: "Enter Your Email",
//                     labelText: "Email",
//                     controller: emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     prefixIcon: Icons.email,
//                 ),
//
//                 CustomTextField(
//                     isPassword: isPassHide,
//                     hintText: "Enter your password",
//                     labelText: "Password",
//                     controller: passwordController,
//                     keyboardType: TextInputType.emailAddress,
//                     prefixIcon: Icons.lock,
//                     suffixIcon: isPassHide ? Icons.visibility_off : Icons.visibility,
//                     onClickSuffix: (){
//                       setState(() {
//                         isPassHide = !isPassHide;
//                       });
//                   }
//
//                 ),
//
//
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15),
//                   child: SizedBox(
//                     width: double.infinity,
//                     height: 55,
//                     child: AppButton(
//                         onTap: () {
//                       FocusScope.of(context).unfocus();
//                       final email = emailController.text.trim();
//                       final password = passwordController.text.trim();
//                       print("email :: $email pass :: $password");
//                       if(email.isEmpty || password.isEmpty){
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text("email and password must be not empty"),
//                               backgroundColor: Colors.red,
//                             )
//                         );
//                       }
//                       else if(email != validEmail || password != validPassword){
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text("email or password not valid"),
//                               backgroundColor: Colors.red,
//                             )
//                         );
//                       }
//                       else{
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text("Login Successfull!"),
//                               backgroundColor: Colors.green,
//                             )
//                         );
//                       }
//
//                     }, btnText: "Login")
//                   ),
//                 ),
//
//                 Row(
//                   children: [
//                     Expanded(
//                       child: AppButton(
//                         onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
//                       }, btnText: "Sign up", isOutline: true,),
//                     )
//
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         )
//
//     );
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parafeed/common/app_button.dart';
import 'package:parafeed/common/app_color.dart';
import 'package:parafeed/common/custom_text_field.dart';
import 'package:parafeed/common/textstyle.dart';
import 'package:parafeed/screens/home_screen.dart';
import 'package:parafeed/screens/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassHide = true;

  final TextEditingController emailController =
  TextEditingController(text: kDebugMode ? "admin@gmail.com" : null);
  final TextEditingController passwordController =
  TextEditingController(text: kDebugMode ? "123456" : null);

  final String validEmail = "admin@gmail.com";
  final String validPassword = "123456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),

              // TITLE
              Center(
                child: Text(
                  "Login",
                  style: littleDarkTextStyle(
                    fontSize: 34,
                    color: primary,
                  ),
                ),
              ),

              const SizedBox(height: 36),

              // EMAIL
              CustomTextField(
                labelText: "Email",
                hintText: "Enter your email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
              ),

              const SizedBox(height: 16),

              // PASSWORD
              CustomTextField(
                labelText: "Password",
                hintText: "Enter your password",
                controller: passwordController,
                isPassword: isPassHide,
                prefixIcon: Icons.lock,
                suffixIcon:
                isPassHide ? Icons.visibility_off : Icons.visibility,
                onClickSuffix: () {
                  setState(() {
                    isPassHide = !isPassHide;
                  });
                },
              ),

              const SizedBox(height: 28),

              // LOGIN BUTTON
              SizedBox(
                width: double.infinity,
                height: 54,
                child: AppButton(
                  btnText: "Login",
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      showError("Email and password must not be empty");
                    } else if (email != validEmail ||
                        password != validPassword) {
                      showError("Email or password is incorrect");
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                ),
              ),

              const SizedBox(height: 16),

              // SIGN UP BUTTON
              SizedBox(
                width: double.infinity,
                height: 54,
                child: AppButton(
                  btnText: "Sign up",
                  isOutline: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignUpScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}