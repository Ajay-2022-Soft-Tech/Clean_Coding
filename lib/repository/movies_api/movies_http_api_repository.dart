import 'package:clean_coding/config/data/network/network_services_api.dart';

import '../../config/app_url.dart';
import '../../models/movie_list/movie_list_model.dart';
import 'movies_api_repository.dart';

/// Implementation of [MoviesApiRepository] for making HTTP requests to fetch movies list.
class MoviesHttpApiRepository implements MoviesApiRepository {
  final _apiServices = NetworkServicesApi();

  /// Fetches the list of movies from the API.
  ///
  /// Returns a [MovieListModel] representing the list of movies.
  @override
  Future<MovieListModel> fetchMoviesList() async {
    final response = await _apiServices.getApi(AppUrl.popularMoviesListEndPoint);
    return MovieListModel.fromJson(response);
  }
}
