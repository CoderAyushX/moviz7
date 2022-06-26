import 'package:crud/services/remote_service.dart';
import 'package:get/get.dart';

import '../model/topmovies_module.dart';

class TopMoviesController extends GetxController {
  var isLoding = true.obs;
  var topMoviesList = <TopMovies>[].obs;
  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoding(true);
      var data = await RemoteServices.fetchTopMovies(
          "http://localhost:8000/api/v1/topmovies");

      if (data.isNotEmpty) {
        topMoviesList.value = data;
      }
    } finally {
      isLoding(false);
    }
  }
}
