import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/core/models/parent.dart';
import 'package:fun_nance_rewritten/core/services/auth_service.dart';
import 'package:fun_nance_rewritten/core/services/network_service.dart';

class ParentProvider extends ChangeNotifier {
  bool _isLoading = false;
  UserCredential? _userCredential;
  Parent? _parent;
  final AuthService _auth = AuthService();
  final NetworkService _network = NetworkService();

  bool get isLoading => _isLoading;
  UserCredential? get userCredential => _userCredential;
  Parent? get parent => _parent;

  setLoader(bool loader) {
    _isLoading = loader;
    notifyListeners();
  }

  Future<String?> loginParentUser({
    required String email,
    required String password,
  }) async {
    setLoader(true);
    try {
      _userCredential = await _auth.loginUser(
        email: email,
        password: password,
      );

      final parentId = _userCredential!.user!.uid;

      final response = await _network.get(path: "parents", params: parentId);

      Map<String, dynamic> decodedResponse = jsonDecode(response.body);

      _parent = Parent.fromMap(decodedResponse["data"]);

    } catch (error) {
      setLoader(false);
      return error.toString();
    }
    setLoader(false);

    return null;
  }

  Future<String?> registerParentUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    setLoader(true);
    try {
      _userCredential = await _auth.registerUser(
        email: email,
        password: password,
      );

      _userCredential!.user!.updateDisplayName("PARENT");

      final createdAt = DateTime.now();
      final updatedAt = createdAt;

      _parent = Parent(
        id: _userCredential!.user!.uid,
        fullName: fullName,
        email: email,
        createdAt: createdAt,
        modifiedAt: updatedAt,
      );

      final response = await _network.post(
        path: "register/parents",
        body: _parent!.toMap(),
      );

      if (response.statusCode >= 400) {
        return "An error has occured, please try again later";
      }
    } catch (error) {
      setLoader(false);
      return error.toString();
    }
    setLoader(false);

    return null;
  }

  void logoutParentUser() {
    _auth.logoutUser();
    _userCredential = null;
    _parent = null;
  }
}

final parentProvider = ChangeNotifierProvider<ParentProvider>(
  (ref) => ParentProvider(),
);
