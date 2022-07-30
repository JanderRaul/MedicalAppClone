import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app_clone/constants.dart';

class CardEspecialidades extends StatelessWidget {
  const CardEspecialidades({
    Key? key, required this.name, required this.icon,
  }) : super(key: key);

  final String name;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: kColorCinza,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 8),
              Text(
                name,
                style:
                    GoogleFonts.inter(fontWeight: FontWeight.w300, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
