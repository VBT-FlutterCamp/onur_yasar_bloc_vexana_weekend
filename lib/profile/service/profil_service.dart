import 'package:flutter_bloc_vexana_profile/profile/model/profil_model.dart';
import 'package:vexana/vexana.dart';

abstract class IProfilService {
  final INetworkManager networkManager;

  IProfilService(this.networkManager);

  Future<ProfilModel?> fetchData();
}

class ProfilService extends IProfilService {
  ProfilService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<ProfilModel?> fetchData() async {
    final response = await networkManager.send<ProfilModel, ProfilModel>(
        "https://reqres.in/api/users/2",
        parseModel: ProfilModel(),
        method: RequestType.GET);
    return response.data;
  }
}
