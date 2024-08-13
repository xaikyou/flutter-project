import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    final camera = GetIt.instance<CameraDescription>();
    _cameraController = CameraController(
      camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          // Back button
          Padding(
            padding: EdgeInsets.all(50.r),
            child: IconButton(
              icon: CircleAvatar(
                backgroundColor: Colors.black54,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 120.sp,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // Take photo button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 120.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: CircleAvatar(
                      backgroundColor: Colors.black54,
                      radius: 150.r,
                      child: Icon(
                        Icons.photo_camera_rounded,
                        color: Colors.white,
                        size: 120.sp,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: CircleAvatar(
                      backgroundColor: Colors.black54,
                      radius: 150.r,
                      child: Icon(
                        Icons.photo_camera_rounded,
                        color: Colors.white,
                        size: 120.sp,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: CircleAvatar(
                      backgroundColor: Colors.black54,
                      radius: 150.r,
                      child: Icon(
                        Icons.photo_camera_rounded,
                        color: Colors.white,
                        size: 120.sp,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
