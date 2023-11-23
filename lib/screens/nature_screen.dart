import 'package:flutter/material.dart';
import 'package:poke_battle_stats/providers/nature_provider.dart';
import 'package:provider/provider.dart';

class NatureScreen extends StatefulWidget {
  const NatureScreen({super.key, required this.title});

  final String title;

  @override
  State<NatureScreen> createState() => _NatureScreenState();
}

class _NatureScreenState extends State<NatureScreen> {
  @override
  Widget build(BuildContext context) {
    var natureList = context.watch<NatureProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black12,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Natures",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      "Increases",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "Decreases",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: natureList.naturesListState.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            "${natureList.naturesListState[index].name}",
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            "${natureList.naturesListState[index].increasedStat?.name}",
                            style: TextStyle(color: Colors.green.shade700),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "${natureList.naturesListState[index].decreasedStat?.name}",
                            style: TextStyle(color: Colors.red.shade700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
