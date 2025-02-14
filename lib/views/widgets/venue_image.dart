import 'package:flutter/material.dart';

import '../../models/venue_model.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.venue,
  });

  final Venue venue;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(venue.venueImagePaths[0],
          width: 130, height: 130, fit: BoxFit.cover),
    );
  }
}
