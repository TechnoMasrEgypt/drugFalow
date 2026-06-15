import 'dart:ui' as ui;

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/localization/lang_keys.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:drug_flow/core/widgets/silver_grid_delegate_with_fixed_axis_count/silver_grid_delegate_with_fixed_axis_count.dart';
import 'package:drug_flow/features/Home_sction/bottom_bar/presentation/widgets/home_app_bar.dart';
import 'package:drug_flow/features/Home_sction/home/logic/home_cubit.dart';
import 'package:drug_flow/features/Home_sction/home/logic/home_state.dart';
import 'package:drug_flow/features/Home_sction/home/ui/ware_house_item.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/search_field.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    context.read<WarehouseCubit>()
      ..getSlides()
      ..getWarehouses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.height / 70),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const MedicineSearchField(warehouseId: 1),
          ),
          SizedBox(height: 40.h),
          BlocBuilder<WarehouseCubit, WarehouseState>(
            builder: (context, state) {
              final cubit = context.read<WarehouseCubit>();

              final slides = cubit.sliderResponse?.data ?? [];

              if (slides.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: slides.length,
                    itemBuilder: (context, index, realIndex) {
                      final slide = slides[index];

                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: context.width / 30,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.network(
                            slide.image ?? '',
                            width: double.infinity,
                            height: context.height / 5,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => ImageHandler(
                              img: upscale,
                              width: double.infinity,
                              height: context.height / 5,
                            ),
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: context.height / 5,
                      autoPlay: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          cubit.currentindex = index;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 12.h),

                  AnimatedSmoothIndicator(
                    activeIndex: cubit.currentindex,
                    count: slides.length,
                    effect: ExpandingDotsEffect(
                      spacing: 8,
                      radius: 20,
                      dotWidth: context.width / 60,
                      dotHeight: context.width / 60,
                      activeDotColor: color97C3D0,
                      dotColor: colorCCE5EC,
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: context.height / 90),

          SizedBox(height: context.height / 40),
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.width / 30),
            child: Text(
              context.translate(LangKeys.allWarehouses),
              style: TextStyles.textStyleNormal14.copyWith(
                color: color121217,
                fontWeight: FontWeight.w600,
              ),
              textScaler: TextScaler.linear(1),
            ),
          ),
          BlocBuilder<WarehouseCubit, WarehouseState>(
            builder: (context, state) {
              var cubit = context.read<WarehouseCubit>();
              return Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(
                    vertical: context.height / 60,
                    horizontal: context.width / 30,
                  ),
                  itemCount: cubit.warehouses?.length ?? 21,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                        height: context.height / 5,
                        crossAxisSpacing: context.width / 70,
                        mainAxisSpacing: context.height / 50,
                        crossAxisCount: 3,
                      ),
                  itemBuilder: (context, index) =>
                      WareHousesItem(data: cubit.warehouses![index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
