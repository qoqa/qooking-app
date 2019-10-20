import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> client;

ValueNotifier getGraphQLClient(String apiUrl) {
  client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(uri: apiUrl),
    ),
  );

  return client;
}