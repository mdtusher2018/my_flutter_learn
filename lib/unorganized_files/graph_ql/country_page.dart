import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:template/src/core/utils/logger.dart';
import 'package:template/unorganized_files/graph_ql/graphql_service.dart';

class CountryRepository {
  Future<Map<String, dynamic>> getCountry() async {
    final GraphQLClient grapgQLService = GraphQLService.client(
      GraphQLEndpoint.countries,
    );
    final QueryOptions options = QueryOptions(
      document: gql(r'''
        query {
          country(code: "BR") {
            name
            native
            capital
            currency
            languages {
              name
            }
          }
        }
      '''),
    );

    final QueryResult result = await grapgQLService.query(options);

    AppLogger.log(result.data.toString());
    if (result.hasException) {
      throw result.exception!;
    }

    return result.data!['country'];
  }
}

class CountryPage extends StatelessWidget {
  const CountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Country Details')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: CountryRepository().getCountry(),
        builder: (context, snapshot) {
          // ⏳ Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ❌ Error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final country = snapshot.data!;
          final List languages = country['languages'];

          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        country['name'],
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Text('Native Name: ${country['native']}'),
                      Text('Capital: ${country['capital']}'),
                      Text('Currency: ${country['currency']}'),
                      const SizedBox(height: 12),
                      const Text(
                        'Languages:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      ...languages.map((lang) => Text('- ${lang['name']}')),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
