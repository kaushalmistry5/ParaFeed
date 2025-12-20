import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parafeed/screens/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isPassHide = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String validEmail = "admin@gmail.com";
  String validPassword = "123456";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15.0,
              children: [
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login", style: GoogleFonts.poppins(color: Color(0XFF648DDB), fontSize: 30, fontWeight: FontWeight.w600) ),
                  ],
                ),

                Text("Your Email", style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600) ),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),

                Text("Password", style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600) ),

                TextField(
                  controller: passwordController,
                  obscureText: isPassHide,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassHide = !isPassHide;
                        });
                      },
                      icon: Icon(isPassHide ? Icons.visibility_off : Icons.visibility),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();
                        print("email :: $email pass :: $password");
                        if(email.isEmpty || password.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("email and password must be not empty"),
                                backgroundColor: Colors.red,
                              )
                          );
                        }
                        else if(email != validEmail || password != validPassword){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("email or password not valid"),
                                backgroundColor: Colors.red,
                              )
                          );
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Success"),
                                backgroundColor: Colors.green,
                              )
                          );
                        }

                      },
                      child: Text('Continue'),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Signupscrn()));
                    }, child: Text("Sign up")),
                  ],
                ),
              ],
            ),
          ),
        )

    );
  }
}
