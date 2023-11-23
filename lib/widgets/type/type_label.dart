import 'package:flutter/material.dart';

class TypeLabel extends StatelessWidget {
  const TypeLabel({super.key, required this.typeName});

  final String? typeName;

  @override
  Widget build(BuildContext context) {
    var bgColor= Colors.black12;
    var borderColor = Colors.black38;
    var textColor = Colors.black87;

    switch(typeName) {
      case "bug":
        bgColor = const Color(0xffA8B820);
        borderColor = const Color(0xff6D7815);
        break;
      case "dark":
        bgColor = const Color(0xff705848);
        borderColor = const Color(0xff49392F);
        textColor = Colors.white;
        break;
      case "dragon":
        bgColor = const Color(0xff7038F8);
        borderColor = const Color(0xff4924A1);
        textColor = Colors.white;
        break;
      case "electric":
        bgColor = const Color(0xffF8D030);
        borderColor = const Color(0xffA1871F);
        break;
      case "fairy":
        bgColor = const Color(0xffEE99AC);
        borderColor = const Color(0xff9B6470);
        break;
      case "fighting":
        bgColor = const Color(0xffC03028);
        borderColor = const Color(0xff7D1F1A);
        textColor = Colors.white;
        break;
      case "fire":
        bgColor = const Color(0xffF08030);
        borderColor = const Color(0xff9C531F);
        textColor = Colors.white;
        break;
      case "flying":
        bgColor = const Color(0xffA890F0);
        borderColor = const Color(0xff6D5E9C);
        break;
      case "ghost":
        bgColor = const Color(0xff705898);
        borderColor = const Color(0xff493963);
        textColor = Colors.white;
        break;
      case "grass":
        bgColor = const Color(0xff78C850);
        borderColor = const Color(0xff4E8234);
        break;
      case "ground":
        bgColor = const Color(0xffE0C068);
        borderColor = const Color(0xff927D44);
        break;
      case "ice":
        bgColor = const Color(0xff98D8D8);
        borderColor = const Color(0xff638D8D);
        break;
      case "normal":
        bgColor = const Color(0xffA8A878);
        borderColor = const Color(0xff6D6D4E);
        break;
      case "poison":
        bgColor = const Color(0xffA040A0);
        borderColor = const Color(0xff682A68);
        textColor = Colors.white;
        break;
      case "psychic":
        bgColor = const Color(0xffF85888);
        borderColor = const Color(0xffA13959);
        textColor = Colors.white;
        break;
      case "rock":
        bgColor = const Color(0xffB8A038);
        borderColor = const Color(0xff786824);
        break;
      case "steel":
        bgColor = const Color(0xffB8B8D0);
        borderColor = const Color(0xff787887);
        break;
      case "water":
        bgColor = const Color(0xff6890F0);
        borderColor = const Color(0xff445E9C);
        break;
    }
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(width: 1, color: borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            typeName!.toUpperCase(),
            style: TextStyle(color: textColor, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
