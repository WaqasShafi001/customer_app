// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_app/common/appColors.dart';
import 'package:customer_app/common/capitilizeExtention.dart';
import 'package:customer_app/flow/menu/models/CategoriesProductsApiModel.dart';
import 'package:customer_app/flow/search/model/basicSearchModel.dart';
import 'package:customer_app/main.dart';
import 'package:customer_app/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/menuProductModel.dart';
import '../horizontalLayout/listingLayouts.dart';
import 'productDetailController.dart';

class ProductDetailScreen extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? description;
  final int? price;
  final int? isHalal;
  final int? isChilli;
  final int? isNew;
  final int? isPopular;
  final int? isVegiterian;
  final int? time;
  final List<ExtrasFromMeal>? extrasFromMealPlanner;
  final List<ExtrasFromListing>? extrasFromCategoryProductListing;
  final List<ExtrasFromSearch>? extrasFromSearch;
  final String? isMealPlanner;

  const ProductDetailScreen({
    Key? key,
    this.imagePath,
    this.title,
    this.description,
    this.price,
    this.isHalal,
    this.isChilli,
    this.isNew,
    this.isPopular,
    this.isVegiterian,
    this.time,
    this.extrasFromMealPlanner,
    this.extrasFromCategoryProductListing,
    this.isMealPlanner = AppConstants.fromMeal,
    this.extrasFromSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productDetailController = Get.put(ProductDetailController());
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        resizeToAvoidBottomInset: true,
        body: Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                child: Column(
                  //  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.4,
                      color: AppColors.backgroundColor,
                      child: CachedNetworkImage(
                        imageUrl: imagePath!,
                        fit: BoxFit.fill,
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        placeholder: (context, url) => Center(
                          child: Image.asset(
                            'assets/no_image.png',
                          ),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Image.asset(
                            'assets/no_image.png',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      width: constraints.maxWidth,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          SizedBox(
                            height: constraints.maxHeight * 0.01,
                          ),
                          Container(
                            height: constraints.maxHeight * 0.17,
                            width: constraints.maxWidth * 0.9,
                            color: AppColors.backgroundColor,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '${title!.capitalizeFirstofEach}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width >
                                                            600
                                                        ? MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.0175
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.015,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            isNew == 1
                                                ? Image.asset(
                                                    'assets/new.png',
                                                  )
                                                : SizedBox(),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            isPopular == 1
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(15),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            AppColors.mainColor,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: constraints
                                                                  .maxWidth *
                                                              0.015,
                                                          vertical: 2),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            'Popular',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .midBlackColor,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .local_fire_department_outlined,
                                                            color: AppColors
                                                                .mainColor,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox()
                                          ],
                                        ),
                                        Text(
                                          '${description!.capitalizeFirstofEach}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    600
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.016
                                                : MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.015,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: AppColors.mainColor,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Image.asset(
                                                  'assets/time.png',
                                                  color: AppColors.mainColor,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width:
                                                  constraints.maxWidth * 0.01,
                                            ),
                                            Text(
                                              '$time Minute(s)',
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        600
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.016
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.015,
                                              ),
                                            ),
                                            SizedBox(
                                              width:
                                                  constraints.maxWidth * 0.01,
                                            ),
                                            isChilli == 1
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            AppColors.mainColor,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              6.0),
                                                      child: Image.asset(
                                                        'assets/chilli.png',
                                                        height: constraints
                                                                .maxHeight *
                                                            0.016,
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox(),
                                            SizedBox(
                                              width:
                                                  constraints.maxWidth * 0.01,
                                            ),
                                            isVegiterian == 1
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            AppColors.mainColor,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(6.0),
                                                        child: Image.asset(
                                                          'assets/onion.png',
                                                          color: AppColors
                                                              .mainColor,
                                                        )),
                                                  )
                                                : SizedBox(),
                                            SizedBox(
                                              width:
                                                  constraints.maxWidth * 0.01,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: AppColors.mainColor,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: isHalal == 1
                                                    ? Image.asset(
                                                        'assets/halal.png',
                                                        height: constraints
                                                                .maxHeight *
                                                            0.017,
                                                        color:
                                                            AppColors.mainColor,
                                                      )
                                                    : SizedBox(),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Container(
                                      height: constraints.maxHeight * 0.03,
                                      width: constraints.maxWidth * 0.1,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(6),
                                          ),
                                          color: AppColors.paleGreenColor
                                              .withOpacity(0.2)),
                                      child: Center(
                                        child: Text(
                                          '\$${formatter.format(price)}',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    600
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.017
                                                : MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.015,
                                            color: AppColors.mainColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Obx(
                            () => Container(
                              height: constraints.maxHeight * 0.14,
                              width: constraints.maxWidth,
                              color: AppColors.backgroundColor,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: constraints.maxWidth * 0.15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          flex: 7,
                                          child: Container(
                                            height:
                                                constraints.maxHeight * 0.05,
                                            color: Colors.transparent,
                                            child: RadioListTile<String>(
                                              value: 'Single',
                                              groupValue:
                                                  productDetailController
                                                      .slectedValue.value,
                                              onChanged: (value) {
                                                productDetailController
                                                    .slectedValue
                                                    .value = value!;
                                              },
                                              activeColor: AppColors.mainColor,
                                              title: Text(
                                                'sinlge',
                                                style: TextStyle(
                                                  fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width >
                                                          600
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.016
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.015,
                                                ),
                                              ).tr(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          child: Container(
                                            height:
                                                constraints.maxHeight * 0.05,
                                            color: Colors.transparent,
                                            child: Center(
                                              child: Text(
                                                '\$ $price',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 1,
                                      color: AppColors.black2Color,
                                      width: constraints.maxWidth * 0.8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          flex: 7,
                                          child: Container(
                                            height:
                                                constraints.maxHeight * 0.05,
                                            color: Colors.transparent,
                                            child: RadioListTile<String>(
                                              value: 'Double',
                                              groupValue:
                                                  productDetailController
                                                      .slectedValue.value,
                                              onChanged: (value) {
                                                productDetailController
                                                    .slectedValue
                                                    .value = value!;
                                              },
                                              activeColor: AppColors.mainColor,
                                              title: Text(
                                                'double',
                                                style: TextStyle(
                                                  fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width >
                                                          600
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.016
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.015,
                                                ),
                                              ).tr(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          child: Container(
                                            height:
                                                constraints.maxHeight * 0.05,
                                            color: Colors.transparent,
                                            child: Center(
                                              child: Text(
                                                '\$ ${(price! * 2)}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          isMealPlanner == AppConstants.fromMeal
                              ? Expanded(
                                  child: Container(
                                    // height: constraints.maxHeight * 0.25,
                                    width: constraints.maxWidth,
                                    color: Colors.transparent,
                                    child: extrasFromMealPlanner!.isEmpty
                                        ? SizedBox()
                                        : ListView.builder(
                                            itemCount:
                                                extrasFromMealPlanner!.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) =>
                                                Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      constraints.maxHeight *
                                                          0.01),
                                              child: Center(
                                                child: Container(
                                                  height:
                                                      constraints.maxHeight *
                                                          0.05,
                                                  width: constraints.maxWidth *
                                                      0.71,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.mainColor
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(15),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: constraints
                                                                .maxWidth *
                                                            0.025),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            extrasFromMealPlanner![
                                                                    index]
                                                                .name!,
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width >
                                                                      600
                                                                  ? MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.016
                                                                  : MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.015,
                                                            ),
                                                          ),
                                                          flex: 7,
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            '\$ ${extrasFromMealPlanner![index].price!.toString()}',
                                                            style: TextStyle(
                                                                fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .width >
                                                                        600
                                                                    ? MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.016
                                                                    : MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.015,
                                                                color: AppColors
                                                                    .mainColor),
                                                          ),
                                                          flex: 3,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                )
                              : isMealPlanner == AppConstants.fromListing
                                  ? Expanded(
                                      child: Container(
                                        // height: constraints.maxHeight * 0.25,
                                        width: constraints.maxWidth,
                                        color: Colors.transparent,
                                        child: extrasFromCategoryProductListing!
                                                .isEmpty
                                            ? SizedBox()
                                            : ListView.builder(
                                                itemCount:
                                                    extrasFromCategoryProductListing!
                                                        .length,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) =>
                                                    Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: constraints
                                                              .maxHeight *
                                                          0.01),
                                                  child: Center(
                                                    child: Container(
                                                      height: constraints
                                                              .maxHeight *
                                                          0.05,
                                                      width:
                                                          constraints.maxWidth *
                                                              0.71,
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .mainColor
                                                            .withOpacity(0.2),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(15),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    constraints
                                                                            .maxWidth *
                                                                        0.025),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                extrasFromCategoryProductListing![
                                                                        index]
                                                                    .name!,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: MediaQuery.of(context)
                                                                              .size
                                                                              .width >
                                                                          600
                                                                      ? MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.016
                                                                      : MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.015,
                                                                ),
                                                              ),
                                                              flex: 7,
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                '\$ ${extrasFromCategoryProductListing![index].price!.toString()}',
                                                                style: TextStyle(
                                                                    fontSize: MediaQuery.of(context).size.width >
                                                                            600
                                                                        ? MediaQuery.of(context).size.height *
                                                                            0.016
                                                                        : MediaQuery.of(context).size.height *
                                                                            0.015,
                                                                    color: AppColors
                                                                        .mainColor),
                                                              ),
                                                              flex: 3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        // height: constraints.maxHeight * 0.25,
                                        width: constraints.maxWidth,
                                        color: Colors.transparent,
                                        child: extrasFromSearch!.isEmpty
                                            ? SizedBox()
                                            : ListView.builder(
                                                itemCount:
                                                    extrasFromSearch!.length,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) =>
                                                    Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: constraints
                                                              .maxHeight *
                                                          0.01),
                                                  child: Center(
                                                    child: Container(
                                                      height: constraints
                                                              .maxHeight *
                                                          0.05,
                                                      width:
                                                          constraints.maxWidth *
                                                              0.71,
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .mainColor
                                                            .withOpacity(0.2),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(15),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    constraints
                                                                            .maxWidth *
                                                                        0.025),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                extrasFromSearch![
                                                                        index]
                                                                    .name!,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: MediaQuery.of(context)
                                                                              .size
                                                                              .width >
                                                                          600
                                                                      ? MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.016
                                                                      : MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.015,
                                                                ),
                                                              ),
                                                              flex: 7,
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                '\$ ${extrasFromSearch![index].price!.toString()}',
                                                                style: TextStyle(
                                                                    fontSize: MediaQuery.of(context).size.width >
                                                                            600
                                                                        ? MediaQuery.of(context).size.height *
                                                                            0.016
                                                                        : MediaQuery.of(context).size.height *
                                                                            0.015,
                                                                    color: AppColors
                                                                        .mainColor),
                                                              ),
                                                              flex: 3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: constraints.maxHeight * 0.04,
                left: constraints.maxWidth * 0.03,
                right: constraints.maxWidth * 0.03,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Align(
                    alignment: findLanguageController.isEnglish.value ||
                            findLanguageController.isTurkish.value
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      height: constraints.maxHeight * 0.032,
                      width: constraints.maxWidth * 0.1,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.pureWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
