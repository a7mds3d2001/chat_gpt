import 'package:chat_gpt/controller/chat_gpt/chat_gpt_state.dart';
import 'package:chat_gpt/core/network/remote/api/dio_helper.dart';
import 'package:chat_gpt/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatGPTCubit extends Cubit<ChatGPTState> {
  ChatGPTCubit() : super(ChatGPTInitialState());

  static ChatGPTCubit get(BuildContext ctx) => BlocProvider.of(ctx);

  /// FORM KEY
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// CONTROLLER
  TextEditingController controller = TextEditingController();

  /// SCROLL
  ScrollController scrollController = ScrollController();

  /// LIST OF RESPONSES
  List<String> list = [];

  /// LOADING
  bool isLoading = false;

  /// POST DATA AND GET RESPONSE
  Future<void> getResponse() async {
    if (controller.text.isNotEmpty) {
      String text = controller.text;
      controller.clear();
      FocusManager.instance.primaryFocus?.unfocus();
      list.add(text);
      isLoading = true;
      emit(SuccessAddListState());
      await DioHelper.postData(
        url: "completions",
        data: {
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "user",
              "content": text,
            },
          ],
        },
      ).then(
        (value) {
          if (value.statusCode == 200) {
            list.add(value.data["choices"][0]["message"]["content"]);
            isLoading = false;
            emit(SuccessAddListState());
          } else {
            list.add(value.statusMessage.toString());
            isLoading = false;
            emit(SuccessAddListState());
            Fluttertoast.showToast(
              msg: value.statusMessage.toString(),
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG,
              fontSize: 16.0,
              textColor: white,
              timeInSecForIosWeb: 2,
              backgroundColor: black,
            );
          }
        },
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Type Your Massage First',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: black,
        textColor: white,
        fontSize: 16.0,
      );
    }
  }
}
