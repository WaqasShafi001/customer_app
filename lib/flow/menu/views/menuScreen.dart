// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:customer_app/common/appColors.dart';
import 'package:customer_app/flow/mainScreen/mainScreen.dart';
import 'package:customer_app/flow/menu/widgets/requestDialog.dart';
import 'package:customer_app/utils/GetXNetworkManager.dart';
import 'package:customer_app/widgets/connectivityBar.dart';
import 'package:customer_app/widgets/verticleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/categoriesProductsApiController.dart';
import '../controllers/layoutChangeController.dart';
import '../controllers/requestController.dart';
import '../widgets/topRightWidget.dart';
import '../widgets/topLeftWidget.dart';
import 'verticalLayout/VerticalLayout.dart';
import 'horizontalLayout/HorizontalLayout.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  bool isVisible = false;
  var layoutChangeController = Get.put(LayoutChangeController());
  var requestController = Get.put(RequestController());
  var categoriesController = Get.put(CategoriesProductsApiController());
  GetXNetworkManager networkManager = Get.put(GetXNetworkManager());

  @override
  Widget build(BuildContext context) {
    categoriesController.getTableNumber();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) => Obx(
          () => Stack(
            alignment: Alignment.center,
            children: [
              layoutChangeController.verticalLayout.value
                  ? VerticalLayout(
                      categoriesController: categoriesController,
                    )
                  : HorizontalLayout(
                      constraints: constraints,
                      categoriesController: categoriesController,
                    ),
              Positioned(
                top: constraints.maxHeight * 0.035,
                left: constraints.maxWidth * 0.06,
                child: TopRightWidget(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                ),
              ),
              Positioned(
                top: constraints.maxHeight * 0.035,
                right: constraints.maxWidth * 0.06,
                child: TopLeftWidget(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  controller: layoutChangeController,
                ),
              ),
              ConnectivityBar(
                networkManager: networkManager,
              ),
              categoriesController.isLoading.value
                  ? Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      color: AppColors.lightGrayColor.withOpacity(0.1),
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    )
                  : SizedBox(),
              Positioned(
                left: 0,
                top: constraints.maxHeight * 0.08,
                child: InkWell(
                  onTap: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    var totalTables = pref.getInt('totalTables');

                    Get.to(MainScreen(
                      totalTables: totalTables,
                    ));
                  },
                  child: Container(
                    height: constraints.maxHeight * 0.09,
                    width: constraints.maxWidth * 0.06,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          VerticalText('TABLE'),
                          Text(
                            categoriesController.tableNumber.value.toString(),
                            style: TextStyle(
                              color: AppColors.pureWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: constraints.maxHeight * 0.08,
                child: InkWell(
                  onTap: () => categoriesController.logOut(),
                  child: Container(
                    height: constraints.maxHeight * 0.1,
                    width: constraints.maxWidth * 0.06,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.power_settings_new_rounded,
                          color: AppColors.pureWhiteColor,
                          size: constraints.maxHeight * 0.025,
                        ),
                        VerticalText('LOGOUT'),
                      ],
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.generalDialog(
            pageBuilder: (context, animation, secondaryAnimation) =>
                RequestDialog(
              controller: requestController,
            ),
            barrierDismissible: true,
            barrierLabel: '',
          );
        },
        label: Text(
          'Request Service',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.pureWhiteColor,
          ),
        ),
        backgroundColor: AppColors.mainColor,
        enableFeedback: true,
        icon: Image.asset(
          'assets/reqService.png',
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: MediaQuery.of(context).size.height * 0.075,
      //   color: AppColors.backgroundColor,
      //   alignment: Alignment.center,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       CommonButton(
      //         color: AppColors.mainColor,
      //         onTap: () {
      //           Get.generalDialog(
      //             pageBuilder: (context, animation, secondaryAnimation) =>
      //                 RequestDialog(
      //               controller: requestController,
      //             ),
      //             barrierDismissible: true,
      //             barrierLabel: '',
      //           );
      //         },
      //         isIcon: true,
      //         icon: Image.asset(
      //           'assets/reqService.png',
      //         ),
      //         text: tr('request_service'),
      //         textColor: AppColors.pureWhiteColor,
      //         width: MediaQuery.of(context).size.width,
      //         height: MediaQuery.of(context).size.height * 0.04,
      //       ),
      //       CommonButton(
      //         color: AppColors.darkGrayColor,
      //         onTap: () {
      //           Get.to(CartScreen());
      //         },
      //         isIcon: true,
      //         icon: Image.asset(
      //           'assets/cartIcon.png',
      //         ),
      //         text: tr('cart'),
      //         textColor: AppColors.pureWhiteColor,
      //         width: MediaQuery.of(context).size.width,
      //         height: MediaQuery.of(context).size.height * 0.04,
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
