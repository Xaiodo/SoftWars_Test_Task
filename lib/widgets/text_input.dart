import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String hintText;
  final String initialValue;
  final TextStyle textStyle;
  final Function(String) onChanged;

  const TextInput({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.textStyle,
    required this.initialValue,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.initialValue;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextField(
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: widget.textStyle,
          border: InputBorder.none,
        ),
        controller: _controller,
        onChanged: widget.onChanged,
        style: widget.textStyle,
      );
}
