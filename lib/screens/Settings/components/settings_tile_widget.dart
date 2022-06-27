import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

class SettingsTileWidget extends StatelessWidget {
  final List<Widget> children;
  const SettingsTileWidget({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      color: tileColor,
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children));
}
