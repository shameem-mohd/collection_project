part of 'create_collection_bloc.dart';

@immutable
abstract class CreateCollectionEvent {}

class FetchCreateCollection extends CreateCollectionEvent {
  final String customerId;
  final String amount;
  final String routeId;
  final String placeId;
  final String schemeId;
  final String pin;
  final String paymentMethod;

  FetchCreateCollection(
      {required this.customerId,
      required this.amount,
      required this.routeId,
      required this.placeId,
      required this.schemeId,
      required this.pin,
      required this.paymentMethod});
}
