import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class Signupscrn extends StatefulWidget{
  const Signupscrn({super.key});

  @override
  State<StatefulWidget> createState()=> _SignupScrn();

}
class _SignupScrn extends State<Signupscrn>{

  bool isPassHide = true;
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  List todo = ["play","gym","yoga"];


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
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15.0,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("SignUp", style: GoogleFonts.poppins(color: Color(0XFF648DDB), fontSize: 30, fontWeight: FontWeight.w600) ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 46.0),
                    child: Text("Your Email", style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600) ),
                  ),

                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter email";
                      }
                    },
                  ),

                  Text("Mobile No.", style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600) ),

                  TextFormField(
                    controller: mobileController,
                    decoration: InputDecoration(
                      labelText: 'Mobile No.',
                      hintText: 'Enter Your Mobile Number Here',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
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
                        onPressed: (){
                          setState(() {
                            isPassHide = !isPassHide;
                          });
                        },
                        icon: Icon(
                          isPassHide ? Icons.visibility_off : Icons.visibility,
                        ),
                      ), // optional eye icon
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 26, right: 26),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            print("is vaild");
                          }
                          else{
                            print("not vaild");
                          }
                          print('Continue button pressed');
                        },
                        child: Text('Continue'),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                      }, child: Text("Log in")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}