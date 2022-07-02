import 'package:crud/model/topsongs_module.dart';
import 'package:crud/services/remote_service.dart';

import 'package:get/get.dart';

class TopSongsController extends GetxController {
  var isLoding = true.obs;
  var topSongsList = <TopSongs>[].obs;
  var hindiTopSongsList = <TopSongs>[].obs;
  var engTopSongsList = <TopSongs>[].obs;
  var kpopTopSongsList = <TopSongs>[].obs;
  var otherTopSongsList = <TopSongs>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoding(true);
      var data = await RemoteServices.fetchTopSongs(
          "http://localhost:8000/api/v1/topsongs");

      if (data.isNotEmpty) {
        topSongsList.value = data;
        hindiTopSongsList.assignAll(
            data.where((o) => o.cat.toLowerCase() == 'hindi').toList());
        engTopSongsList.assignAll(
            data.where((o) => o.cat.toLowerCase() == 'english').toList());
        kpopTopSongsList.assignAll(
            data.where((o) => o.cat.toLowerCase() == 'kpop').toList());
        otherTopSongsList.assignAll(
            data.where((o) => o.cat.toLowerCase() == 'others').toList());
      }
    } finally {
      isLoding(false);
    }
  }
}
