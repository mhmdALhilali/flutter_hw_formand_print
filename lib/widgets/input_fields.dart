import 'package:flutter/material.dart';

Widget buildTextField(
  String label,
  IconData icon,
  Function(String) onChanged, {
  TextInputType? keyboardType,
  bool obscureText = false,
  String? Function(String?)? validator,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: TextFormField(
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    ),
  );
}

Widget buildDropdown(
  String label,
  IconData icon,
  String? value,
  List<String> items,
  Function(String?) onChanged,
) {
  return DropdownButtonFormField<String>(
    value: value,
    onChanged: onChanged,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: Colors.grey[50],
    ),
    items: items
        .map(
          (item) => DropdownMenuItem(
            value: item,
            child: Text(item),
          ),
        )
        .toList(),
  );
}

Widget formSectionTitle(String title, {Color? color}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black87,
      ),
    ),
  );
}
