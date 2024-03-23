import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/buttons.dart';
import '../widgets/text_form.dart';
import '../widgets/password_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import '../../styles/color_styles.dart';

class SignUpInvestor extends StatefulWidget {
  const SignUpInvestor({Key? key}) : super(key: key);

  @override
  _SignUpInvestorState createState() => _SignUpInvestorState();
}

class _SignUpInvestorState extends State<SignUpInvestor> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _passwordVisible = false;
  bool? rememberMe = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void toggleRememberMe(bool? newValue) => setState(() {
        rememberMe = newValue;
      });

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: ColorStyles.primary,
        ),
        title: Text(
          "Sign Up",
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
              textEditingController: usernameController,
              text: "Name",
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 16),
            TextFields(
              textEditingController: emailController,
              text: "Email",
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            PasswordTextFields(passwordController: passwordController),
            SizedBox(height: 16),
            PasswordTextFields(
              passwordController: confirmPasswordController,
            ),
            SizedBox(height: 18),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        toggleRememberMe(value);
                      });
                    },
                    activeColor: ColorStyles.primary,
                    checkColor: ColorStyles.white,
                    side: BorderSide(color: ColorStyles.greyOutline),
                  ),
                  Flexible(
                    child: Text(
                      "Yes, I want to receive discounts, loyalty offers and other updates.",
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.poppins(
                          color: ColorStyles.grey2, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Buttons(
              text: "Sign Up",
              onClicked: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(userCredential.user!.uid)
                      .set({
                    'username': usernameController.text,
                    'email': emailController.text,
                  });

                  _showSuccessSnackbar();
                  
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
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
          ],
        ),
      ),
    );
  }

  void _showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Berhasil mendaftar. Silakan login dengan email dan password Anda.',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorStyles.primary, // Customize the Snackbar background color
      ),
    );
  }

}
