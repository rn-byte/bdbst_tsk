import 'package:bandobasta_task/views/widgets/row_widget.dart';
import 'package:flutter/material.dart';
import '../models/venue_model.dart';
import 'widgets/image_slider.dart';

class VenueDetailsScreen extends StatelessWidget {
  final Venue venue;
  const VenueDetailsScreen({super.key, required this.venue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(venue.name.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            venue.venueImagePaths.isNotEmpty
                ? ImageSlider(imagePath: venue.venueImagePaths)
                : const Icon(Icons.image_not_supported, size: 80),
            const SizedBox(height: 16),
            Text(venue.name.toString(),
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.blue,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(venue.address.toString(),
                      overflow: TextOverflow.visible,
                      style: const TextStyle(fontSize: 17, color: Colors.grey)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            RowWidget(
                strName: "Status : ",
                strValue: venue.status.toString(),
                color: venue.status == 'AVAILABLE' ? Colors.green : Colors.red),
            const SizedBox(height: 10),
            const Text("Description:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
            Text(
              venue.description.toString(),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            RowWidget(
              strName: 'Max Capacity : ',
              strValue: venue.maxCapacity.toString(),
            ),
            RowWidget(
                strName: "Menu Price : ",
                strValue: 'Rs. ${venue.menuPrice.toString()}')
          ],
        ),
      ),
    );
  }
}
