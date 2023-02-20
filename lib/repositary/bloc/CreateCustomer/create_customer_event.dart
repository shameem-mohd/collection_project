part of 'create_customer_bloc.dart';

@immutable
abstract class CreateCustomerEvent {}

class FetchCreateCustomer extends CreateCustomerEvent {
  final String name;
  final String mobile;
  final String routeId;
  final String schemeId;
  final String placeId;
  final String guardianName;
  final String houseName;
  final String post1;
  final String pin;
  final String landmark;
  final String paymentMethod;

  FetchCreateCustomer({
    required this.name,
    required this.mobile,
    required this.routeId,
    required this.schemeId,
    required this.placeId,
    required this.guardianName,
    required this.houseName,
    required this.post1,
    required this.pin,
    required this.landmark,
    required this.paymentMethod,
  });
}

//get customer event

class FetchGetCustomer extends CreateCustomerEvent {}
