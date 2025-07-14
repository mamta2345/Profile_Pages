import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_pages/Controller/Host_Pages/host_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Event card
              Padding(
                padding: const EdgeInsets.only(top: 153, left: 24, right: 24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/event place holder.png',
                    height: 396,
                    width: 342,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 12),
                  Text(
                    "Let’s host your event!!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "You’ve got the idea. We’ve got the platform.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    icon: Icon(Icons.celebration_outlined),
                    label: Text("Be a host"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: BottomBar(
              selectedIndex: controller.currentPage.value,
              onTap: controller.changePage,
              textStyle: TextStyle(fontWeight: FontWeight.bold),
              items: <BottomBarItem>[
                buildButton('assets/icons/host.png', "Home", 45, 45),
                buildButton('assets/icons/host (1).png', "Wall", 45, 45),
                buildButton('assets/icons/hostmain.png', "Host", 30, 30),
                buildButton('assets/icons/host (3).png', "Notify", 45, 45),
                buildButton('assets/icons/host (2).png', "Profile", 45, 45),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomBarItem buildButton(
    String iconPath,
    String title,
    double width,
    double height,
  ) {
    return BottomBarItem(
      icon: Image.asset(
        iconPath,
        width: width,
        height: height,
        color: Colors.white,
      ),
      title: Text(title, style: TextStyle(color: Colors.white)),
      activeColor: Colors.white,
    );
  }
}
