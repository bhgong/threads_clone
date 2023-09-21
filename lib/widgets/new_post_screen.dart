import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
import 'package:flutter_thread_clone/feature/authentication/widgets/camera_screen.dart';
import 'package:flutter_thread_clone/feature/photo/view_models/photo_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewPostScreen extends ConsumerStatefulWidget {
  const NewPostScreen({super.key});

  @override
  ConsumerState<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends ConsumerState<NewPostScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _isValid = false;

  bool _isText = true;
  late XFile _image;

  Future<void> _onCameraTap(BuildContext context) async {
    final result = Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
      ),
    );

    setState(() {
      if (result != null) {
        _isText = false;
        // _image = Image.file(File(result.toString()));
        print(_image);
      } else {
        return;
      }
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void onPostTap() {
    // ref.read(photoProvider.notifier).uploadPhoto(photo)
    if (_isText || _image != null) {
      setState(() {
        _isValid = true;
      });
    }
    // 여기에서 홈스크린으로 이동할 수 있도록 하면 됨...ㅎㅎ 그때 홈스크린에서 띄워줄 수 있음
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: Sizes.size60,
          leadingWidth: Sizes.size96 + Sizes.size40,
          title: const Text(
            "New thread",
            style: TextStyle(
              fontSize: Sizes.size20,
            ),
          ),
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: Sizes.size72,
              height: Sizes.size72,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20,
                vertical: Sizes.size20,
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Container(
                width: Sizes.size44,
                height: Sizes.size44,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("lib/images/cat.jpeg"),
                  radius: 25,
                ),
              ),
              title: const Text(
                "everycat",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: _isText // 이부분 수정해야함...
                  ? const TextField(
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Start a thread...",
                        border: InputBorder.none,
                      ),
                    )
                  : Container(
                      width: size.width,
                      height: size.height * 0.2,
                      color: Colors.black,
                    ),
              isThreeLine: true,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Gaps.h40,
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 3,
                    width: 10,
                  ),
                  Gaps.h40,
                  GestureDetector(
                    onTap: () => _onCameraTap(context),
                    child: FaIcon(
                      FontAwesomeIcons.paperclip,
                      color: Colors.grey.shade400,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: TextButton(
            onPressed: () => onPostTap,
            child: Text(
              "post",
              style: TextStyle(
                color: _isValid ? Colors.blue : Colors.grey.shade400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
