import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
import 'package:flutter_thread_clone/feature/photo/view_models/photo_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';

class PhotoPreview extends ConsumerStatefulWidget {
  final XFile image;
  final String imagePath;

  const PhotoPreview({required this.image, required this.imagePath, super.key});

  @override
  ConsumerState<PhotoPreview> createState() => _PhotoPreviewState();
}

class _PhotoPreviewState extends ConsumerState<PhotoPreview> {
  Future<void> _onDownloadImage(XFile image, String imagePath) async {
    GallerySaver.saveImage(imagePath).then((image) {
      print("Saved Picture");
    });
    Navigator.of(context).pop();
  }

  void _onUploadPressed() async {
    ref.read(photoProvider.notifier).uploadPhoto(
          File(widget.imagePath),
          context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.7,
              child: Image.file(
                File(widget.imagePath), // 이걸 repo에도 보내야하는 거 아닐까?
              ),
            ),
            GestureDetector(
              onTap: () => _onDownloadImage(widget.image, widget.imagePath),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                ),
                width: size.width - Sizes.size64 - Sizes.size3,
                height: size.height / 10,
                color: Colors.black,
                child: const Text(
                  "Save image 📷",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
