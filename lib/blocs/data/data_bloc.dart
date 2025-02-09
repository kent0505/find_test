import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<LoadData>((event, emit) async {
      await getDATA();
      emit(DataLaoded());
    });

    on<AddCoins>((event, emit) async {
      coins += event.coins;
      await saveINT('coins', coins);
      emit(DataLaoded());
    });

    on<BuyBG>((event, emit) async {
      if (event.id == 2) {
        bought2 = true;
        await saveBOOL('bought2', bought2);
      } else if (event.id == 3) {
        bought3 = true;
        await saveBOOL('bought3', bought3);
      }
      currentBG = event.id;
      coins -= event.price;
      await saveINT('currentBG', currentBG);
      await saveINT('coins', coins);
      emit(DataLaoded());
    });

    on<SelectBG>((event, emit) async {
      currentBG = event.id;
      await saveINT('currentBG', currentBG);
      emit(DataLaoded());
    });

    // on<AddStats>((event, emit) async {
    //   statsList.insert(0, event.stats);
    //   emit(DataLaoded());
    // });
  }
}
