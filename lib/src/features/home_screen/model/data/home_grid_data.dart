import 'dart:ui';

import 'package:interview_ui/src/constants/icon_strings.dart';
import 'package:interview_ui/src/features/home_screen/model/models/home_grid_model.dart';

List<HomeGridModel> gridData = [
  HomeGridModel(
    containerBackgroundColor: const Color(0xFFFFF6E0),
    subTitleText: "1250",
    titleText: "",
    circleContainerColor: const Color(0xFFFFC20F),
    iconUrl: gridIcon1,
  ),
  HomeGridModel(
    containerBackgroundColor: const Color(0xFFFFEFEF),
    subTitleText: "75",
    titleText: "Cardio",
    circleContainerColor: const Color(0xFFFA6261),
    iconUrl: gridIcon2,
  ),
  HomeGridModel(
    containerBackgroundColor: const Color.fromRGBO(71, 168, 124, 0.15),
    subTitleText: "5/200",
    titleText: "Boire",
    circleContainerColor: const Color(0xFF5FBD95),
    iconUrl: gridIcon3,
  ),
  HomeGridModel(
    containerBackgroundColor: const Color(0xFFEEF7FF),
    subTitleText: "1250",
    titleText: "Menus",
    circleContainerColor: const Color(0xFF009DCA),
    iconUrl: gridIcon4,
  ),
];
