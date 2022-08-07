import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/cubit/app_cubit.dart';
import 'package:flutter_travel_app/cubit/app_cubit_state.dart';

import 'package:flutter_travel_app/misc/colors.dart';
import 'package:flutter_travel_app/widgets/app_button.dart';
import 'package:flutter_travel_app/widgets/app_large_text.dart';
import 'package:flutter_travel_app/widgets/app_text.dart';
import 'package:flutter_travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  List<int> integers = [1, 2, 3, 4, 5];
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: ((context, state) {
      DetailState detailState = state as DetailState;
      return Scaffold(
        body: Container(
          constraints: const BoxConstraints(maxWidth: double.maxFinite),
          width: double.infinity,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "http://mark.bslmeiyu.com/uploads/${detailState.place.img}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  width: MediaQuery.of(context).size.width *
                      9 /
                      10, // when in a positioned widget, always use mediaquery instead of double.infinty
                  child: Row(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 320,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: detailState.place.name,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          AppLargeText(
                            text: "\$ ${detailState.place.price}",
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(width: 5),
                          AppText(
                            text: detailState.place.location,
                            color: AppColors.textColor1,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < detailState.place.stars
                                      ? AppColors.starColor
                                      : AppColors.textColor2,
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 5),
                          AppText(
                            text: "(${detailState.place.stars}.0/5)",
                            color: AppColors.textColor2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      AppLargeText(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(height: 5),
                      AppText(
                        text: "Number of people in your group",
                        color: AppColors.mainTextColor,
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        children: List.generate(
                          detailState.place.people,
                          (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  detailState.place.selectedPeople = index + 1;
                                });
                                print(
                                    "${detailState.place.selectedPeople} selected");
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  color: detailState.place.selectedPeople - 1 ==
                                          index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor:
                                      detailState.place.selectedPeople - 1 ==
                                              index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                  size: 50,
                                  borderColor:
                                      detailState.place.selectedPeople - 1 ==
                                              index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                  text: integers[index].toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      AppLargeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(height: 10),
                      AppText(
                        text: detailState.place.description,
                        color: AppColors.mainTextColor,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                      color: AppColors.textColor1,
                      backgroundColor: Colors.white,
                      size: 60,
                      borderColor: AppColors.textColor1,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    const SizedBox(width: 20),
                    ResponsiveButton(
                      isResponsive: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }));
  }
}
