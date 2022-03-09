import 'package:flutter/material.dart';
import 'package:flutter_bloc_vexana_profile/core/network/network_service.dart';
import 'package:flutter_bloc_vexana_profile/product/constant/app_string.dart';
import 'package:flutter_bloc_vexana_profile/product/widget/container_widget.dart';
import 'package:flutter_bloc_vexana_profile/product/widget/follow_widget.dart';
import 'package:flutter_bloc_vexana_profile/product/widget/image_avatar_widget.dart';
import 'package:flutter_bloc_vexana_profile/profile/service/profil_service.dart';
import 'package:flutter_bloc_vexana_profile/profile/viewmodel/profil_viewmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kartal/kartal.dart';

import '../model/post_model.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilCubit(
        ProfilService(NetworkService.instance.networkManager),
      ),
      child: BlocConsumer<ProfilCubit, ProfilState>(listener: (context, state) {
        if (state is ProfilErrorState) {
          showModalBottomSheet(
              context: context,
              builder: (context) => const Text('Error Message'));
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: buildBody(state, context),
        );
      }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(AppString().appBar),
    );
  }

  buildBody(ProfilState state, BuildContext context) {
    if (state is ProfilLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is ProfilComplete) {
      return Column(
        children: [
          _buildProfil(state),
          SizedBox(
            height: context.dynamicHeight(0.03),
          ),
          _buildPostBody(),
        ],
      );
    } else {
      return const Text("Hata");
    }
  }

  Expanded _buildPostBody() {
    return Expanded(
      flex: 3,
      child: SizedBox(
        child: ListView.builder(
            itemCount: Post.imageUrl.length,
            itemBuilder: (context, index) {
              final item = Post.imageUrl[index];
              return PostWidget(index: item);
            }),
      ),
    );
  }

  Expanded _buildProfil(ProfilComplete state) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              ImageAvatar(
                profilModel: state.item,
              ),
            ],
          ),
          RowInformation(deger: Post.imageUrl.length, text: AppString().post),
          RowInformation(deger: 956, text: AppString().follower),
          RowInformation(deger: 565, text: AppString().follow),
        ],
      ),
    );
  }
}
