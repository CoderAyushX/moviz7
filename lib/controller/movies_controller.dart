import 'package:crud/model/movies_module.dart';
import 'package:crud/services/remote_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController {
  var isLoding = true.obs;
  var moviesList = <Movies>[].obs;
  var bollymoviesList = <Movies>[].obs;
  var hollymoviesList = <Movies>[].obs;
  var southmoviesList = <Movies>[].obs;
  var animemoviesList = <Movies>[].obs;
  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoding(true);
      var data = await RemoteServices.fetchMovies(
          "http://localhost:8000/api/v1/movies");

      if (data.isNotEmpty) {
        moviesList.value = data;
        bollymoviesList.assignAll(
            data.where((o) => o.cat.toLowerCase() == 'bollywood').toList());
        hollymoviesList.assignAll(
            data.where((o) => o.cat.toLowerCase() == 'hollywood').toList());
        southmoviesList.assignAll(
            data.where((o) => o.cat.toLowerCase() == 'south').toList());
        animemoviesList.assignAll(
            data.where((o) => o.cat.toLowerCase() == 'anime').toList());
      
      }
    } finally {
      isLoding(false);
    }
  }
}
