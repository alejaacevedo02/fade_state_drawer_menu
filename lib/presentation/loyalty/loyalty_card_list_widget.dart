// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../data/loyalty_card/model/loyalty_card.dart';
// import '../util/colors_util.dart';
//
// class LoyaltyCardListWidget extends StatelessWidget {
//   final List<LoyaltyCard> loyaltyCards;
//
//   const LoyaltyCardListWidget({  Key key = const Key("any_key"), required this.loyaltyCards})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//         crossAxisCount: 2,
//         childAspectRatio: 2.0,
//         children: List.generate(
//             loyaltyCards.length,
//             (index) => _LoyaltyCardItemWidget(
//                 loyaltyCard: loyaltyCards[index],
//                 itemColor: Color(ColorsUtil.getColorForPosition(index)))));
//   }
// }
//
// class _LoyaltyCardItemWidget extends StatelessWidget {
//   final LoyaltyCard loyaltyCard;
//   final Color itemColor;
//
//   _LoyaltyCardItemWidget(
//       {Key key, required this.loyaltyCard, required this.itemColor})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GridTile(
//       child: Card(
//         elevation: 3,
//         shadowColor: Colors.white10,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         color: Colors.white,
//         child: InkWell(
//           splashColor: Colors.blue.withAlpha(30),
//           onTap: () {
//             BlocProvider.of<NavigatorBloc>(context)
//                 .add(NavigatorEventOpenDetail(loyaltyCard.number, () {
//               BlocProvider.of<LoyaltyBloc>(context).add(Fetch());
//             }));
//           },
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                   flex: 2,
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: itemColor,
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(15),
//                             bottomLeft: Radius.circular(15)),
//                         border: Border.all(
//                             width: 3,
//                             color: itemColor,
//                             style: BorderStyle.solid)),
//                     width: double.infinity,
//                     height: double.infinity,
//                     child: Center(
//                       child: Text(
//                         loyaltyCard.name.substring(0, 1).toUpperCase(),
//                         style:
//                             new TextStyle(color: Colors.white, fontSize: 50.0),
//                       ),
//                     ),
//                   )),
//               Expanded(
//                 flex: 4,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       loyaltyCard.name,
//                       style: new TextStyle(
//                           color: itemColor,
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       loyaltyCard.number,
//                       style: new TextStyle(color: itemColor, fontSize: 12.0),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
