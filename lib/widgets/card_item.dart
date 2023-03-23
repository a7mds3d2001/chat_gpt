import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_gpt/core/style/app_color.dart';
import 'package:chat_gpt/core/style/app_padding.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.text,
    required this.index,
  }) : super(key: key);
  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding20,
      color: index % 2 == 0 ? Colors.transparent : const Color(0xff444654),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            index % 2 == 0 ? Icons.person : Icons.ac_unit,
            color: white,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: index % 2 == 0
                ? Text(
                    text,
                    style: const TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        text,
                        speed: const Duration(milliseconds: 40),
                        textStyle: const TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
          ),
        ],
      ),
    );
  }
}
