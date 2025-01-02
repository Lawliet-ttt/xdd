import 'package:flutter/material.dart';
class EElevatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;
  final bool isSelectable;
  final Color selectedColor;
  final Color defaultColor;
  final String  sgenero1;
  const EElevatedButton({super.key,
  this.text = "Text",
  required this.onPressed,
  this.isSelected = false,
  this.isSelectable = false,
  this.selectedColor = const Color(0xFF1E3A8A),
  this.defaultColor = const Color(0xFF2A4365),
  this.sgenero1 = "1"

  });

  @override
  State<EElevatedButton> createState() => _EElevatedButtonState();
}

class _EElevatedButtonState extends State<EElevatedButton> {
  String sg1 = "";
  
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
     return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 13),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isSelectable && widget.isSelected
          ? widget.selectedColor 
          : widget.defaultColor,
          minimumSize: Size(ancho*0.33, alto*0.08),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ) 
        ),
        onPressed: widget.onPressed,
        child: Text(widget.text,
        style: TextStyle(
          color: Colors.white
        )
        ),
      ),
    );
  }
}