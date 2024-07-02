import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/response/api_response.dart';
import '../../models/movie_list/movie_list_model.dart';
import '../../repository/movies_api/movies_api_repository.dart';


part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesApiRepository moviesApiRepository;
  MoviesBloc({required this.moviesApiRepository}) : super(MoviesState(moviesList: ApiResponse.loading())) {
    on<MoviesFetch>(fetchMoviesListApi);
  }

  Future<void> fetchMoviesListApi(MoviesFetch event, Emitter<MoviesState> emit) async {
    await moviesApiRepository.fetchMoviesList().then((response) {
      emit(state.copyWith(
        moviesList: ApiResponse.completed(response),
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        moviesList: ApiResponse.error(error.toString()),
      ));
    });
  }
}
