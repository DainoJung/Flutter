// import 'package:flutter/material.dart';

// class AnimatedMarker extends StatelessWidget {
//   final bool isMoving;
//   const AnimatedMarker({Key? key, this.isMoving = false}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedOpacity(
//               duration: Duration.zero,
//               opacity: isMoving ? 0.5 : 1,
//               child: MyMarker(),
//             ),
//             / 그림자 및 높이 조절 위젯
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 150),
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.elliptical(100, 50)),
//                 // gradient: RadialGradient(
//                 //   colors: gradientColors,
//                 //   radius: 1.2,
//                 // ),
//               ),
//               height: isMoving ? 6 : 3,
//               width: isMoving ? 16 : 8,
//               margin: EdgeInsets.only(
//                 top: isMoving ? 16 : 0,
//                 bottom: isMoving ? 16 + 48 : 48,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
