import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app_clone/constants.dart';

class CardDoctors extends StatelessWidget {
  const CardDoctors({
    Key? key, required this.name, required this.image, required this.descricao, required this.avaliacao,
  }) : super(key: key);

  final String name;
  final String image;
  final String descricao;
  final double avaliacao;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: 160,
        height: 200,
        decoration: BoxDecoration(
          color: kColorCinza,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 96,
                  height: 96,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 13,
                  child: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          Text(' $avaliacao'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              descricao,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
