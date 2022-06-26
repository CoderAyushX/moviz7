import 'package:crud/model/movies_module.dart';
import 'package:crud/services/remote_service.dart';
import 'package:get/get.dart';

class SearchMoviesController extends GetxController {
  var isLoding = true.obs;
  var searchMovieList = <Movies>[].obs;


  void fetchProduct(String name) async {
    try {
      isLoding(true);
      var data = await RemoteServices.fetchMovies(
          "http://localhost:8000/api/v1/search/$name");

      if (data.isNotEmpty) {
        searchMovieList.value = data;
      }
    } finally {
      isLoding(false);
    }
  }
}
