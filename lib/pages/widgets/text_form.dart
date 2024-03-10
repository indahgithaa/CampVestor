import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../styles/color_styles.dart';

class TextFields extends StatefulWidget {
  final TextEditingController textEditingController;
  final String text;
  final TextInputType textInputType;

  const TextFields({
    Key? key,
    required this.textEditingController,
    required this.text,
    required this.textInputType,
  }) : super(key: key);

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorStyles.greyBg.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8)
      ),
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: widget.textEditingController,
        keyboardType: widget.textInputType,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: ColorStyles.greyInvis,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 19, top: 8, bottom: 8),
          hintText: widget.text,
          hintStyle: TextStyle(
            color: ColorStyles.greyInvis,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorStyles.greyOutline, // Unfocused border color
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorStyles.greyOutline, // Focused border color
            ),
          ),
          isCollapsed: true,
        ),
      ),
    );
  }
}
