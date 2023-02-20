part of 'create_customer_bloc.dart';

@immutable
abstract class CreateCustomerState {}

class CreateCustomerInitial extends CreateCustomerState {}

class CreateCustomerLoading extends CreateCustomerState {}

class CreateCustomerLoaded extends CreateCustomerState {}

class CreateCustomerError extends CreateCustomerState {}
