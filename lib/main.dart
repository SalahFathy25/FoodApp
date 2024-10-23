import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/app/cache/shared_helper.dart';
import 'package:food_app/app/cubit/app_cubit.dart';

import 'package:food_app/app/screens/home/home_screen.dart';
import 'package:food_app/app/screens/login&signup%20screens/login_screen.dart';
import 'package:food_app/app/screens/login&signup%20screens/pick_image_screen.dart';
import 'package:food_app/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/screens/login&signup screens/signup_screen.dart';
import 'core/utils/themes/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  SharedHelper sharedHelper = SharedHelper();
  String theme = prefs.getString('theme') ?? "light";

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(sharedHelper, theme),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late AppCubit appCubit;

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
    appCubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return MaterialApp(
          routes: {
            '/login': (context) => LoginScreen(),
            '/register': (context) => const SignupScreen(),
            '/signup': (context) => const SignupScreen(),
            '/home': (context) => const HomeScreen(),
            '/pickImage': (context) => const PickImageScreen(),
          },
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              appCubit.theme == "light" ? ThemeMode.light : ThemeMode.dark,
          // home: MainPage(),
          home: LoginScreen(),
        );
      },
    );
  }
}
