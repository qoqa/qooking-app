import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qooking_app/config/app_config.dart';

ValueNotifier<GraphQLClient> client;

ValueNotifier getGraphQLClient(context) {
  var config = AppConfig.of(context);
  client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(
        uri: config.apiBaseUrl,
      ),
    ),
  );

  return client;
}