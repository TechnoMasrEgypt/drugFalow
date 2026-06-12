import 'package:drug_flow/features/Home_sction/profile/data/social_links_response.dart';

abstract class SocialLinksState {}

class SocialLinksInitial extends SocialLinksState {}

class SocialLinksLoading extends SocialLinksState {}

class SocialLinksSuccess extends SocialLinksState {
  final SocialLinksData data;

  SocialLinksSuccess(this.data);
}

class SocialLinksError extends SocialLinksState {
  final String message;

  SocialLinksError(this.message);
}