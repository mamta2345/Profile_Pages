// profile_page.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_pages/Controller/page_controller.dart';
import 'package:profile_pages/Home_Pages/edit_profile_page.dart';
import 'package:profile_pages/Reusable/image_reusable.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.grey.shade900],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row: Logo + Close
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Image.asset(
                        'assets/icons/loopin.png',
                        color: Colors.white,
                        height: 40, // keep small height
                        width: 100,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close drawer
                      },
                    ),
                  ],
                ),
              ),

              // Menu Items
              _buildMenuItem('assets/icons/Help.png', "Help & Support", () {}),
              _buildMenuItem(
                'assets/icons/Documents.png',
                "Terms & Condition",
                () {},
              ),
              _buildMenuItem(
                "assets/icons/Shield Keyhole.png",
                "Privacy Policy",
                () {},
              ),
              _buildMenuItem(
                "assets/icons/User Settings.png",
                "App loopin",
                () {},
              ),
              _buildMenuItem("assets/icons/Logout.png", "Log out", () {}),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/icons/Edit Pen.png',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => EditProfilePage()); // Replace with your target page
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            // Profile Info
            Row(
              children: [
                Container(
                  width: 50, // Same as CircleAvatar diameter (radius * 2)
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/mobile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Row(
                        children: [
                          Text(
                            controller.name.value,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(width: 30),
                          Icon(Icons.brightness_3, color: Colors.red, size: 14),
                          Text(
                            " ${controller.matchPercentage.value}%",
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Obx(
                      () => Text(
                        "${controller.age.value} yr, ${controller.gender.value}",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Add Bio Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:
                    Colors.transparent, // or Colors.black for card background
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade800, // outline color
                  width: 2, // thickness of the border
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Complete your profile",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Give others a glimpse of your personality\nwrite a bio that shines",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.grey.shade900],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade800, // outline color
                        width: 2, // thickness of the border
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left Side: Add Bio Button (icon + text)
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          onPressed: () {
                            // Add bio logic
                            Get.defaultDialog(
                              title: "Add Bio",
                              content: TextField(
                                onChanged: (value) =>
                                    controller.bio.value = value,
                                decoration: InputDecoration(
                                  hintText: "Type your bio...",
                                ),
                              ),
                              confirm: ElevatedButton(
                                onPressed: () => Get.back(),
                                child: Text("Save"),
                              ),
                            );
                          },
                          icon: Image.asset(
                            'assets/icons/Edit Pen.png',
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                          label: Text("Add bio"),
                        ),

                        // Right Side: Plus Button
                        IconButton(
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Handle add action here
                            if (kDebugMode) {
                              print("Plus button tapped");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Image Card
            SizedBox(
              height: 346, // Set desired height
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomImageCard(imagePath: "assets/images/man.png"),
                    SizedBox(width: 10),
                    CustomImageCard(imagePath: "assets/images/man.png"),
                    SizedBox(width: 10),
                    CustomImageCard(imagePath: "assets/images/man.png"),
                    //  Add more images as needed
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String assetspath, String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: InkWell(
        onTap: onTap, // 👈 use the passed function here
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.bricolageGrotesque(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Transform.scale(
              scale: 1.2,
              child: Image.asset(
                assetspath,
                width: 30,
                height: 20,
                color: Colors.white,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
