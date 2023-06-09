import 'package:chat_gpt/controller/chat_gpt/chat_gpt_cubit.dart';
import 'package:chat_gpt/core/network/remote/api/dio_helper.dart';
import 'package:chat_gpt/core/style/app_color.dart';
import 'package:chat_gpt/core/style/app_theme.dart';
import 'package:chat_gpt/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  /// DIO INITIALIZE
  DioHelper.init();

  /// SET STATUS BAR COLORS
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: bg,
      statusBarBrightness: Brightness.light, // ios
      statusBarIconBrightness: Brightness.light, // android
    ),
  );

  /// SET DISABLE AUTO ROTATE
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ChatGPTCubit(),
        ),
      ],
      child: MaterialApp(
        theme: appTheme,
        title: 'Chat GPT',
        themeMode: ThemeMode.dark,
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
