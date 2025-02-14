import 'package:bandobasta_task/views/widgets/venue_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/venue_controller.dart';
import 'venu_detail.dart';

class VenueView extends StatelessWidget {
  const VenueView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VenueController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Venues'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: controller.fetchVenueData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const Card(
                        margin: EdgeInsets.all(10), child: VenueCardShimmer());
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData ||
                snapshot.data!.data!.venues.isEmpty) {
              return const Center(child: Text("No venues found"));
            } else {
              var vanueData = snapshot.data!.data!.venues;

              return ListView.builder(
                itemCount: vanueData.length,
                itemBuilder: (context, index) {
                  var venue = vanueData[index];
                  return GestureDetector(
                    onTap: () => Get.to(
                      () => VenueDetailsScreen(venue: venue),
                    ),
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            venue.venueImagePaths.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                        venue.venueImagePaths[0],
                                        width: 130,
                                        height: 130,
                                        fit: BoxFit.cover),
                                  )
                                : const Icon(Icons.image_not_supported,
                                    size: 80),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(venue.name.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16)),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on_outlined,
                                          color: Colors.blue, size: 16),
                                      Flexible(
                                        child: Text(venue.address.toString(),
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 12)),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    venue.description.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[900],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
