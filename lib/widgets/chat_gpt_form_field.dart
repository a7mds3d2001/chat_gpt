import 'package:chat_gpt/core/style/app_color.dart';
import 'package:chat_gpt/core/style/app_padding.dart';
import 'package:chat_gpt/core/style/app_radius.dart';
import 'package:flutter/material.dart';

class ChatGPTFormField extends StatelessWidget {
  const ChatGPTFormField({
    Key? key,
    required this.onTap,
    required this.controller,
  }) : super(key: key);
  final Function() onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: radius20,
          boxShadow: const [
            BoxShadow(color: Color(0xff202123), blurRadius: 5),
          ],
        ),
        padding: paddingTextFormField,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                autofocus: true,
                style: const TextStyle(color: white),
                controller: controller,
                onFieldSubmitted: (val){
                  onTap();
                },
                decoration: const InputDecoration.collapsed(
                  hintText: "Ask What You Want ...",
                  hintStyle: TextStyle(color: white),
                ),
              ),
            ),
            InkWell(
              onTap: onTap,
              child: const Icon(Icons.send, color: white),
            ),
          ],
        ),
      ),
    );
  }
}
