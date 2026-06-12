import 'package:flutter/material.dart';
/*import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form/core/constants/images.dart';

import '../../../features/favourite/presentation/cubit/favourites_cubit.dart';*/
import '../../constants/colors.dart';
import '../../constants/styles.dart';
import '../../local/auth_local_data_source.dart';
import '../../utils/helpers.dart';
import '../back_to_login_alert.dart';
import '../svg_handler.dart';

class FavouriteButton extends StatefulWidget {
  final bool isFavourite;
  final int itemId;
  String? type;
  final double height;
  final double width;

   FavouriteButton({
    super.key,
    required this.isFavourite,
    required this.itemId,
    this.type = "",
    this.height = 30,
    this.width = 30,
  });

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  late bool isFav;

  @override
  void initState() {
    super.initState();
    isFav = widget.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(); /*BlocConsumer<FavouritesCubit, FavouritesState>(
      listener: (context, state) {
        if (state is FavouritesByUserSuccess) {
          setState(() => isFav = true);
        } else if (state is RemoveFavSuccess) {
          setState(() => isFav = false);
        } else if (state is FavouriteError) {
          // Optional: show snackbar for errors
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message,style: TextStyles.textStyleNormal13.copyWith(
                color: white
              ),textScaler: TextScaler.linear(1),),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<FavouritesCubit>();
        final isLoading = state is FavouriteLoading;

        return InkWell(
          onTap: isLoading
              ? null
              : () {
            final token = sharedPreferences.get(cacheTokenConst);

            if (token == null) {
              showDialog(
                context: context,
                builder: (_) => BackToLogin(),
              );
              return;
            }

            cubit.doFavourite(!isFav, widget.itemId, widget.type!);
          },
          child: isLoading
              ? Container(
            width: widget.width,
            height: widget.height,
            margin: EdgeInsets.symmetric(horizontal: context.width / 50
                ,vertical: context.height/80),
            child: SpinKitPulse(color: white, size: 20),
          )
              : isFav
              ? Container(
            width: context.width/15,
            height: context.height/21,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: customSvg(
              name: favouriteFill,
              color: colorF83D39,
              width: context.width / 50,
              height: context.height / 50,
              fit: BoxFit.cover,
            ),
          )
              : Container(
            width: context.width/15,
            height: context.height/21,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: customSvg(
              name: favourite,
              width: context.width / 50,
              height: context.height / 50,
              color: white,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }*/
  }
}

