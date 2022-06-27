import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:random_string/random_string.dart';
import 'package:redux/redux.dart';
import 'package:redux_app/homepage.dart';

import 'actions.dart' as act;

void main() {
  //final store = Store<int>(act.counterReducer, initialState: 0);
  final store = Store(initialState: 'lets do this', generateRandomValues);
  //store.onChange.listen();
  runApp(homePage(
    // title: 'Flutter Redux Demo',
    store: store,
  ));
}

enum RandomTypes { Numbers, Alpanumeric }

generateRandomValues(dynamic value, dynamic action) {
  if (action == RandomTypes.Numbers) {
    return value = randomNumeric(15);
  }

  if (action == RandomTypes.Alpanumeric) {
    return value = randomNumeric(15);
  }
  return value;
}

// class FlutterReduxApp extends StatelessWidget {
//   final Store<int> store;
//   final String title;

//   FlutterReduxApp({
//     Key? key,
//     required this.store,
//     required this.title,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StoreProvider<int>(
//       store: store,
//       child: MaterialApp(
//         theme: ThemeData.dark(),
//         title: title,
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text(title),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 StoreConnector<int, String>(
//                   converter: (store) => store.state.toString(),
//                   builder: (context, count) {
//                     return Text(
//                       'The button has been pushed this many times: $count',
//                       style: Theme.of(context).textTheme.headline4,
//                     );
//                   },
//                 )
//               ],
//             ),
//           ),
//           floatingActionButton: StoreConnector<int, VoidCallback>(
//             converter: (store) {
//               return () => store.dispatch(act.Actions.Increment);
//             },
//             builder: (context, callback) {
//               return FloatingActionButton(
//                 onPressed: callback,
//                 tooltip: 'Increment',
//                 child: Icon(Icons.add),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//}
