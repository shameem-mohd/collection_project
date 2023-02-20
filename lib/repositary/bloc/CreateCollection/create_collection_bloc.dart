import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/model/CreateCustomerModel.dart';
import 'package:project/repositary/api/CreateCollection/CreateCollectionApi.dart';

part 'create_collection_event.dart';
part 'create_collection_state.dart';

class CreateCollectionBloc
    extends Bloc<CreateCollectionEvent, CreateCollectionState> {
  late CreateCustomerModel createCustomerModel;
  CreateCollectionApi createCollectionApi = CreateCollectionApi();
  CreateCollectionBloc() : super(CreateCollectionInitial()) {
    on<FetchCreateCollection>((event, emit) async {
      emit(CreateCollectionLoading());
      try {
        createCustomerModel = await createCollectionApi.getCreateCollection(
            customerId: event.customerId,
            amount: event.amount,
            routeId: event.placeId,
            placeId: event.placeId,
            schemeId: event.schemeId,
            paymentMethod: event.paymentMethod);
        emit(CreateCollectionLoaded());
      } catch (e) {
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
        emit(CreateCollectionError());
      }

      // TODO: implement event handler
    });
  }
}
