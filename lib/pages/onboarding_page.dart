import 'package:flutter/material.dart';
import '../styles/color_styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './widgets/buttons.dart';
import './who_are_you.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.primary,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Campvestor",
                    style: GoogleFonts.poppins(
                      color: ColorStyles.white,
                      fontSize: 36,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 45, left: 45, top: 33),
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ColorStyles.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                "Lets get investing!", 
                style: GoogleFonts.poppins(
                  color: ColorStyles.greyText,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 14,),
              Buttons(
                text: "Continue", 
                onClicked: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WhoAreYouPage()));
                }, 
                width: MediaQuery.of(context).size.width, 
                backgroundColor: ColorStyles.primary, 
                fontColor: ColorStyles.white
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}