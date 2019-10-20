import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      client: getGraphQLClient(config.apiBaseUrl),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Query(
        options: QueryOptions(
            document: "query {allRecipes{id,title,thumbnailUrl}}"
        ),
        builder: (QueryResult result,
            { VoidCallback refetch, FetchMore fetchMore}) {
          if (result.errors != null) {
            return Text(result.errors.toString());
          }

          if (result.loading) {
            return Text('Loading');
          }

          // it can be either Map or List
          List recipes = result.data['allRecipes'];

          return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Stack(
                    alignment: const Alignment(0, 0),
                    children: <Widget>[
                      Positioned.fill(
                        child: Image.network(
                            recipe['thumbnailUrl'],
                            fit: BoxFit.cover
                        )
                      ),
                      Text(
                        recipe['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      )
                    ],
                  )
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
