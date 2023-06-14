import 'package:rive/rive.dart';

class RiveAssets {
  final String src;
  final String artBoard, stateMachineName, title;
  late SMIBool? input;

  RiveAssets(this.src,
      {required this.artBoard,
      required this.stateMachineName,
      required this.title,
      this.input});
  set setInput(SMIBool input) {
    this.input = input;
  }
}

class RiveModel {
  final String src, artboard, stateMachineName;
  late SMIBool? status;

  RiveModel({
    required this.src,
    required this.artboard,
    required this.stateMachineName,
    this.status,
  });

  set setStatus(SMIBool state) {
    status = state;
  }
}

List<RiveAssets> bottomNavs = [
  RiveAssets("assets/animations/icons.riv",
      artBoard: "HOME", stateMachineName: "HOME_interactivity", title: "Home"),
  RiveAssets("assets/animations/icons.riv",
      artBoard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAssets("assets/animations/icons.riv",
      artBoard: "LIKE/STAR",
      stateMachineName: "STAR_Interactivity",
      title: "Favourite"),
  RiveAssets("assets/animations/icons.riv",
      artBoard: "USER", stateMachineName: "USER_Interactivity", title: "Cart"),
  RiveAssets("assets/animations/icons.riv",
      artBoard: "SETTINGS",
      stateMachineName: "SETTINGS_Interactivity",
      title: "Profile"),
];
