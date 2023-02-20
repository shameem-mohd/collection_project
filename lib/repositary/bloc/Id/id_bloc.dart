import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/model/GetRouteModel.dart';
import 'package:project/model/GetSchemeIdModel.dart';
import 'package:project/repositary/api/IdApi/IdApi.dart';

part 'id_event.dart';
part 'id_state.dart';

class IdBloc extends Bloc<IdEvent, IdState> {
  late GetRouteModel getRouteModel;
  late GetSchemeIdModel getSchemeIdModel;
  IdApi idApi = IdApi();
  IdBloc() : super(IdInitial()) {
    //route id bloc
    on<FetchRouteId>((event, emit) async {
      emit(IdLoading());
      try {
        getRouteModel = await idApi.getRoute();
        emit(IdLoaded());
      } catch (e) {
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
        emit(IdError());
      }
    });

    //scheme id bloc
    on<FetchSchemeId>((event, emit) async {
      emit(IdLoading());
      try {
        getSchemeIdModel = await idApi.getSchemeId();
        emit(IdLoaded());
      } catch (e) {
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
        emit(IdError());
      }
    });
  }
}
