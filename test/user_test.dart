import 'package:flutter_bloc_vexana_profile/profile/model/profil_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  INetworkManager? networkManager;

  setUp(() {
    const String baseUrl = "https://reqres.in/api/users/2";
    networkManager = NetworkManager(
      isEnableLogger: true,
      options: BaseOptions(baseUrl: baseUrl),
    );
  });
  test("test", () async {
    final response = await networkManager?.send<ProfilModel, ProfilModel>('',
        parseModel: ProfilModel(), method: RequestType.GET);
    expect(response, isNotNull);
  });
}
