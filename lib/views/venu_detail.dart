import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../models/venue_model.dart';

class VenueDetailsScreen extends StatelessWidget {
  final Venue venue;

  const VenueDetailsScreen({super.key, required this.venue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(venue.name.toString())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            venue.venueImagePaths.isNotEmpty
                ? CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: false, // Enable auto-slide
                      autoPlayInterval:
                          const Duration(seconds: 3), // Time per slide
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800), // Smooth animation
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true, // Zoom effect
                      enableInfiniteScroll: false, // Disable loop
                      // aspectRatio: 16 / 9, // Adjust size
                      // //viewportFraction: 0.8, // Show part of next image
                    ),
                    items: venue.venueImagePaths.map((imageUrl) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList())
                : const Icon(Icons.image_not_supported, size: 80),
            const SizedBox(height: 16),
            Text(venue.name.toString(),
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.blue,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(venue.address.toString(),
                      overflow: TextOverflow.visible,
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Description:",
                style: TextStyle(fontWeight: FontWeight.w900)),
            Text(venue.description.toString()),
            const SizedBox(height: 8),
            Text("Max Capacity: ${venue.maxCapacity}"),
            Text("Menu Price: ${venue.menuPrice}"),
          ],
        ),
      ),
    );
  }
}
