import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/videos.dart';
import 'package:drug_flow/features/Auths/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:drug_flow/core/utils/shared_prefrence_helpers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initVideo();
    // ✅ use addPostFrameCallback so context is ready before navigation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<SplashCubit>().setSplash(context: context);
    });
  }

  void _initVideo() {
    _controller = VideoPlayerController.asset(video)
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() {});
        _controller.setLooping(
          true,
        ); // ✅ loop so it doesn't freeze on last frame
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // ✅ always dispose video controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDark,
      body: _controller.value.isInitialized
          ? SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 1.0,
              ),
            ),
    );
  }
}
