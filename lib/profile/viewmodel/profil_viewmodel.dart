import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_vexana_profile/profile/model/profil_model.dart';
import 'package:flutter_bloc_vexana_profile/profile/service/profil_service.dart';

class ProfilCubit extends Cubit<ProfilState> {
  ProfilCubit(this.profilService) : super(ProfilInitial()) {
    fetchUser();
  }

  IProfilService profilService;
  ProfilModel? model;

  Future<void> fetchUser() async {
    emit(ProfilLoading());
    final model = await profilService.fetchData();
    emit(ProfilComplete(model));
  }
}

abstract class ProfilState {}

class ProfilInitial extends ProfilState {}

class ProfilLoading extends ProfilState {}

class ProfilComplete extends ProfilState {
  final ProfilModel? item;

  ProfilComplete(this.item);
}

class ProfilErrorState extends ProfilState {}
