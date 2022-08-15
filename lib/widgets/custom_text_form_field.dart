import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    required bool enableSuggestions,
    required bool autocorrect,
  })  : _controller = controller,
        _label = label,
        _obscureText = obscureText,
        _autocorrect = autocorrect,
        _enableSuggestions = enableSuggestions,
        super(key: key);

  final TextEditingController _controller;
  final String _label;
  final bool _obscureText;
  final bool _enableSuggestions;
  final bool _autocorrect;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      controller: _controller,
      enableSuggestions: _enableSuggestions,
      autocorrect: _autocorrect,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        label: Text(
          _label,
        ),
        border: const OutlineInputBorder(),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'The $_label field cannot be empty!';
        }
        return null;
      },
    );
  }
}
