// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvDetail _$TvDetailFromJson(Map<String, dynamic> json) => TvDetail(
      tvBackdrop: json['backdrop_path'] as String?,
      tvTitle: json['name'] as String?,
      tvId: json['id'] as int?,
      tvDescription: json['overview'] as String?,
      seasons: json['number_of_seasons'] as int?,
      episodes: json['number_of_episodes'] as int?,
      firstairDate: json['first_air_date'] as String?,
      lastairDate: json['last_air_date'] as String?,
      status: json['status'] as String?,
      rating: json['vote_average'] as num?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TvDetailToJson(TvDetail instance) => <String, dynamic>{
      'backdrop_path': instance.tvBackdrop,
      'name': instance.tvTitle,
      'id': instance.tvId,
      'overview': instance.tvDescription,
      'number_of_seasons': instance.seasons,
      'number_of_episodes': instance.episodes,
      'first_air_date': instance.firstairDate,
      'last_air_date': instance.lastairDate,
      'status': instance.status,
      'vote_average': instance.rating,
      'genres': instance.genres,
    };