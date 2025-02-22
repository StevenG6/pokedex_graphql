import 'package:graphql/client.dart';

const _graphQLEndpoint = "https://graphql-pokeapi.graphcdn.app/";

final GraphQLClient graphQLClient = GraphQLClient(
  link: HttpLink(
    _graphQLEndpoint,
    defaultHeaders: {
      'Authorization': 'omit'
    },
  ),
  cache: GraphQLCache(),
);
