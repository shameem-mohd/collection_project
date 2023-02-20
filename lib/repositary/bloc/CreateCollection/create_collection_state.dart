part of 'create_collection_bloc.dart';

@immutable
abstract class CreateCollectionState {}

class CreateCollectionInitial extends CreateCollectionState {}

class CreateCollectionLoading extends CreateCollectionState {}

class CreateCollectionLoaded extends CreateCollectionState {}

class CreateCollectionError extends CreateCollectionState {}
