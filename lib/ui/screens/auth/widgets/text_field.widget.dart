import 'package:app_use/ui/styles/colors.style.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.theme,
    required this.label,
    required this.obscure,
    required this.icon,
    required this.controller,
  });

  final TextTheme theme;
  final String label;
  final bool obscure;
  final Icon icon;

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.bodyMedium?.copyWith(
              color: labelTextField,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TextFormField(
          validator: (value){
            return null;
          },
            controller: controller,
            obscureText: obscure,
            cursorColor: darkColor,
            style: const TextStyle(
              color: darkColor,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: backgroundTextField),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: backgroundTextField),
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: backgroundTextField,
              filled: true,
              contentPadding: const EdgeInsets.all(10),
              prefixIcon: icon,
            ),
          ),
        ],
      ),
    );
  }
}
