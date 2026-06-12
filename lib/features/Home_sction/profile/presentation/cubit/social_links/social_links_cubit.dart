// import 'package:bloc/bloc.dart';
// import 'package:drug_flow/core/usecases/usecase.dart';
// import 'package:drug_flow/features/profile/domain/uesecases/social_links_use_case.dart';
// import 'package:meta/meta.dart';

// import '../../../../../core/errors/failure.dart';

// part 'social_links_state.dart';

// class SocialLinksCubit extends Cubit<SocialLinksState> {
//   SocialLinksCubit(this.socialLinksUseCase) : super(SocialLinksInitial());
//   final SocialLinksUseCase socialLinksUseCase;
//   bool? loading = false;
//   bool? error = false;
//   bool? success = false;
//   String? failMsg;

//   Future<void>getSocialLinks()async{
//     try {
//       loading = true;
//       error = false;
//       success = false;
//       emit(SocialLinksLoading());

//       final failOrUser = await socialLinksUseCase(NoParams());
//       failOrUser.fold(
//             (fail) {
//           if(fail is ServerFailure){
//             loading = false;
//             error = true;
//             success = false;
//             failMsg = fail.message;
//             emit(SocialLinksError());
//           }

//         },
//             (response) {
//           loading = false;
//           error= false;
//           success = true;


//           emit(SocialLinksSuccess());
//         },
//       );
//     } catch (e) {
//       loading = false;
//       error = true;
//       success = false;
//       failMsg = e.toString();
//       // emit(FavouritesError());
//     }
//   }

// }
