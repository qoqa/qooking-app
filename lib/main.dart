import 'package:flutter/material.dart';
import 'package:qooking_app/config/app_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qooking_app/utils/graphql_client.dart';

class QookingApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);
    return GraphQLProvider(
      child: MaterialApp(
          title: 'Qooking',
          theme: ThemeData(
            primarySwatch: Colors.pink,
          ),
          home: MyHomePage(title: 'Qooking'),
          debugShowCheckedModeBanner: false),
      client: getGraphQLClient(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the ${config.env} app.'),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
