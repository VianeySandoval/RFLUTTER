import 'package:flutter/material.dart';
import 'dart:io';

// Este widget personalizado recibe todas las funciones que tiene nuestro boton las cuales son cambiar el fondo, agregar una etiqueta, obtener una funcion personnalizada y cambiar el estilo de la letra
class ButtomCustom extends StatelessWidget {
  const ButtomCustom({
    super.key,
    this.backgroundButtom = Colors.black45,
    required this.labelButtom,
    required this.onTap,
    this.styleLabelButtom = const TextStyle(fontWeight: FontWeight.bold,color: Colors.white) ,
  });
  /// Esta propiedad recibe el color del background de nuestro boton 
  final Color backgroundButtom;
  /// Esta propiedad recibe la etiqueta que se muestra en pantalla
  final String labelButtom;
  /// Esta propiedad recibe una funcion personalizada que no retorna nada
  final VoidCallback onTap;
  /// Esta propiedad recibe el estilo de la etiqueta
  final TextStyle styleLabelButtom;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.only(left:3,top: 5 ),
        child: Container(
          width: Platform.isAndroid || Platform.isIOS ? MediaQuery.of(context).size.width * 0.220 : MediaQuery.of(context).size.width * 0.122, // responsive
          height: MediaQuery.of(context).size.height * 0.10,
          alignment: Alignment.center, // responsive
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: backgroundButtom),
          child: Text(labelButtom, style: styleLabelButtom),
        ),
      ),
    );
  }
}
