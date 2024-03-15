import 'dart:ffi';

import 'package:appdua/cubit/seat_cubit.dart';
import 'package:appdua/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
//NOTE: 0=AVAILABLE, 1=SELECTED, 2=UNAVAILABLE
  final bool isAvailable;
  final String id;

  const SeatItem({super.key, this.isAvailable = true, required this.id});

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgrooundColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if (isSelected) {
          return kprimaryColor;
        } else {
          return kAvailable;
        }
      }
    }

    bordeColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        return kprimaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            "YOU",
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgrooundColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: bordeColor(),
            width: 2,
          ),
        ),
        child: child(),
      ),
    );
  }
}
