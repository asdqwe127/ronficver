// import 'package:flutter/material.dart';
// import 'package:ronfic_ver2/model/Plant.dart';
// import 'package:ronfic_ver2/screen/PlantSummary.dart';
//
//
// class HomePageBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         color: Color(0xFF736AB7),
//         child: CustomScrollView(
//           scrollDirection: Axis.vertical,
//           slivers: <Widget>[
//             SliverPadding(
//               padding: EdgeInsets.symmetric(vertical: 24.0),
//               sliver: SliverFixedExtentList(
//                 itemExtent: 152.0,
//                 delegate: SliverChildBuilderDelegate(
//                       (context, index) => PlanetSummary(planets[index]),
//                   childCount: planets.length,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );Expanded(
//       child: Container(
//         color: Color(0xFF736AB7),
//         child: CustomScrollView(
//           scrollDirection: Axis.vertical,
//           slivers: <Widget>[
//             SliverPadding(
//               padding: EdgeInsets.symmetric(vertical: 24.0),
//               sliver: SliverFixedExtentList(
//                 itemExtent: 152.0,
//                 delegate: SliverChildBuilderDelegate(
//                       (context, index) => PlanetSummary(planets[index]),
//                   childCount: planets.length,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }