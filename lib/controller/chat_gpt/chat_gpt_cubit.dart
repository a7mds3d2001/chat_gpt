import 'package:chat_gpt/controller/chat_gpt/chat_gpt_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatGPTCubit extends Cubit<ChatGPTState> {
  ChatGPTCubit() : super(ChatGPTInitialState());

  static ChatGPTCubit get(BuildContext ctx) => BlocProvider.of(ctx);

  /// FORM KEY
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  List<String> list = [];
}
