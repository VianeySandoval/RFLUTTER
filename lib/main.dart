import 'dart:html';

import 'package:flutter/material.dart';
import 'package:prueba1/botom_custom.dart';
import 'package:prueba1/enums.dart';
//TODO: SE VA ASIGNAR OPERADORES PARA Q SE MUESTRE, SE VA A SETEAR LOS RESULTADOS EN 0, Y SE HARAN LAS OPERACIONES
void main() {
  runApp(const MyApp());
}

enum Operaciones { suma, resta, multiplicacion, division }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tarea 3',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 145, 8, 8)),
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'Flutter Tarea 3 calculadora'),
      debugShowCheckedModeBanner: true,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _counter = 0;
  double _counter2 = 0;
  double resultado = 0;
  bool cambioValor = false;
  Operaciones operador = Operaciones.suma;
  Operaciones operacion1 = Operaciones.suma;
  TextStyle textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
  );


  void _setCounter({required int d}) {
    if (_counter != 0) {
      if (_counter2 == 0) {
        switch (d) {
          case 1:
            variable2 = "$variable2$d";
            break;
          case 2:
            variable2 = "$variable2$d";
            break;
          case 3:
            variable2 = "$variable2$d";
            break;
          case 4:
            variable2 = "$variable2$d";
            break;
          case 5:
            variable2 = "$variable2$d";
            break;
          case 6:
            variable2 = "$variable2$d";
            break;
          case 7:
            variable2 = "$variable2$d";
            break;
          case 8:
            variable2 = "$variable2$d";
            break;
          case 9:
            variable2 = "$variable2$d";
            break;
        }
      }
    } else {
      switch (d) {
        case 1:
          variable1 = "$variable1$d";
          break;
        case 2:
          variable1 = "$variable1$d";
          break;
        case 3:
          variable1 = "$variable1$d";
          break;
        case 4:
          variable1 = "$variable1$d";_counter = 4;
          break;
        case 5:
          variable1 = "$variable1$d";
          break;
        case 6:
          variable1 = "$variable1$d";
          break;
        case 7:
          variable1 = "$variable1$d";
          break;
        case 8:
          variable1 = "$variable1$d";
          break;
        case 9:
          variable1 = "$variable1$d";
          break;
      }
    }
    setState(() {});
  }

  void _getResult() {
    switch (operacion1) {
      case Operaciones.suma:
        resultado = _counter + _counter2;
        break;
      case Operaciones.resta:
        resultado = _counter - _counter2;
        break;
      case Operaciones.multiplicacion:
        resultado = _counter * _counter2;
        break;
      case Operaciones.division:
        resultado = _counter / _counter2;
        break;
    }

    setState(() {});
  }


  void _cambiovalor(Operaciones operacion2) {
    switch (operacion2) {
      case Operaciones.suma:
        cambioValor = !cambioValor;
        break;
      case Operaciones.resta:
        cambioValor = !cambioValor;
        break;
      case Operaciones.multiplicacion:
        cambioValor = !cambioValor;
        break;
      case Operaciones.division:
        cambioValor = !cambioValor;
        break;
    }
    operador = operacion2;
    setState(() {});
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _counter2 = 0;
      resultado = 0;
    });
  }
  
  String variable1 = "";
  String variable2 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Color.fromARGB(111, 0, 0, 0)),
        //color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: PanelCustom(valor1: variable1, valor2: variable2),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtomCustom(labelButtom: '(', onTap: () {  },),
                  ButtomCustom(labelButtom: ')', onTap: () {  },),
                  ButtomCustom(labelButtom: '%', onTap: () {  },),
                  ButtomCustom(labelButtom: ' AC', onTap: () {  },),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtomCustom(labelButtom: '7', onTap: () { _setCounter(d: 7); },),
                  ButtomCustom(labelButtom: '8', onTap: () { _setCounter(d: 8); },),
                  ButtomCustom(labelButtom: '9', onTap: () { _setCounter(d: 9);  },),
                  ButtomCustom(labelButtom: '/', onTap: () {  },),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtomCustom(labelButtom: '4', onTap: () { _setCounter(d: 4);  },),
                  ButtomCustom(labelButtom: '5', onTap: () { _setCounter(d: 5); },),
                  ButtomCustom(labelButtom: '6', onTap: () { _setCounter(d: 6); },),
                  ButtomCustom(labelButtom: '*', onTap: () {  },),
                ],
              ),
            ),
             SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtomCustom(labelButtom: '1', onTap: () { _setCounter(d: 1); },),
                  ButtomCustom(labelButtom: '2', onTap: () { _setCounter(d: 2); },),
                  ButtomCustom(labelButtom: '3', onTap: () { _setCounter(d: 3); },),
                  ButtomCustom(labelButtom: '-', onTap: () {  },),
                ],
              ),
            ),
             SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtomCustom(labelButtom: '0', onTap: () {  },),
                  ButtomCustom(labelButtom: '.', onTap: () {  },),
                  ButtomCustom(labelButtom: '=', onTap: () {  },),
                  ButtomCustom(labelButtom: '+', onTap: () {  },),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class PanelCustom extends StatelessWidget {
  const PanelCustom({
    super.key,
    required this.valor1,
    required this.valor2,
    this.operador = Operaciones.suma,
    this.colorCustom = const Color.fromARGB(255, 162, 72, 72),

  });

  final Color colorCustom;
  final String valor1;
  final String valor2;
  final Operaciones operador;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.50, // responsive
      height: MediaQuery.of(context).size.height * 0.15, // responsive
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: colorCustom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Text(valor1),
            Text(operador == Operaciones.suma ? "+" : operador == Operaciones.resta ? "-" : operador == Operaciones.multiplicacion ? "*" : "/"),
            Text(valor2)
        ]
        ),
    );
  }
}
