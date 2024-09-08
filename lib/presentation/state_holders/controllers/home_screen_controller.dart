import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:wall_envy/data/entities/wallpapers.dart';

class HomeScreenController extends GetxController {
  final List<Wallpapers> _wallpapers = [];
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  List<Wallpapers> get wallpapers => _wallpapers;

  Future<void> _fetchWallpapers() async {
    _firebaseFirestore.collection("wallpapers").snapshots().listen(
      (snapshot) {
        _wallpapers.clear();
        for (QueryDocumentSnapshot doc in snapshot.docs) {
          _wallpapers.add(
            Wallpapers(
              wallpaperID: doc.id,
              wallpaperUrl: doc.get('imgUrl'),
            ),
          );
        }
        update();
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    _fetchWallpapers();
  }
}
