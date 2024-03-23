import 'package:flutter/material.dart';
import '../../styles/color_styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/buttons.dart';
import '../widgets/text_form.dart';
import '../widgets/password_form.dart';

class HomePageInvestor extends StatefulWidget {
  final String username;
  const HomePageInvestor({
    Key? key,
    required this.username,
  });

  @override
  State<HomePageInvestor> createState() => _HomePageInvestorState();
}

class _HomePageInvestorState extends State<HomePageInvestor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorStyles.primary,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: 17),
                    Column(children: [
                        Text("Selamat Datang", 
                          style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorStyles.white
                          ),
                        ),
                        Text(
                          "${widget.username}",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorStyles.white
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