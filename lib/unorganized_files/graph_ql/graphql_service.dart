import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MYGraphQLService {
  static final HttpLink httpLink = HttpLink(
    'https://countries.trevorblades.com/graphql',
  );

  static final ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(link: httpLink, cache: GraphQLCache()),
  );
}
