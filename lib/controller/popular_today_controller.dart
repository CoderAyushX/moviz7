import 'package:crud/services/remote_service.dart';
import 'package:get/get.dart';

import '../model/topmovies_module.dart';

class PopularTodayController extends GetxController {
  var isLoding = true.obs;
  var popularMoviesList = <TopMovies>[].obs;
  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoding(true);
      var data = await RemoteServices.fetchTopMovies(
          "http://localhost:8000/api/v1/populartodaymovies");

      if (data.isNotEmpty) {
        popularMoviesList.value = data;
      }
    } finally {
      isLoding(false);
    }
  }
}
