import 'package:flutter/material.dart';

import 'shimmer_effect.dart';

class VenueCardShimmer extends StatelessWidget {
  const VenueCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              ShimmerEffect(width: 130, height: 130, radius: 10),
              SizedBox(width: 10),
              Column(
                children: [
                  ShimmerEffect(width: 150, height: 15),
                  SizedBox(height: 16 / 2),
                  ShimmerEffect(width: 150, height: 12),
                  SizedBox(height: 16 / 2),
                  ShimmerEffect(width: 150, height: 12),
                ],
              )
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
