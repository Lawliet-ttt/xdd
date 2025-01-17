import 'package:flutter/material.dart';
class SDropdownButton extends StatefulWidget {
  final List<String> items;
  final Function(String?)? onChanged;
  final String hint;
  final TextStyle ? textStyle;
  final Color ? dropdownColor;
  final Color ? foregroundColor;
  final IconData? icon;
  final FormFieldSetter<String>? onSaved;
  const SDropdownButton({super.key,
  required this.items,
  this.onChanged,
   required this.hint,
  this.textStyle,
  this.dropdownColor,
  this.foregroundColor,
  this.icon,
  this.onSaved
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
          hint: Text(
            selectedValue ?? widget.hint),
          value: selectedValue,
          icon: Icon(widget.icon),
          dropdownColor: widget.dropdownColor ?? Colors.white,
          items: widget.items.map((String value){
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value)
                );
            }).toList(),  
              onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue; // Actualiza el valor seleccionado
              });

              if (widget.onChanged != null) {
                widget.onChanged!(newValue); // Llama al callback externo
              }
            },
              underline : SizedBox.shrink(),
              isExpanded: true,
              
            ),
        ),
      ),
    );
      
  }
}