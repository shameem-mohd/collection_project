part of 'id_bloc.dart';

@immutable
abstract class IdState {}

class IdInitial extends IdState {}

class IdLoading extends IdState {}

class IdLoaded extends IdState {}

class IdError extends IdState {}
