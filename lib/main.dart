//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prueba1/botom_custom.dart';
import 'package:prueba1/enums.dart';


//La clase main es la que activa o inicia la ejecucion de aplicaciones en flutter para que siempre se ejecute el widget principal (MyApp)
void main() {
  runApp(const MyApp());
}

// Un enum es una clasificacion de datos que tiene un conjunto de constantes que puedes registrar para ocuparlas en diferentes casos
enum Operaciones { suma, resta, multiplicacion, division,porcentaje }

// Este widget representa el punto mas bajo del arbol de widgets de la aplicacion en el se pueden configurar temas,idiomas,rutas, etc
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Este cammpo de MaterialApp representa el titulo que se vera a nivel general en la aplicacion movil
      title: 'Flutter Tarea 3',
      // Este campo de MaterialApp representa el tema de la aplicacion movil
      theme: ThemeData(
        // Este campo de ThemeData configura de manera global los appbar que se presenten en la aplicacion
        appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 145, 8, 8)),
        //Este campo de ThemeData configura una previsualizacion de como se veria la aplicacion si quisieras ocupar los estilos de materialApp 3
        useMaterial3: false,
      ),
      // Este campo de materialApp es la ruta incial que se muestra en la aplicacion
      home: const MyHomePage(title: 'Flutter Tarea 3 calculadora'),
      // Este campo de materialApp gestiona el banner de modo debug
      debugShowCheckedModeBanner: true,
    );
  }
}

