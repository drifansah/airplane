import 'package:appdua/cubit/page_cubit.dart';
import 'package:appdua/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottonNavigationItem extends StatelessWidget {
  final String imageUrl;

  final int index;
  const CustomBottonNavigationItem(
      {super.key, required this.imageUrl, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index ? kprimaryColor:kGreyColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
                color: context.read<PageCubit>().state == index
                    ? kprimaryColor
                    : kTransparentColor,
                borderRadius: BorderRadius.circular(18)),
          ),
        ],
      ),
    );
  }
}
