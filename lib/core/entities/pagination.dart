import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/entities/character.dart';

class Pagination extends Equatable {
  final Info info;
  final List<Character> results;

  const Pagination({
    required this.info,
    required this.results,
  });

  @override
  List<Object?> get props => [
    info,
    results,
  ];
}

class Info extends Equatable {
  final int count;
  final String? next;
  final int pages;
  final String? prev;

  const Info({
    required this.count,
    this.next,
    required this.pages,
    this.prev,
  });

  @override
  List<Object?> get props => [
    count,
    next,
    pages,
    prev,
  ];
}
