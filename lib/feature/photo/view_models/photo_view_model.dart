import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_thread_clone/feature/authentication/repos/authentication_repo.dart';
import 'package:flutter_thread_clone/feature/photo/models/photo_model.dart';
import 'package:flutter_thread_clone/feature/photo/repos/photo_repo.dart';
import 'package:go_router/go_router.dart';

class UploadPhotoViewModel extends AsyncNotifier<void> {
  late final PhotoRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(photoRepo);
  }

  Future<void> uploadPhoto(File photo, BuildContext context) async {
    final user = ref.read(authRepo).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final task = await _repository.uploadPhotoFile(
        photo,
        user!.uid,
      );
      if (task.metadata != null) {
        await _repository.savePhoto(PhotoModel(
          title: "Take a photos",
          description: "practice Threads",
          fileUrl: await task.ref.getDownloadURL(),
          creatorUid: user.uid,
          likes: 0,
          comments: 0,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          creator: "baaaang_gong",
        ));
        context.pop();
        context.pop();
      }
    });
  }
}

final photonForm = StateProvider((ref) => {});

final photoProvider = AsyncNotifierProvider<UploadPhotoViewModel, void>(
  () => UploadPhotoViewModel(),
);
