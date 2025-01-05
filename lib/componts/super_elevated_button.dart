import 'package:flutter/material.dart';
class SElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? widthFactor;
  final double? widthHeight;

  const SElevatedButton({super.key,
  this.text = "Text",
  required this.onPressed,
  this.widthFactor,
  this.widthHeight
  
  });

  @override
  Widget build(BuildContext context) {
    
    double buttonWidth  = widthFactor != null ?  widthFactor! : 120;
    double buttonHeight  = widthFactor != null ? widthHeight! : 50;
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 13),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(buttonWidth,buttonHeight),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ) 
        ),
        onPressed: onPressed,
        child: Text(text,
        style: TextStyle(
          color: Colors.black
        )
        ),
      ),
    );
  }
}