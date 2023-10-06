import 'dart:math';

import 'package:chromeapi/tabs.dart';
import 'package:flutter/material.dart' hide Tab;
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp( const MyApp());

// method for getting current tab url 
Future<Tab> getActiveTab() async {
  QueryInfo queryInfo = QueryInfo(active: true, lastFocusedWindow: true);
  // Chrome library, not like JS namespaces
  // `chrome.tabs.query` just `query` in this case
  List<Tab> tabs = await query(queryInfo);
  return tabs.singleWhere((tab) => tab.url != null && tab.url!.isNotEmpty);
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();

}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Share',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: FutureBuilder<Tab>(
        future: getActiveTab(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child:
                  QrImageView(
                    data: snapshot.data!.url!,
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.primaries[
                    Random().nextInt(Colors.primaries.length)]
                        .withOpacity(0.3),
                  ),
                ),
          ],
            );
            //loader
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
