// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/configs/constant.dart';
import 'package:flutter/material.dart';

class DropdownInfo extends StatelessWidget {
  final String text, name;

  DropdownInfo({
    Key? key,
    required this.text,
    required this.name,
  }) : super(key: key);

  bool _isExpanded = false;
  final TextEditingController _textEditingController =
      TextEditingController(text: 'alo alo alo');
  String? _inputValue = "";
  final _focusNode = FocusNode();

  void _toggleExpanded() {
    _isExpanded = !_isExpanded;
    if (!_isExpanded) {
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpanded,
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: Text(text),
                ),
                AnimatedRotation(
                    turns: _isExpanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: _isExpanded ? kPrimaryColor : Colors.black,
                    ))
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
          height: _isExpanded ? 60 : 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              Container(
                width: 1.5,
                height: 10,
                color: Colors.white,
              ),
              TextButton(
                onPressed: () {
                  _inputValue = _textEditingController.text;
                },
                child: const Text('Lưu'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
