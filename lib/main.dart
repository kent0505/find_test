import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/crud/crud_bloc.dart';
import 'blocs/game/game_bloc.dart';
import 'blocs/timer/timer_bloc.dart';
import 'core/themes.dart';
import 'screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    precacheImage(AssetImage('assets/question.png'), context);
    precacheImage(AssetImage('assets/bg1.png'), context);
    precacheImage(AssetImage('assets/bg2.png'), context);
    precacheImage(AssetImage('assets/bg3.png'), context);
    precacheImage(AssetImage('assets/coin.png'), context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CrudBloc()..add(GetModels())),
        BlocProvider(create: (context) => GameBloc()..add(LoadGames())),
        BlocProvider(create: (context) => TimerBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: LoadingScreen(),
      ),
    );
  }
}
