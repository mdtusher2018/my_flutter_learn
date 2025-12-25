import 'package:graphql_flutter/graphql_flutter.dart';


enum GraphQLEndpoint { countries, graphqlZero }

class GraphQLService {
  static final Map<GraphQLEndpoint, GraphQLClient> _clients = {};

  static Future<void> init() async {
    if (_clients.isNotEmpty) return;

    await initHiveForFlutter();
    final store = await HiveStore.open();

    _clients[GraphQLEndpoint.countries] = GraphQLClient(
      link: HttpLink('https://countries.trevorblades.com/graphql'),
      cache: GraphQLCache(store: store),
    );

    _clients[GraphQLEndpoint.graphqlZero] = GraphQLClient(
      link: HttpLink('https://graphqlzero.almansi.me/api'),
      cache: GraphQLCache(store: store),
    );
  }

  static GraphQLClient client(GraphQLEndpoint endpoint) {
    final client = _clients[endpoint];
    if (client == null) {
      throw Exception('GraphQLService not initialized. Call init() first.');
    }
    return client;
  }
}







/*
https://graphqlzero.almansi.me/api

//=========body=========
{
  "input": {
    "title": "A Very Captivating Post Title",
    "body": "Some interesting content."
  }
}
*/