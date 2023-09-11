import 'package:flutter/material.dart';
import 'dart:async';

class Cronometro extends StatefulWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  State<Cronometro> createState() => _CronometroState();
}

class _CronometroState extends State<Cronometro> {
  Stopwatch _cronometro = Stopwatch();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    iniciarCronometro();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void iniciarCronometro() {
    setState(() {
      _cronometro.start();
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      actualizarCronometro();
    });
  }

  void actualizarCronometro() {
    setState(() {});
  }

  void detenerCronometro() {
    setState(() {
      _cronometro.stop();
    });
    _timer?.cancel();
  }

  String mostrarCronometro() {
    final tiempo = _cronometro.elapsed;
    String minutos = (tiempo.inMinutes % 60).toString().padLeft(2, '0');
    String segundos = (tiempo.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutos:$segundos';
  }

  @override
  Widget build(BuildContext context) {
    return Text(mostrarCronometro());
  }
}
