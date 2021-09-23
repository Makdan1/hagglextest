import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglextest/core/model/error_model.dart';
import 'package:hagglextest/core/model/success_model.dart';
import 'package:hagglextest/core/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class graphQlService {


  static HttpLink httpLink = HttpLink('https://api-staging.hagglex.com/graphql',);
  static final AuthLink authLink = AuthLink(
     getToken: () => 'Bearer $tokenUniversal',
  );

  static String print(String input){
    var text = input;
    return text;
  }
  final Link  link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
  // cache: InMemoryCache(),
  GraphQLClient(
  cache: GraphQLCache(),
  link: httpLink,
  ));

  static ValueNotifier<GraphQLClient> initailizeClient() {
  ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
  cache: GraphQLCache(),
  link: httpLink,
  ),
  );

  return client;
  }

  GraphQLClient clientToQuery() {
  return GraphQLClient(
  link: link,
  cache: GraphQLCache());
  }

  // ignore: missing_return
  gpMutate({
  @required String mutationDocument,
  Map<String, dynamic> data,
  }) async {
  try {
  QueryResult queryResult;
  queryResult = await clientToQuery().mutate(MutationOptions(
  document: gql(mutationDocument),
  variables: data,
  ));

  if (queryResult.hasException) {
  // print(queryResult.exception);
  return ErrorModel(queryResult.exception.toString());
  } else {
  // print(queryResult.data);
  return SuccessModel(queryResult.data);
  }
  } catch (e) {
  log('Error $e');
  return ErrorModel(e);
  }
  }

  // ignore: missing_return
  gpQuery({
  @required String queryDocument,
  Map<String, dynamic> data,
  }) async {
  try {
  QueryResult queryResult = await clientToQuery().query(QueryOptions(
  document: gql(queryDocument),
  variables: data,
  ));
  if (queryResult.hasException) {
  return ErrorModel(queryResult.exception.toString());
  } else {
  return SuccessModel(queryResult.data);
  }
  } catch (e) {
  log('Error $e');
  return ErrorModel(e);
  }
  }


  getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.get('token');
    print('token $accessToken');
    return  'Bearer $accessToken' ;
    }

}
