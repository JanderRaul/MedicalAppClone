import 'package:flutter/material.dart';
import 'package:medical_app_clone/models/doctor_model.dart';
import 'package:medical_app_clone/models/especialidade_model.dart';

class HomeController {
  List<Especialidade> fetchEspecialidade() {
    var lista = <Especialidade>[
      Especialidade(
        name: 'Destist',
        icon: const Icon(Icons.chat_bubble_outline),
      ),
      Especialidade(
        name: 'Surgeon',
        icon: const Icon(Icons.chat_outlined),
      ),
      Especialidade(
        name: 'Therapist',
        icon: const Icon(Icons.chat_bubble_outline),
      ),
    ];
    return lista;
  }

  List<Doctor> fetchDoctor() {
    var lista = <Doctor>[
      Doctor(
        name: 'Dr. Arlene McCoy',
        image: 'assets/doctor2.jpg',
        descricao: 'Therapist, 7 y.e.',
        avaliacao: 4.9,
      ),
      Doctor(
        name: 'Dr. Alberto Flores',
        image: 'assets/doctor1.jpg',
        descricao: 'Surgeon, 5 y.e.',
        avaliacao: 4.8,
      ),
      Doctor(
        name: 'Dr. Igor Ferreira',
        image: 'assets/doctor3.jpg',
        descricao: 'Dentist, 3 y.e.',
        avaliacao: 5.0,
      ),
    ];
    return lista;
  }
}
