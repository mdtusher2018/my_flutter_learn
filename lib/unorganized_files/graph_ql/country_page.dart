import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({super.key});

  final String getCountryQuery = r'''
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
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Country Details')),
      body: Query(
        options: QueryOptions(document: gql(getCountryQuery)),
        builder: (QueryResult result, {fetchMore, refetch}) {
          // 🔴 Error state
          if (result.hasException) {
            return Center(
              child: Text(
                result.exception.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          // ⏳ Loading state
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final country = result.data?['country'];

          if (country == null) {
            return const Center(child: Text('No data found'));
          }

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
