import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_gpt/controller/chat_gpt/chat_gpt_cubit.dart';
import 'package:chat_gpt/controller/chat_gpt/chat_gpt_state.dart';
import 'package:chat_gpt/core/style/app_color.dart';
import 'package:chat_gpt/core/style/app_padding.dart';
import 'package:chat_gpt/widgets/chat_gpt_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatGPTCubit cubit = ChatGPTCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.ac_unit,
          size: 30,
        ),
        title: const Text('ChatGPT'),
      ),
      body: BlocBuilder<ChatGPTCubit, ChatGPTState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: cubit.scrollController,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: padding20,
                      color: index % 2 == 0
                          ? Colors.transparent
                          : const Color(0xff444654),
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
                                    cubit.list[index],
                                    style: const TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : AnimatedTextKit(
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        cubit.list[index],
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
                  },
                  itemCount: cubit.list.length,
                ),
              ),
              ChatGPTFormField(
                onTap: cubit.getResponse,
                controller: cubit.controller,
              ),
            ],
          );
        },
      ),
    );
  }
}
