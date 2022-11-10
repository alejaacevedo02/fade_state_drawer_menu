import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/loyalty_card/model/loyalty_card.dart';
import '../../domain/loyalty/loyalty_bloc.dart';

class LoyaltyListPage extends StatefulWidget {
  const LoyaltyListPage({Key key = const Key("any_key")}) : super(key: key);

  @override
  _LoyaltyListPageState createState() => _LoyaltyListPageState();
}

class _LoyaltyListPageState extends State<LoyaltyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Loyalty"),
        ),
        body: BlocBuilder<LoyaltyBloc, LoyaltyState>(builder: (_, state) {
          switch (state.runtimeType) {
            case LoyaltyEmpty:
              return _EmptyWidget();
              break;
            case LoyaltyLoading:
              return const CircularProgressIndicator();
              break;
            case LoyaltyError:
              return _ErrorWidget();
              break;
            case LoyaltyLoaded:
              return _LoadedWidget(
                  loyaltyCards: state.props.first as List<LoyaltyCard>);
              break;
            default:
              return _ErrorWidget();
          }
        }));
  }
}

class _EmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text("No items yet. Add some new cards.");
  }
}

class _ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text("An error has ocurred");
  }
}

class _LoadedWidget extends StatelessWidget {
  final List<LoyaltyCard> loyaltyCards;

  const _LoadedWidget(
      {Key key = const Key("any_key"), required this.loyaltyCards})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Loaded. cards: ${loyaltyCards.length}");
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:loyalty/domain/loyalty/loyalty_bloc.dart';
// import 'package:loyalty/domain/loyalty/loyalty_event.dart';
// import 'package:loyalty/domain/loyalty/loyalty_state.dart';
// import 'package:loyalty/domain/navigator/navigator_event.dart';
// import 'package:loyalty/domain/navigator/navigator_bloc.dart';
// import 'package:loyalty/presentation/loyalty/loyalty_card_list_widget.dart';
//
// import '../../domain/loyalty/loyalty_bloc.dart';
//
// class LoyaltyListPage extends StatefulWidget {
//   LoyaltyListPage({Key key}) : super(key: key);
//
//   @override
//   _LoyaltyListPageState createState() => _LoyaltyListPageState();
// }
//
// class _LoyaltyListPageState extends State<LoyaltyListPage> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<LoyaltyBloc>(context).add(Fetch());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF6F6F6),
//       appBar: AppBar(
//         title: Text("Loyalty"),
//       ),
//       body: BlocBuilder<LoyaltyBloc, LoyaltyState>(
//         builder: (_, state) {
//           switch (state.runtimeType) {
//             case LoyaltyEmpty:
//               // return _EmptyWidget();
//               break;
//             case LoyaltyLoading:
//               return Center(child: CircularProgressIndicator());
//               break;
//             case LoyaltyError:
//               return _ErrorWidget();
//               break;
//             case LoyaltyLoaded:
//               return LoyaltyCardListWidget(loyaltyCards: state.props.first);
//               break;
//             default:
//               return _ErrorWidget();
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           BlocProvider.of<NavigatorBloc>(context).add(NavigatorEventAdd(() {
//             BlocProvider.of<LoyaltyBloc>(context).add(Fetch());
//           }));
//         },
//         child: Icon(Icons.add),
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//     );
//   }
// }
//
// class _EmptyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text("No items yet. Add some new cards.");
//   }
// }
//
// class _ErrorWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text("An error has ocurred");
//   }
// }
