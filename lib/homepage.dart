import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_app/main.dart';

class homePage extends StatelessWidget {
  final Store<dynamic> store;
  homePage({required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Redux'),
          ),
          body: Column(
            children: [
              StoreConnector<dynamic, String>(builder: ((context, text) {
                return Text(text);
              }), converter: (store) {
                
                return store.state.toString();
              }),
              StoreConnector<dynamic, VoidCallback>(
                  builder: ((context, callback) {
                return MaterialButton(
                    onPressed: callback, child: Text('alpabets'));
              }), converter: (store) {
                return store.dispatch(RandomTypes.Alpanumeric);
              }),
              StoreConnector<dynamic, VoidCallback>(
                  builder: ((context, callback) {
                    return MaterialButton(
                        onPressed: callback, child: Text('numbers'));
                  }),
                  converter: (store) => store.dispatch(RandomTypes.Numbers))
            ],
          ),
        ),
      ),
    );
  }
}
