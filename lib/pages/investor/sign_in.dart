import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/buttons.dart';
import '../widgets/text_form.dart';
import '../widgets/password_form.dart';
import 'package:flutter/gestures.dart';
import './sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../styles/color_styles.dart';
import './home_page_investor.dart';

class SignInInvestor extends StatefulWidget {
  const SignInInvestor({Key? key}) : super(key: key);

  @override
  State<SignInInvestor> createState() => _SignInInvestorState();
}

class _SignInInvestorState extends State<SignInInvestor> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: ColorStyles.primary,
        ),
        title: Text(
          "Sign in",
          style: GoogleFonts.poppins(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFields(
              textEditingController: emailController,
              text: "Email",
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            PasswordTextFields(passwordController: passwordController),
            SizedBox(height: 6),
            Text(
              "Forgot your password?",
              style: GoogleFonts.poppins(fontSize: 10),
            ),
            SizedBox(height: 16),
            Buttons(
              text: "Sign In",
              onClicked: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  String username = await _fetchUsername(userCredential.user!.email!);
                  // After successful sign-in, navigate to HomePageInvestor with the username
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePageInvestor(username: userCredential.user!.email!),
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                } catch (e) {
                  print(e);
                }
              },
              width: MediaQuery.of(context).size.width,
              backgroundColor: ColorStyles.primary,
              fontColor: ColorStyles.white,
            ),
            SizedBox(height: 12),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: GoogleFonts.poppins(
                      color: ColorStyles.greyInvis, fontSize: 14),
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: GoogleFonts.poppins(
                          color: ColorStyles.primary,
                          fontWeight: FontWeight.w400),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignUpInvestor())),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _fetchUsername(String email) async {
    String username = "";
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        username = doc["username"];
      });
    });
    return username;
  }
}
