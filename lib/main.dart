import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum Operaciones { suma, resta, multiplicacion, division }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tarea 2',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 129, 97, 124)),
       
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'Flutter Tarea 2 calculadora'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$resultado',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () => _setCounter(d: 9),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child: Text(
                    '9',
                    style: textStyle,
                  ),
                ),
                MaterialButton(
                  onPressed: () => _setCounter(d: 8),
                   color: Theme.of(context).appBarTheme.backgroundColor,
                  child:  Text(
                    '8',
                    style: textStyle,
                  ),
                ),
                MaterialButton(
                  onPressed: () => _setCounter(d: 7),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child:  Text(
                    '7',
                    style: textStyle,
                  ),
                ),
                MaterialButton(
                  onPressed: () => _setOperaciones(operacion: "/"),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child: Text(
                    '/',
                    style: textStyle,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () => _setCounter(d: 6),
                   color: Theme.of(context).appBarTheme.backgroundColor,
                  child: Text(
                    '6',
                    style: textStyle,
                  ),
                ),
                MaterialButton(
                  onPressed: () => _setCounter(d: 5),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child: Text(
                    '5',
                    style: textStyle,
                  ),
                ),
                MaterialButton(
                  onPressed: () => _setCounter(d: 4),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child:  Text(
                    '4',
                    style: textStyle,
                  ),
                ),
                MaterialButton(
                  onPressed: () => _setOperaciones(operacion: "*"),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child: Text(
                    '*',
                    style: textStyle,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () => _setCounter(d: 3),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child:  Text(
                    '3',
                    style: textStyle,
                  ),
                ),
                MaterialButton(
                  onPressed: () => _setCounter(d: 2),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child:  Text(
                    '2',
                    style: textStyle,
                  ),
                ),
                MaterialButton(
                  onPressed: () => _setCounter(d: 1),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child:  Text(
                    '1',
                    style: textStyle,
                  ),
                ),
                MaterialButton(
                  onPressed: () => _setOperaciones(operacion: "-"),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child:  Text(
                    '-',
                    style: textStyle,
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: null,
                  child: Text('0'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: _getResult,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child: const Text(
                    '=',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: _resetCounter,
                  color: const Color.fromARGB(150, 248, 23, 23),
                  child: const Text(
                    'reset',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () => _setOperaciones(operacion: "+"),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child: const Text(
                    '+',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
}
