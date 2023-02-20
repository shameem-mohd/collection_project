part of 'id_bloc.dart';

@immutable
abstract class IdEvent {}

class FetchRouteId extends IdEvent {}

class FetchSchemeId extends IdEvent {}
