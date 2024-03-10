import 'package:flutter/material.dart';
import '../../styles/color_styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/buttons.dart';
import '../widgets/text_form.dart';
import '../widgets/password_form.dart';
import 'package:flutter/gestures.dart';
import './sign_up.dart';

class SignInInvestor extends StatefulWidget {
  const SignInInvestor({super.key});

  @override
  State<SignInInvestor> createState() => _SignInInvestorState();
}

class _SignInInvestorState extends State<SignInInvestor> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back, color: ColorStyles.primary,
        ),
        title: Text(
          "Sign in",
          style: GoogleFonts.poppins(
            fontSize: 16
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFields(
              textEditingController: usernameController, 
              text: "Name", 
              textInputType: TextInputType.name, 
            ),
            SizedBox(height: 16,),
            PasswordTextFields(
              passwordController: passwordController,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "Forgot your password?",
              style: GoogleFonts.poppins(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Buttons(
              text: "Sign In", 
              onClicked: (){}, 
              width: MediaQuery.of(context).size.width, 
              backgroundColor: ColorStyles.primary, 
              fontColor: ColorStyles.white
            ),
            SizedBox(
              height: 12,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: GoogleFonts.poppins(
                    color: ColorStyles.greyInvis,
                    fontSize: 14
                  ),
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: GoogleFonts.poppins(
                        color: ColorStyles.primary,
                        fontWeight: FontWeight.w400
                      ),
                    recognizer: TapGestureRecognizer() ..onTap = () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpInvestor())),
                    )
                  ]
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}