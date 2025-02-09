import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/data/data_bloc.dart';
import '../core/utils.dart';

class Scaffold2 extends StatelessWidget {
  const Scaffold2({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<DataBloc, DataState>(
            builder: (context, state) {
              return Image.asset(
                'assets/bg$currentBG.png',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
              );
            },
          ),
          Container(color: Color(0xff39244B).withValues(alpha: 0.8)),
          body,
        ],
      ),
    );
  }
}
