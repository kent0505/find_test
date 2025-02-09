part of 'data_bloc.dart';

@immutable
sealed class DataState {}

final class DataInitial extends DataState {}

final class DataLaoded extends DataState {}
