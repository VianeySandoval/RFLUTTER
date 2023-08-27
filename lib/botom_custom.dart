import 'package:flutter/material.dart';

class ButtomCustom extends StatelessWidget {
  const ButtomCustom({
    super.key,
    this.backgroundButtom = Colors.black45,
    required this.labelButtom,
    required this.onTap,
    this.styleLabelButtom = const TextStyle(fontWeight: FontWeight.bold,color: Colors.white) ,
  });
  final Color backgroundButtom;
  final String labelButtom;
  final VoidCallback onTap;
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
          width: MediaQuery.of(context).size.width * 0.122, // responsive
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
