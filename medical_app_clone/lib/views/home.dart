import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app_clone/constants.dart';
import 'package:medical_app_clone/controllers/home_controller.dart';
import 'package:medical_app_clone/widgets/card_doctors.dart';
import 'package:medical_app_clone/widgets/card_especialidades.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Widget _titleDoctorList() {
    return Row(
      children: [
        Text(
          'Doctor List',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'See all',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }

  Widget _hello() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Jerome Bell',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          height: 60,
          width: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              'assets/person1.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _textfield() {
    return Container(
      decoration: BoxDecoration(
        color: kColorCinza,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        style: GoogleFonts.inter(color: Colors.grey),
        decoration: InputDecoration(
          border: InputBorder.none,
          label: Text(
            'How can we help you?',
            style: GoogleFonts.inter(color: Colors.grey[400]),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }

  Widget _cardStarted(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kColorRosa,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                        Image.asset('assets/scientist2.png', fit: BoxFit.fill)),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How do you feel?',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Fill out your medical \ncard right now',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 42, vertical: 12),
                  decoration: BoxDecoration(
                    color: kColorLilas,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final listDoctor = HomeController().fetchDoctor();
  final listEspec = HomeController().fetchEspecialidade();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: _hello(),
                  ),
                  const SizedBox(height: 32),
                  _cardStarted(context),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: _textfield(),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: 56,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: listEspec.length,
                      itemBuilder: (context, index) {
                      return CardEspecialidades(
                        name: listEspec[index].name!,
                        icon: listEspec[index].icon!,
                      );
                    }),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: _titleDoctorList(),
                  ),
                  // listview doctor list
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: listDoctor.length,
                        itemBuilder: (context, index) {
                          return CardDoctors(
                            name: listDoctor[index].name!,
                            image: listDoctor[index].image!,
                            descricao: listDoctor[index].descricao!,
                            avaliacao: listDoctor[index].avaliacao!,
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.home_outlined,
                color: Colors.grey,
              ),
              Icon(
                Icons.chat_outlined,
                color: Colors.grey,
              ),
              Icon(
                Icons.notifications_outlined,
                color: Colors.grey,
              ),
              Icon(
                Icons.calendar_month_outlined,
                color: Colors.grey,
              ),
            ],
          ),
        ));
  }
}
