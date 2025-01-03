import 'package:flutter/material.dart';
class SElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;
  final bool isSelectable;
  final Color? selectedColor;
  final Color? defaultColor;

  const SElevatedButton({super.key,
  this.text = "Text",
  required this.onPressed,
  this.isSelected = false,
  this.isSelectable = false,
  this.selectedColor,
  this.defaultColor,


  
  });

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 13),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelectable && isSelected
          ? selectedColor 
          : defaultColor,
          minimumSize: Size(ancho*0.33, alto*0.08),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ) 
        ),
        onPressed: onPressed,
        child: Text(text,
        style: TextStyle(
          color: Colors.white
        )
        ),
      ),
    );
  }
}