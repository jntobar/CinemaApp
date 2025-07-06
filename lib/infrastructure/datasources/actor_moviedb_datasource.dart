
import 'dart:convert';

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource{
  final dio= Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
    ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async{
    final response = await dio.get('/movie/$movieId/credits');

    // Si la respuesta es un string vacío, retorna lista vacía
  if (response.data is String && (response.data as String).isEmpty) {
    return [];
  }

  final data = (response.data is String)
      ? json.decode(response.data)
      : response.data;

  final castResponse = CreditsResponse.fromJson(data);

    List<Actor> actors=castResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast))
      .toList();

    
    return actors;

  }
  

}