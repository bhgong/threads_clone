import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
import 'package:flutter_thread_clone/feature/authentication/widgets/photo_preview.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with TickerProviderStateMixin {
  late CameraController _cameraController;

  bool _hasPermission = false;
  late final bool _noCamera = kDebugMode && Platform.isIOS;

  File? _image;

  List<Image> picImages = [];
  @override
  void initState() {
    super.initState();

    if (!_noCamera) {
      initPermissions();
    } else {
      setState(() {
        _hasPermission = true;
      });
    }
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.ultraHigh,
      enableAudio: false,
    );

    await _cameraController.initialize();

    setState(() {});
  }

  Future<void> _takePhotos(BuildContext context) async {
    // ImagePicker().pickImage(source: ImageSource.camera).then((value) {
    //   if (value != null) {
    //     print("saved path : ${value.path}");

    //     GallerySaver.saveImage(value.path).then((value) {
    //       print("Saved Picture");
    //     });
    //   }
    // });

    _cameraController.takePicture().then((image) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PhotoPreview(
            image: image,
            imagePath: image.path,
          ),
        ),
      );
    });
  }

  Future<void> _onPickPhotoPressed(BuildContext context) async {
    final pickPhoto =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickPhoto != null) {
        _image = File(pickPhoto.path);
        setState(() {
          print("add images");
          picImages = [...picImages, Image.file(_image!)];
        });
      } else {
        print("No images selected");
      }
    });
    Navigator.pop(context, picImages);
  }

  @override
  void dispose() {
    if (!_noCamera) {
      _cameraController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: size.width,
        child: !_hasPermission
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Initializing...",
                    style:
                        TextStyle(color: Colors.white, fontSize: Sizes.size20),
                  ),
                  Gaps.v20,
                  CircularProgressIndicator.adaptive()
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  if (!_noCamera && _cameraController.value.isInitialized)
                    CameraPreview(_cameraController),
                  const Positioned(
                    top: Sizes.size40,
                    left: Sizes.size40,
                    child: CloseButton(
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: Sizes.size40,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        // GestureDetector(
                        //   child: Expanded(
                        //     child: Container(
                        //       alignment: Alignment.center,
                        //       child: IconButton(
                        //         onPressed: () => _setFlashMode(FlashMode.auto),
                        //         icon: const FaIcon(
                        //           FontAwesomeIcons.boltLightning,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => _takePhotos(context),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const SizedBox(
                                width: Sizes.size80,
                                height: Sizes.size80,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: Sizes.size6,
                                  value: 1,
                                ),
                              ),
                              Container(
                                width: Sizes.size72,
                                height: Sizes.size72,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: IconButton(
                            onPressed: () => _onPickPhotoPressed(context),
                            icon: const FaIcon(
                              FontAwesomeIcons.photoFilm,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
