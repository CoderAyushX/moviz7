import 'package:crud/model/songs_module.dart';
import 'package:crud/services/remote_service.dart';
import 'package:get/get.dart';

class SongsController extends GetxController {
  var isLoding = true.obs;
  var songsList = <Songs>[].obs;
  var hindiSongsList = <Songs>[].obs;
  var engSongsList = <Songs>[].obs;
  var kpopSongsList = <Songs>[].obs;
  var othersSongsList = <Songs>[].obs;
  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoding(true);
      var data = await RemoteServices.fetchSongs(
          "https://yephow.herokuapp.com/api/v1/songs");

      if (data.isNotEmpty) {
        songsList.value = data;
        hindiSongsList.assignAll(
            data.where((o) => o.cat.toLowerCase() == 'hindi').toList());
        engSongsList.assignAll(
            data.where((o) => o.cat.toLowerCase() == 'english').toList());
        kpopSongsList.assignAll(
            data.where((o) => o.cat.toLowerCase() == 'kpop').toList());
        othersSongsList.assignAll(
            data.where((o) => o.cat.toLowerCase() == 'others').toList());
      
      }
    } finally {
      isLoding(false);
    }
  }
}
