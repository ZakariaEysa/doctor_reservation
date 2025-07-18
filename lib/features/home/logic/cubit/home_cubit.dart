import 'package:bloc/bloc.dart';
import 'package:doctor_reservation/core/helpers/extensions.dart';
import 'package:doctor_reservation/core/networking/api_error_handler.dart';
import 'package:doctor_reservation/core/networking/api_result.dart';
import 'package:doctor_reservation/features/home/data/models/specializations_response_model.dart';
import 'package:doctor_reservation/features/home/data/repos/home_repo.dart';
import 'package:doctor_reservation/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeState.initial());
  final HomeRepo _homeRepo;
  List<SpecializationsData?>? specializationsList = [];
  Future<void> getAllSpecialization() async {
    emit(HomeState.specializationsLoading());
    final response = await _homeRepo.getAllSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        specializationsList =
            specializationsResponseModel.specializationDataList ?? [];

        // getting the doctors list for the first specialization by default.
        getDoctorsList(specializationId: specializationsList?.first?.id);

        emit(
          HomeState.specializationsSuccess(
            specializationsResponseModel.specializationDataList,
          ),
        );
      },
      failure: (error) {
        emit(HomeState.specializationsError(ApiErrorHandler.handle(error)));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList = getDoctorsListBySpecializationId(
      specializationId,
    );

    if (!(doctorsList.isNullOrEmpty())) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsError(ApiErrorHandler.handle('No doctors found')));
    }
  }

  /// returns the list of doctors based on the specialization id
  List<Doctors?>? getDoctorsListBySpecializationId(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
