import 'package:flutter/material.dart';
class SDropdownButton extends StatefulWidget {
  final String title;
  final List<String> items;
  final Function(String?)? onChanged;
  const SDropdownButton({super.key,
  required this.title,
  required this.items,
  this.onChanged
  });

  @override
  State<SDropdownButton> createState() => _SDropdownButtonState();
}

class _SDropdownButtonState extends State<SDropdownButton> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
    hint: Text('Selecciona una opcion'),
    value: selectedValue,
    items: widget.items.map((String value){
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
          );
      }).toList(),
        onChanged : widget.onChanged
      );
  }
}