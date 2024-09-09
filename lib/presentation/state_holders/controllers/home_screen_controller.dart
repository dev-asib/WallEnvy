import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wall_envy/data/entities/wallpapers.dart';

class HomeScreenController extends GetxController {
  final List<Wallpapers> _wallpapers = [];
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  List<Wallpapers> get wallpapers => _wallpapers;

  Future<void> _fetchWallpapers() async {
    try {
      _firebaseFirestore.collection("wallpapers").snapshots().listen(
        (snapshot) {
          _wallpapers.clear();
          for (QueryDocumentSnapshot doc in snapshot.docs) {
            try {
              final imgUrl = doc.get('imgUrl') as String?;
              if (imgUrl != null) {
                _wallpapers.add(
                  Wallpapers(
                    wallpaperID: doc.id,
                    wallpaperUrl: imgUrl,
                  ),
                );
              } else {
                debugPrint("imgUrl is null for document ${doc.id}");
              }
            } catch (e) {
              debugPrint("Error processing document ${doc.id}: $e");
            }
          }
          update();
        },
        onError: (error) {
          debugPrint("Error fetching wallpapers: $error");
        },
      );
    } catch (e) {
      debugPrint("Error initializing wallpaper fetch: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    _fetchWallpapers();
  }
}
