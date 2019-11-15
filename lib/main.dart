import 'package:flutter/material.dart';
import 'package:qooking_app/config/app_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qooking_app/screens/recipes_list_view.dart';
import 'package:qooking_app/utils/graphql_client.dart';

class QookingApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      child: MaterialApp(
          title: 'Qooking',
          theme: ThemeData(
            primarySwatch: Colors.pink,
          ),
          home: QookingHomePage(title: 'Qooking'),
          debugShowCheckedModeBanner: false),
      client: getGraphQLClient(context),
    );
  }
}

class QookingHomePage extends StatefulWidget {
  QookingHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  QookingHomePageState createState() => QookingHomePageState();
}

class QookingHomePageState extends State<QookingHomePage> {
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RecipeListView()
    );
  }
}