// Esta stalful widget representa la pagina principal de la aplicacion
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String variable1 = "";
  String variable2 = "";
  String resultados = "";
  bool cambioValor = false;
  Operaciones operador = Operaciones.suma;
  Operaciones operacion1 = Operaciones.suma;
  // La variable TextStyle se declara para homogeneizar los textos de toda esta pantalla.
  TextStyle textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  // Este metodo es el encargado de realizar las operaciones basicas de la calculadora
  void _result() {
    switch (operador) {
      case Operaciones.suma:
        resultados =
            (double.parse(variable1) + double.parse(variable2)).toString();
        break;
      case Operaciones.resta:
        resultados =
            (double.parse(variable1) - double.parse(variable2)).toString();
        break;
      case Operaciones.multiplicacion:
        resultados =
            (double.parse(variable1) * double.parse(variable2)).toString();
        break;
      case Operaciones.division:
        resultados =
            (double.parse(variable1) / double.parse(variable2)).toString();
        break;
      case Operaciones.porcentaje:
         _porcentaje();
        break;
    }
    setState(() {});
  }

  // Este metodo es el encargado de asignarle un valor a las variables variable1 y variable2
  void _setCounter({required int d}) {
    if (cambioValor) {
          variable2 = "$variable2$d";
    } else {
        variable1 = "$variable1$d";
    }
    setState(() {});
  }

  // Este metodo se encarga de la decision de que operacion se va a realizar y el cambio de nuestra bandera que asigna el valor entre variable1 y variable2
  void _cambiovalor(Operaciones operacion2) {
    cambioValor = !cambioValor;
    operador = operacion2;
    setState(() {});
  }

  // Este metodo es el encargado de reiniciar la calculadora
  void _resetCounter() {
    setState(() {
      variable1 = "";
      variable2 = "";
      resultados = "";
      cambioValor = false;
    });
  }

  // Este metodo es el encargado de agregar un punto a las variables
  void _punto() {
    // En este if se evalua si cambio valor es igual a true lo que significaria que se esta apuntando a variable
    if (cambioValor) {
      // Este if se encarga de evaluar si la variable variable2 contiene un punto
      if (!variable2.contains(".")) {
        // Si variable2 no contiene un punto se agrega un punto
        variable2 = "$variable2.";
      }
    } else {
      // Este if se encarga de evaluar si la variable variable1 contiene un punto
      if (!variable1.contains(".")) {
        // Si variable1 no contiene un punto se agrega un punto
        variable1 = "$variable1.";
      }
    }
  }
   
   //Este metodo saca el porcentaje
  void _porcentaje(){
     resultados =
            ((double.parse(variable2) * double.parse(variable1))/100).toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Este widget es el widget padre de toda esta pantalla
    return Scaffold(
      //La propiedad de scaffold de AppBar se encarga de crear un apartado de titulo preconfigurado en el tema
      appBar: AppBar(
        // La propiedad title de AppBar recibe un widget de tipo Text que reprensenta el titulo de la pantalla
        title: Text(widget.title),
        // La propiedad center de AppBar se encarga de centrar el titulo de la pantalla
        centerTitle: true,
      ),
      // La propiedad body de Scaffold muestra cualquier widget apartir del AppBar
      body: Container(
        // La propiedad width de Container se encarga de establecer el ancho de la pantalla
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Color.fromARGB(111, 0, 0, 0)),
        //color: Colors.black,
        // El widget column es un widget que agrupa widgets de manera horizontal
        child: Column(
          // La propiedad mainAxisAlignment se encarga de la alineacion de manera horizontal
          mainAxisAlignment: MainAxisAlignment.start,
          // La propiedad CrossAxisAlignment se encarga de la alineacion de manera vertical
          crossAxisAlignment: CrossAxisAlignment.center,
          // La propiedad children de este colum se encarga de agrupar los widgets de manera horizontal
          children: [
            // Este widget padding agrega un padding a eleccion
            Padding(
              padding: const EdgeInsets.all(12.0),
              // Este es un widget personalizado
              child: PanelCustom(
                valor1: variable1,
                valor2: variable2,
                resultado: resultados,
                operador: operador,
              ),
            ),
            // Este widget agrega un widget contenedor que permite tener widgets dentro y poderles asignar un tamaño definido
            SizedBox(
              // La propiedad width de Container se encarga de establecer el ancho de la pantalla
              width: double.infinity,
              // El widget Row es un widget que agrupa widgets de manera vertical
              child: Row(
                // La propiedad mainAxisAlignment se encarga de la alineacion de manera horizontal
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtomCustom(
                    labelButtom: '(',
                    onTap: () {},
                  ),
                  ButtomCustom(
                    labelButtom: ')',
                    onTap: () {},
                  ),
                  ButtomCustom(
                    labelButtom: '%',
                    onTap: () { _cambiovalor(Operaciones.porcentaje);},
                  ),
                  ButtomCustom(
                    labelButtom: ' AC',
                    onTap: () {
                      _resetCounter();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtomCustom(
                    labelButtom: '7',
                    onTap: () {
                      _setCounter(d: 7);
                    },
                  ),
                  ButtomCustom(
                    labelButtom: '8',
                    onTap: () {
                      _setCounter(d: 8);
                    },
                  ),
                  ButtomCustom(
                    labelButtom: '9',
                    onTap: () {
                      _setCounter(d: 9);
                    },
                  ),
                  ButtomCustom(
                    labelButtom: '/',
                    onTap: () {
                      _cambiovalor(Operaciones.division);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtomCustom(
                    labelButtom: '4',
                    onTap: () {
                      _setCounter(d: 4);
                    },
                  ),
                  ButtomCustom(
                    labelButtom: '5',
                    onTap: () {
                      _setCounter(d: 5);
                    },
                  ),
                  ButtomCustom(
                    labelButtom: '6',
                    onTap: () {
                      _setCounter(d: 6);
                    },
                  ),
                  ButtomCustom(
                    labelButtom: '*',
                    onTap: () {
                      _cambiovalor(Operaciones.multiplicacion);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtomCustom(
                    labelButtom: '1',
                    onTap: () {
                      _setCounter(d: 1);
                    },
                  ),
                  ButtomCustom(
                    labelButtom: '2',
                    onTap: () {
                      _setCounter(d: 2);
                    },
                  ),
                  ButtomCustom(
                    labelButtom: '3',
                    onTap: () {
                      _setCounter(d: 3);
                    },
                  ),
                  ButtomCustom(
                    labelButtom: '-',
                    onTap: () {
                      _cambiovalor(Operaciones.resta);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtomCustom(
                    labelButtom: '0',
                    onTap: () { _setCounter(d: 0);},
                  ),
                  ButtomCustom(
                    labelButtom: '.',
                    onTap: () {
                      _punto();
                    },
                  ),
                  ButtomCustom(
                    labelButtom: '=',
                    onTap: () {
                      _result();
                    },
                  ),
                  ButtomCustom(
                    labelButtom: '+',
                    onTap: () {
                      _cambiovalor(Operaciones.suma);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Este widget muestra en pantalla una representacion de las operaciones que realiza el usuario
class PanelCustom extends StatelessWidget {
  const PanelCustom({
    super.key,
    required this.valor1,
    required this.valor2,
    required this.resultado,
    required this.operador,
    this.colorCustom = const Color.fromARGB(255, 162, 72, 72),
  });

  /// Esta propiedad recibe el color del background
  final Color colorCustom;

  /// Esta propiedad recibe el primer valor digitado por parte del usuario
  final String valor1;

  /// Esta propiedad recibe el primer valor digitado por parte del usuario
  final String valor2;

  /// Esta propiedad recibe el operador que se muestra en pantalla
  final Operaciones operador;

  /// Esta propiedad recibe el resultado de la operacion que realiza el usuario
  final String resultado;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  Platform.isAndroid || Platform.isIOS ? MediaQuery.of(context).size.width * 0.900 : MediaQuery.of(context).size.width * 0.50, // responsive
      height: MediaQuery.of(context).size.height * 0.15, // responsive
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: colorCustom),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(valor1),
            Text(operador == Operaciones.suma
                ? "+"
                : operador == Operaciones.resta
                    ? "-"
                    : operador == Operaciones.multiplicacion
                        ? "*" 
                        : operador == Operaciones.division
                        ? "/"
                        : "%"),
            Text(valor2),
            const Text("="),
            Text(resultado),
          ]),
    );
  }
}
