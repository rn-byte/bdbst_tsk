import 'package:flutter/material.dart';

import '../../widgets/shimmer/venue_card_shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return const VenueCardShimmer();
        },
      ),
    );
  }
}
