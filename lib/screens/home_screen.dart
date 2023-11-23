import 'package:flutter/material.dart';

import 'credit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late final Future<dynamic> _allTypes;
  // final Map<String, dynamic> _allTypesList = {};
  //
  // Future<dynamic> _getAllTypes() async {
  //   var response = await http.get(Uri.parse('https://pokeapi.co/api/v2/type'));
  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body)['results'];
  //   } else {
  //     return response.statusCode;
  //   }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _allTypes = _getAllTypes();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const CreditScreen(),
                ),
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Image.asset('images/typechart.png'),
      //TypeGrid(),
      // FutureBuilder<dynamic>(
      //   future: _allTypes,
      //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //     List<Widget> children;
      //     if (snapshot.hasData) {
      //       children = <Widget>[
      //         const Icon(
      //           Icons.check_circle_outline,
      //           color: Colors.green,
      //           size: 60,
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(top: 16),
      //           child: Text('Result: ${snapshot.data}'),
      //         ),
      //       ];
      //     } else if (snapshot.hasError) {
      //       children = <Widget>[
      //         const Icon(
      //           Icons.error_outline,
      //           color: Colors.red,
      //           size: 60,
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(top: 16),
      //           child: Text('Error: ${snapshot.error}'),
      //         ),
      //       ];
      //     } else {
      //       children = const <Widget>[
      //         SizedBox(
      //           width: 60,
      //           height: 60,
      //           child: CircularProgressIndicator(),
      //         ),
      //         Padding(
      //           padding: EdgeInsets.only(top: 16),
      //           child: Text('Awaiting result...'),
      //         ),
      //       ];
      //     }
      //     return Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: children,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
