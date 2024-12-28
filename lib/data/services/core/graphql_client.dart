import 'package:graphql/client.dart';

const _graphQLEndpoint = "https://graphql-pokeapi.graphcdn.app/";

GraphQLClient get graphQLClient => GraphQLClient(
  link: HttpLink(
    _graphQLEndpoint,
    defaultHeaders: {
      'Authorization': 'omit'
    },
  ),
  cache: GraphQLCache(),
);
