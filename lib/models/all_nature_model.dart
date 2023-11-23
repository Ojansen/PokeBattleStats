import 'package:json_annotation/json_annotation.dart';
import 'package:poke_battle_stats/models/nature_model.dart';

part 'all_nature_model.g.dart';

@JsonSerializable()
class AllNatureModel {
  AllNatureModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int? count;
  final String? next;
  final dynamic previous;
  final List<Result>? results;

  AllNatureModel copyWith({
    int? count,
    String? next,
    dynamic? previous,
    List<Result>? results,
  }) {
    return AllNatureModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  factory AllNatureModel.fromJson(Map<String, dynamic> json) => _$AllNatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllNatureModelToJson(this);

  @override
  String toString(){
    return "$count, $next, $previous, $results, ";
  }
}

@JsonSerializable()
class Result {
  Result({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Result copyWith({
    String? name,
    String? url,
  }) {
    return Result(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  @override
  String toString(){
    return "$name, $url, ";
  }
}
