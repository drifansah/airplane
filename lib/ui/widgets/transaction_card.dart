import 'package:appdua/models/transaction_model.dart';
import 'package:appdua/shared/theme.dart';
import 'package:appdua/ui/widgets/booking_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //NOTE: DESTINATION TILE
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      transaction.destination.imageUrl,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 2),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icon_star.png"),
                      ),
                    ),
                  ),
                  Text(
                    transaction.destination.rating.toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ],
          ),
          //NOTE: BOOKING DETAILS TEXT
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Booking Details",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),

          //NOTE: BOOKING DETAILS ITEM
          BookingDetailsItem(
              title: "Traveler",
              valuetext: "${transaction.amountOfTraveler}person",
              valueColor: kBlackColor),
          BookingDetailsItem(
              title: "Seat",
              valuetext: transaction.selectedSeats,
              valueColor: kBlackColor),
          BookingDetailsItem(
            title: "Insurance",
            valuetext: transaction.insurance ? 'YES' : 'NO',
            valueColor: transaction.insurance ? kGreenColor : kRedColor,
          ),
          BookingDetailsItem(
            title: "Refundable",
            valuetext: transaction.refundable ? 'YES' : 'NO',
            valueColor: transaction.refundable ? kGreenColor : kRedColor,
          ),
          BookingDetailsItem(
              title: "VAT",
              valuetext: "${(transaction.vat * 100).toStringAsFixed(0)}%",
              valueColor: kBlackColor),
          BookingDetailsItem(
              title: "Price",
              valuetext: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(transaction.price),
              valueColor: kBlackColor),
          BookingDetailsItem(
              title: "Grand Total",
              valuetext: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(transaction.grandTotal),
              valueColor: kprimaryColor),
        ],
      ),
    );
  }
}
