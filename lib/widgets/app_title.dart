import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_project/constants/ui_helper.dart';
import '../constants/constants_pokedex.dart';


class AppTitle extends StatelessWidget {
  AppTitle({super.key});

  String pokeballImageUrl = 'assets/images/pokeball.png';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(alignment: Alignment.centerLeft, child: Text(Constants_Pokedex.title, style: Constants_Pokedex.getTitleTextStyle(),)),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                pokeballImageUrl,
                width:ScreenUtil().orientation == Orientation.portrait ? 0.2.sh : 0.2.sw,

                fit: BoxFit.fitWidth,
              )),
        ],
      ),
    );
  }
}
