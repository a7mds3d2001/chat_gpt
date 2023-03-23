import 'package:chat_gpt/controller/chat_gpt/chat_gpt_cubit.dart';
import 'package:chat_gpt/controller/chat_gpt/chat_gpt_state.dart';
import 'package:chat_gpt/widgets/chat_gpt_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatGPTCubit cubit = ChatGPTCubit.get(context);
    return Scaffold(
      appBar: AppBar(title: const Text('ChatGPT')),
      body: BlocBuilder<ChatGPTCubit, ChatGPTState>(builder: (context, state) {
        return Column(
          children: [
            Expanded(child: Container()),
            ChatGPTFormField(
              onTap: () {},
              controller: cubit.controller,
            ),
          ],
        );
      }),
    );
  }
}
