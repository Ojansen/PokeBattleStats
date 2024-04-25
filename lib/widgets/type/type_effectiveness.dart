import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poke_battle_stats/models/type_model.dart';
import 'package:poke_battle_stats/widgets/type/type_label.dart';

class TypeEffectiveness extends StatelessWidget {
  const TypeEffectiveness({super.key, required this.type});

  final TypeModel? type;

  @override
  Widget build(BuildContext context) {
    const double gap = 16.0;

    List<TypeLabel> doubleDmgFrom = [];
    type?.damageRelations?.doubleDamageFrom?.forEach((Generation element) {
      doubleDmgFrom.add(
        TypeLabel(typeName: element.name),
      );
    });

    List<TypeLabel> doubleDmgTo = [];
    type?.damageRelations?.doubleDamageTo?.forEach((Generation element) {
      doubleDmgTo.add(
        TypeLabel(typeName: element.name),
      );
    });

    List<TypeLabel> halfDmgTo = [];
    type?.damageRelations?.halfDamageTo?.forEach((Generation element) {
      halfDmgTo.add(
        TypeLabel(typeName: element.name),
      );
    });

    List<TypeLabel> halfDmgFrom = [];
    type?.damageRelations?.halfDamageFrom?.forEach((Generation element) {
      halfDmgFrom.add(
        TypeLabel(typeName: element.name),
      );
    });

    List<TypeLabel> noDmgFrom = [];
    type?.damageRelations?.noDamageFrom?.forEach((Generation element) {
      noDmgFrom.add(
        TypeLabel(typeName: element.name),
      );
    });

    List<TypeLabel> noDmgTo = [];
    type?.damageRelations?.noDamageTo?.forEach((dynamic element) {
      noDmgTo.add(
        TypeLabel(typeName: element?.name),
      );
    });

    return SizedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Selected type',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TypeLabel(typeName: type?.name)
              ],
            ),
            const SizedBox(height: gap),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Double damage from 2x"),
                const SizedBox(height: gap),
                Wrap(
                  runSpacing: gap,
                  direction: Axis.horizontal,
                  children: doubleDmgFrom,
                )
              ],
            ),
            const SizedBox(height: gap),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Double damage to 2x"),
                const SizedBox(height: gap),
                Wrap(
                  runSpacing: gap,
                  direction: Axis.horizontal,
                  children: doubleDmgTo,
                )
              ],
            ),
            const SizedBox(height: gap),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Half damage to 0.5x"),
                const SizedBox(height: gap),
                Wrap(
                  runSpacing: gap,
                  direction: Axis.horizontal,
                  children: halfDmgTo,
                )
              ],
            ),
            const SizedBox(height: gap),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Half damage from 0.5x"),
                const SizedBox(height: gap),
                Wrap(
                  runSpacing: gap,
                  direction: Axis.horizontal,
                  children: halfDmgFrom,
                )
              ],
            ),
            const SizedBox(height: gap),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("No damage from 0x"),
                const SizedBox(height: gap),
                Wrap(
                  runSpacing: gap,
                  direction: Axis.horizontal,
                  children: noDmgFrom,
                )
              ],
            ),
            const SizedBox(height: gap),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("No damage to 0x"),
                const SizedBox(height: gap),
                Wrap(
                  runSpacing: gap,
                  direction: Axis.horizontal,
                  children: noDmgTo,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
