

// class TypeGrid extends StatelessWidget {
//   const TypeGrid({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     List<TypeModel> typeList = Provider.of<TypeProvider>(context).typeList;
//
//     List<List<dynamic>> list =[];
//     for (var i = 0; i < typeList.length-1; i++) {
//       // print(typeList[i].name);
//       list.add([typeList[i].name]);
//       for (var j = 0; j < typeList.length-1; j++){
//         if (typeList[i].name == typeList[j].name){
//           // print(j);
//           list[i].add(j*i);
//         }
//         list[i].add(j);
//         // list[i].add([j]);
//       }
//     }
//     print(list[0]);
//     return SizedBox(
//       height: 1000,
//       child:  GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: list.length,
//         ),
//         itemBuilder: (context, index) {
//           return Text("$index");
//         },
//         itemCount: list.length * list.length,
//       ),
//     );
//   }
// }
//
// Widget _buildGridItems(BuildContext context, int index) {
//   int gridStateLength = 18;
//   int x, y = 0;
//   x = (index / gridStateLength).floor();
//   y = (index % gridStateLength);
//   return GestureDetector(
//     onTap: () => print("$x $y"),
//     child: GridTile(
//       child: Container(
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.black, width: 0.5)
//         ),
//         child: Center(
//           child: Text("$x $y"),
//         ),
//       ),
//     ),
//   );
// }
