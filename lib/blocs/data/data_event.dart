part of 'data_bloc.dart';

@immutable
sealed class DataEvent {}

final class LoadData extends DataEvent {}

final class AddCoins extends DataEvent {
  AddCoins({required this.coins});

  final int coins;
}

final class BuyBG extends DataEvent {
  BuyBG({required this.id, required this.price});

  final int id;
  final int price;
}

final class SelectBG extends DataEvent {
  SelectBG({required this.id});

  final int id;
}
