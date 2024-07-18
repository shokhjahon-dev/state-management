import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../services/api_service.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];
  bool _isLoading = true;

  List<Post> get posts => _posts;

  bool get isLoading => _isLoading;

  PostProvider() {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();

    _posts = await ApiService().fetchPosts();
    _isLoading = false;
    notifyListeners();
  }
}
