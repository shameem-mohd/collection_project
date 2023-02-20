import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/model/CreateCustomerModel.dart';
import 'package:project/model/GetCustomerModel.dart';
import 'package:project/repositary/api/CreateCustomer/CreateCustomerApi.dart';

part 'create_customer_event.dart';
part 'create_customer_state.dart';

class CreateCustomerBloc
    extends Bloc<CreateCustomerEvent, CreateCustomerState> {
  late CreateCustomerModel createCustomerModel;
  late GetCustomerModel getCustomerModel;
  CreateCustomerApi createCustomerApi;
  CreateCustomerBloc(this.createCustomerApi) : super(CreateCustomerInitial()) {
    on<FetchCreateCustomer>((event, emit) async {
      emit(CreateCustomerLoading());
      try {
        createCustomerModel = await createCustomerApi.getCreateCustomer(
          name: event.name,
          mobile: event.mobile,
          routeId: event.routeId,
          schemeId: event.schemeId,
          placeId: event.placeId,
          guardianName: event.guardianName,
          houseName: event.houseName,
          post1: event.post1,
          pin: event.pin,
          landmark: event.landmark,
          paymentMethod: event.paymentMethod,
        );
        emit(CreateCustomerLoaded());
      } catch (e) {
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
        emit(CreateCustomerError());
      }

      // TODO: implement event handler
    });

    //get customer bloc

    on<FetchGetCustomer>((event, emit) async {
      emit(CreateCustomerLoading());
      try {
        getCustomerModel = await createCustomerApi.getCustomer();
        emit(CreateCustomerLoaded());
      } catch (e) {
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
        emit(CreateCustomerError());
      }
    });
  }
}
