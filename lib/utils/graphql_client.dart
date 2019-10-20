import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink(
  uri: '...',
);

ValueNotifier<GraphQLClient> client;

ValueNotifier getGraphQLClient() {
  client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: httpLink,
    ),
  );

  return client;
}