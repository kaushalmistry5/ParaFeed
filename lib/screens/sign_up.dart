import 'package:flutter/material.dart';
import 'package:parafeed/common/app_button.dart';
import 'package:parafeed/screens/login.dart';

import '../common/app_color.dart';
import '../common/custom_text_field.dart';
import '../common/textstyle.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static const Color primaryColor = Color(0xFF5474FF);

  final _formKey = GlobalKey<FormState>();

  bool agree = false;
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // SIMPLE EMAIL VALIDATION
  bool isValidEmail(String email) {
    final emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("SignUp", style: littleDarkTextStyle(fontSize: 34,color: primary)),
                  ],
                ),

                buildLabel("Full Name"),
                buildTextField(

                  hint: "Kaushal",
                ),
                // CustomTextField(
                //   hintText: "Kaushal Mistry",
                //   labelText: "Full Name",
                // ),

                const SizedBox(height: 16),

                buildLabel("Email Address"),
                buildTextField(
                  controller: emailController,
                  hint: "mistrykaushal29@gmail.com",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!isValidEmail(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                buildLabel("Phone Number"),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: const [
                          Text("+91"),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: buildTextField(
                        hint: "8123456789",
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                buildLabel("Password"),
                buildTextField(
                  controller: passwordController,
                  hint: "Enter Your Password",
                  obscure: hidePassword,
                  suffix: IconButton(
                    icon: Icon(
                      hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 16),

                buildLabel("Confirm Password"),
                buildTextField(
                  hint: "Enter Your Password",
                  obscure: hideConfirmPassword,
                  suffix: IconButton(
                    icon: Icon(
                      hideConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        hideConfirmPassword = !hideConfirmPassword;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // TERMS
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: agree,
                      activeColor: primaryColor,
                      onChanged: (value) {
                        setState(() {
                          agree = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: "By creating an account, you agree to our ",
                          style: const TextStyle(color: Colors.grey),
                          children: const [
                            TextSpan(
                              text: "Terms ",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(text: "and "),
                            TextSpan(
                              text: "Conditions",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // SIGN UP BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: AppButton(
                    onTap: () {
                      if (_formKey.currentState!.validate() && agree) {
                        // SUCCESS (static)
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Sign Up Successful"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                      }
                    },
                    btnText: 'Sign Up',
                  ),
                ),

                const SizedBox(height: 20),

                // LOGIN TEXT
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // REUSABLE LABEL
  Widget buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // REUSABLE TEXTFIELD
  Widget buildTextField({
    String? hint,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscure = false,
    Widget? suffix,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffix,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor),
        ),
      ),
    );
  }
}