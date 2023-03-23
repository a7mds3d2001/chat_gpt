import 'package:chat_gpt/core/style/app_color.dart';
import 'package:chat_gpt/core/style/app_padding.dart';
import 'package:chat_gpt/core/style/app_radius.dart';
import 'package:flutter/material.dart';

class EmptyCardItem extends StatelessWidget {
  const EmptyCardItem({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff3E3F4B),
        borderRadius: radius20,
      ),
      padding: padding20,
      child: Text(text, style: const TextStyle(color: white)),
    );
  }
}
