import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/data/data_bloc.dart';
import '../widgets/loading_widget.dart';
import '../widgets/scaffold2.dart';
import '../widgets/svg_widget.dart';
import 'home_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold2(
      body: BlocListener<DataBloc, DataState>(
        listener: (context, state) {
          if (state is DataLaoded) {
            Future.delayed(
              const Duration(seconds: 2),
              () {
                if (context.mounted) {
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                      (route) => false,
                    );
                  }
                }
              },
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgWidget(
              'assets/alien1.svg',
              height: 300,
            ),
            SizedBox(height: 40),
            LoadingWidget(),
            SizedBox(height: 140),
          ],
        ),
      ),
    );
  }
}
