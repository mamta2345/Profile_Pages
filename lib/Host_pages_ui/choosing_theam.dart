import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Event {
  final String imagePath;
  final String selectedImagePath;

  Event({required this.imagePath, required this.selectedImagePath});
}

class EventController extends GetxController {
  var selectedIndex = RxInt(-1);
  void selectEvent(int index) => selectedIndex.value = index;
}

class EventSelectionPage extends StatelessWidget {
  final EventController controller = Get.put(EventController());

  final List<Event> events = [
    Event(
      imagePath: 'assets/images/party.png',
      selectedImagePath: 'assets/images/party_selected.png',
    ),
    Event(
      imagePath: 'assets/images/house_party.png',
      selectedImagePath: 'assets/images/house_party_selected.png',
    ),
    Event(
      imagePath: 'assets/images/picnic.png',
      selectedImagePath: 'assets/images/picnic_selected.png',
    ),
    Event(
      imagePath: 'assets/images/music.png',
      selectedImagePath: 'assets/images/music_selected.png',
    ),
    Event(
      imagePath: 'assets/images/activities.png',
      selectedImagePath: 'assets/images/activities_selected.png',
    ),
    Event(
      imagePath: 'assets/images/liquor.png',
      selectedImagePath: 'assets/images/liquor_selected.png',
    ),
    Event(
      imagePath: 'assets/images/cookfest.png',
      selectedImagePath: 'assets/images/cookfest_selected.png',
    ),
    Event(
      imagePath: 'assets/images/litmeet.png',
      selectedImagePath: 'assets/images/litmeet_selected.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        actions: [Icon(Icons.close, color: Colors.white)],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What Exclusive Event Will You Host?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Obx(
                () => GridView.builder(
                  itemCount: events.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    bool isSelected = controller.selectedIndex.value == index;
                    final event = events[index];

                    return GestureDetector(
                      onTap: () => controller.selectEvent(index),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected
                                ? Colors.white
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            isSelected
                                ? event.selectedImagePath
                                : event.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
