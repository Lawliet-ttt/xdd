import 'package:flutter/material.dart';

class STextFormField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final FormFieldSetter<String>? onSaved;
  //final Function(String)? onChanged;
  
  const STextFormField({super.key,  
  this.hintText = "hintext",
  this.icon,
  this.controller,
  this.validator,
  this.onSaved,
  //this.onChanged,
  
});
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 5),
      child: TextFormField(
        controller: controller,
        validator: validator,
        onSaved: onSaved,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        //onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.normal
          ),
          label: Text('Ingresa tu $hintText'),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1.5
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.yellow,
              width: 1.5,
            )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.pink,
              width: 1.5
            )
          )
          
        ),
      ),
    );
  }
}