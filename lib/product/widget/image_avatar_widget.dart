import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_bloc_vexana_profile/profile/model/profil_model.dart';

class ImageAvatar extends StatelessWidget {
  final ProfilModel? profilModel;
  const ImageAvatar({
    Key? key,
    this.profilModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.paddingNormal,
          child: Container(
            width: context.dynamicWidth(0.2),
            height: context.dynamicWidth(0.2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                profilModel?.data?.avatar ?? "",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: context.horizontalPaddingMedium,
          child: Text(
            (profilModel?.data?.firstName ?? '') +
                " " +
                (profilModel?.data?.lastName ?? ''),
          ),
        ),
      ],
    );
  }
}
