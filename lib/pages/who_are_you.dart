import 'package:flutter/material.dart';
import '../styles/color_styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './widgets/buttons.dart';
import './investor/sign_in.dart';
import './umkm/sign_in.dart';

class WhoAreYouPage extends StatefulWidget {
  const WhoAreYouPage({super.key});

  @override
  State<WhoAreYouPage> createState() => _WhoAreYouPageState();
}

class _WhoAreYouPageState extends State<WhoAreYouPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back, color: ColorStyles.primary,
        ),
        title: Text(
          "Who are you?",
          style: GoogleFonts.poppins(
            fontSize: 16
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 30, left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Buttons(
              text: "Investor", 
              onClicked: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignInInvestor()));
              }, 
              width: MediaQuery.of(context).size.width, 
              backgroundColor: ColorStyles.primary, 
              fontColor: ColorStyles.white
            ),
            SizedBox(height: 27,),
            Text(
              "OR",
              style: GoogleFonts.poppins(
                color: ColorStyles.greyText,
                fontSize: 16
              ),
            ),
            SizedBox(height: 27,),
            Buttons(
              text: "UMKM", 
              onClicked: (){}, 
              width: MediaQuery.of(context).size.width, 
              backgroundColor: ColorStyles.primary, 
              fontColor: ColorStyles.white
            ),
          ]
        ),
      ),
    );
  }
}