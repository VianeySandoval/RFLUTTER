import 'dart:html';

import 'package:flutter/material.dart';
import 'package:prueba1/botom_custom.dart';

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
  Operaciones operacion1 = Operaciones.suma;
  TextStyle textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  void _setOperaciones({required String operacion}) {
    switch (operacion) {
      case "+":
        operacion1 = Operaciones.suma;
        break;
      case "-":
        operacion1 = Operaciones.resta;
        break;
      case "*":
        operacion1 = Operaciones.multiplicacion;
        break;
      case "/":
        operacion1 = Operaciones.division;
        break;
    }
  }

  void _setCounter({required int d}) {
    if (_counter != 0) {
      if (_counter2 == 0) {
        switch (d) {
          case 1:
            _counter2 = 1;
            break;
          case 2:
            _counter2 = 2;
            break;
          case 3:
            _counter2 = 3;
            break;
          case 4:
            _counter2 = 4;
            break;
          case 5:
            _counter2 = 5;
            break;
          case 6:
            _counter2 = 6;
            break;
          case 7:
            _counter2 = 7;
            break;
          case 8:
            _counter2 = 8;
            break;
          case 9:
            _counter2 = 9;
            break;
        }
      }
    } else {
      switch (d) {
        case 1:
          _counter = 1;
          break;
        case 2:
          _counter = 2;
          break;
        case 3:
          _counter = 3;
          break;
        case 4:
          _counter = 4;
          break;
        case 5:
          _counter = 5;
          break;
        case 6:
          _counter = 6;
          break;
        case 7:
          _counter = 7;
          break;
        case 8:
          _counter = 8;
          break;
        case 9:
          _counter = 9;
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

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _counter2 = 0;
      resultado = 0;
    });
  }

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
              child: PanelCustom(),
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
                  ButtomCustom(labelButtom: '7', onTap: () {  },),
                  ButtomCustom(labelButtom: '8', onTap: () {  },),
                  ButtomCustom(labelButtom: '9', onTap: () {  },),
                  ButtomCustom(labelButtom: '/', onTap: () {  },),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtomCustom(labelButtom: '4', onTap: () {  },),
                  ButtomCustom(labelButtom: '5', onTap: () {  },),
                  ButtomCustom(labelButtom: '6', onTap: () {  },),
                  ButtomCustom(labelButtom: '*', onTap: () {  },),
                ],
              ),
            ),
             SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtomCustom(labelButtom: '1', onTap: () {  },),
                  ButtomCustom(labelButtom: '2', onTap: () {  },),
                  ButtomCustom(labelButtom: '3', onTap: () {  },),
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
    this.colorCustom = Colors.black,
  });

  final Color colorCustom;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.50, // responsive
      height: MediaQuery.of(context).size.height * 0.15, // responsive
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: colorCustom),
    );
  }
}
