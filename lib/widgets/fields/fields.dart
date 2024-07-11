import 'package:flutter/material.dart';

final TextEditingController emailController = TextEditingController();

InputDecoration getFieldName( String label) {
  return InputDecoration(
    
    border: InputBorder.none, // Remove a borda do TextField
    focusedBorder: InputBorder.none, // Remove
    hintText: label,
    
  );
}
