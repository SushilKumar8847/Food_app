// import 'package:flutter/material.dart';
// import 'package:food_app/trial.dart/data.dart';

// import '../src/helpers/screen_navigation.dart';
// import '../src/helpers/style.dart';
// import '../src/widgets/custom_text.dart';

// class Featured extends StatelessWidget {
//   const Featured({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 220,
//         child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: foodList.length,
//             itemBuilder: (_, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: GestureDetector(
//                   onTap: () {
//                     changeScreen(
//                         _,
//                         Details(
//                             products: foodList[index],
//                             name: nameList[index],
//                             img: imgList[index]));
//                   },
//                   child: Container(
//                     height: 200,
//                     width: 180,
//                     decoration: BoxDecoration(color: white, boxShadow: [
//                       BoxShadow(
//                           color: red.shade50,
//                           offset: const Offset(15, 5),
//                           blurRadius: 4)
//                     ]),
//                     child: Column(
//                       children: <Widget>[
//                         Image.asset(
//                           "images/${foodList[index].image}",
//                           height: 140,
//                           width: 140,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: CustomText(
//                                 text: foodList[index].name,
//                                 size: 16,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(4),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     color: white,
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: grey.shade300,
//                                           offset: const Offset(1, 1),
//                                           blurRadius: 4)
//                                     ]),
//                                 child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: foodList[index].wishList
//                                         ? const Icon(
//                                             Icons.favorite,
//                                             color: red,
//                                             size: 12,
//                                           )
//                                         : const Icon(
//                                             Icons.favorite_border,
//                                             color: red,
//                                             size: 12,
//                                           )),
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 1,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 6.0),
//                                   child: CustomText(
//                                     text: foodList[index].rating.toString(),
//                                     color: grey,
//                                     size: 14,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 2,
//                                 ),
//                                 const Icon(
//                                   Icons.star,
//                                   color: red,
//                                   size: 12,
//                                 ),
//                                 const Icon(
//                                   Icons.star,
//                                   color: red,
//                                   size: 12,
//                                 ),
//                                 const Icon(
//                                   Icons.star,
//                                   color: red,
//                                   size: 12,
//                                 ),
//                                 const Icon(
//                                   Icons.star,
//                                   color: red,
//                                   size: 12,
//                                 ),
//                                 const Icon(
//                                   Icons.star,
//                                   color: grey,
//                                   size: 12,
//                                 ),
//                               ],
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(right: 8.0),
//                               child: CustomText(
//                                 text: "\$${foodList[index].price}",
//                                 weight: FontWeight.bold,
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }));
//   }
// }
