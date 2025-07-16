import 'package:bloc/bloc.dart';
import 'package:doctor_reservation/core/networking/api_error_handler.dart';
import 'package:doctor_reservation/core/networking/api_result.dart';
import 'package:doctor_reservation/features/home/data/repos/home_repo.dart';
import 'package:doctor_reservation/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeState.initial());
  final HomeRepo _homeRepo;

  Future<void> getAllSpecialization() async {
    emit(HomeState.specializationsLoading());
    final response = await _homeRepo.getAllSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        final specializationDataList =
            specializationsResponseModel.specializationDataList;
        emit(HomeState.specializationsSuccess(specializationDataList));
      },
      failure: (error) {
        emit(HomeState.specializationsError(ApiErrorHandler.handle(error)));
      },
    );
  }
}
