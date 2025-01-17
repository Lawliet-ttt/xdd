import 'package:flutter/material.dart';
class SDropdownButton extends StatefulWidget {
  final String title;
  final List<String> items;
  final Function(String?)? onChanged;
  final String hint;
  final TextStyle ? textStyle;
  final Color ? dropdownColor;
  final Color ? foregroundColor;
  final IconData? icon;
  const SDropdownButton({super.key,
  required this.title,
  required this.items,
  this.onChanged,
  this.hint = 'Selecciona una opcion',
  this.textStyle,
  this.dropdownColor,
  this.foregroundColor,
  this.icon,
  });

  @override
  State<SDropdownButton> createState() => _SDropdownButtonState();
}

class _SDropdownButtonState extends State<SDropdownButton> {
  String? selectedValue;
  

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 7),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.dropdownColor ?? Colors.blue,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(8),
          
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
          child: DropdownButton<String>(
          hint: Text(widget.hint),
          value: selectedValue,
          icon: Icon(widget.icon),
          dropdownColor: widget.dropdownColor ?? Colors.white,
          
          items: widget.items.map((String value){
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value)
                );
            }).toList(),  
              onChanged : widget.onChanged,
              underline : SizedBox.shrink(),
              isExpanded: true,
              
            ),
        ),
      ),
    );
      
  }
}