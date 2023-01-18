import 'package:flutter/material.dart';

class PartyModel {
  late String name;
  late String desc;

  PartyModel(this.name, this.desc);

  Widget partyList() {
    return ListView(
      children: const [
        Text("data"),
      ],
    );
  }
}