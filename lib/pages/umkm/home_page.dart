import 'package:flutter/material.dart';
import '../../styles/color_styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/buttons.dart';
import '../widgets/text_form.dart';
import '../widgets/password_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageUMKM extends StatefulWidget {
  final String username;

  const HomePageUMKM({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePageUMKM> createState() => _HomePageUMKMState();
}

class _HomePageUMKMState extends State<HomePageUMKM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/foto-umkm.svg'),
                    SizedBox(width: 17),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat Datang,",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorStyles.white,
                          ),
                        ),
                        Text(
                          widget.username, // Display the username
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorStyles.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Icon(Icons.notifications, color: ColorStyles.white, size: 30),
              ],
            ),
          )
        ],
      ),
    );
  }
}
