import 'package:crud/model/songs_module.dart';
import 'package:crud/services/remote_service.dart';
import 'package:get/get.dart';

class SearchSongsController extends GetxController {
  var isLoding = true.obs;
  var searchSongsList = <Songs>[].obs;


  void fetchProduct(String name) async {
    try {
      isLoding(true);
      var data = await RemoteServices.fetchSongs(
          "http://localhost:8000/api/v1/search/$name");

      if (data.isNotEmpty) {
        searchSongsList.value = data;
      }
    } finally {
      isLoding(false);
    }
  }
}
