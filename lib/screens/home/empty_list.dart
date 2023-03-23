import 'package:chat_gpt/core/style/app_color.dart';
import 'package:chat_gpt/core/style/app_padding.dart';
import 'package:chat_gpt/widgets/empty_card_item.dart';
import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: padding20,
        child: Column(
          children: const [
            Icon(
              Icons.wb_sunny_outlined,
              color: white,
              size: 50,
            ),
            SizedBox(height: 20.0),
            Text(
              'Examples',
              style: TextStyle(
                fontSize: 25,
                color: white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.0),
            EmptyCardItem(
              text: 'Explain quantum computing in simple terms',
            ),
            SizedBox(height: 20.0),
            EmptyCardItem(
              text: 'Got any creative ideas for a 10 year old’s birthday?',
            ),
            SizedBox(height: 20.0),
            EmptyCardItem(
              text: 'How do I make an HTTP request in Javascript?',
            ),
          ],
        ),
      ),
    );
  }
}
