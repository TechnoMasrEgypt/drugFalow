import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/features/Home_sction/profile/data/contact_request.dart';
import 'package:drug_flow/features/Home_sction/profile/data/logic/profile_repo.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/contact_us/contact_us_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinksCubit extends Cubit<SocialLinksState> {
  final ProfileRepo repo;

  SocialLinksCubit(this.repo) : super(SocialLinksInitial());

  Future<void> getSocialLinks() async {
    emit(SocialLinksLoading());

    final result = await repo.getSocialLinks();

    result.when(
      success: (data) {
        emit(SocialLinksSuccess(data.data));
      },
      failure: (error) {
        emit(SocialLinksError(error.apiErrorModel.message ?? 'حدث خطأ'));
      },
    );
  }

  Future<void> contactUs(ContactRequest body) async {
    emit(SocialLinksLoading());

    final result = await repo.contactUs(body);

    result.when(
      success: (data) {
        emit(ContactUsSuccess(data));
      },
      failure: (error) {
        emit(ContactUsError(error.apiErrorModel.message ?? 'حدث خطأ'));
      },
    );
  }

  final nameController = TextEditingController();
  final phoneController = TextEditingController(text: '+20 10 1234567');
  final emailController = TextEditingController(text: 'example@mail.com');
  final messageController = TextEditingController();
  Future<void> openLink(String? url) async {
    if (url == null || url.isEmpty) return;

    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.close();
  }
}
