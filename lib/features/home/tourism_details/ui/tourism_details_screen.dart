import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morshd/core/widgets/app_scaffold.dart';
import 'package:morshd/features/home/tourism_details/ui/widgets/add_comment_button.dart';
import 'package:morshd/features/home/tourism_details/ui/widgets/image_and_details.dart';

class TourismDetailsScreen extends StatelessWidget {
  final String placeId;
  final String tourismImage;
  final String description;
  final String city;
  final String location;
  final num entryFee;
  final num rating;
  final DateTime openingTime;
  final DateTime closingTime;
  final bool isPopular;
  
  final String name;
  final int index;

  const TourismDetailsScreen({
    super.key,
    required this.placeId,
    required this.tourismImage,
    required this.description,
    required this.city,
    required this.location,
    required this.entryFee,
    required this.rating,
    required this.openingTime,
    required this.closingTime,
    required this.isPopular,
    required this.index,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          backgroundColor: const Color(0xffCEA16E),
          centerTitle: true,
          title: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageAndDetails(
              index: index,
              placeId: placeId,
              tourismImage: tourismImage,
              description:description,
              city: city,
              location: location,
              entryFee: entryFee,
              rating: rating,
              openingTime: openingTime,
              closingTime: closingTime,
              isPopular: isPopular

            ),
          ],
        ),
      ),
      floatingActionButton: AddCommentButton(
        placeId: placeId,
      ),
    );
  }
}

