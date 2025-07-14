import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_pages/Controller/Profile_pages/edit_profil.contoller.dart';

class EditProfilePage extends StatelessWidget {
  final controller = Get.put(EditProfileController());

  EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back, size: 24, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              "Edit Profile",
              style: GoogleFonts.bricolageGrotesque(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            sectionCard(
              title: Obx(
                () => Text(
                  controller.name.value,
                  style: GoogleFonts.bricolageGrotesque(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infoRow(
                    'assets/icons/Phone.png',
                    "Phone Number",
                    controller.phone.value,
                  ),
                  Divider(color: Colors.white10, height: 20),
                  infoRow(
                    'assets/icons/Letter.png',
                    "Email",
                    controller.email.value,
                  ),
                  Divider(color: Colors.white10, height: 20),
                ],
              ),
              onEdit: () {},
            ),

            photoSection(
              onEdit: () {
                // Handle edit logic
              },
              photoPaths: [
                'assets/images/Frame 44.png',
                'assets/images/Frame 45.png',
                'assets/images/Frame 44 (1).png',
                'assets/images/Frame 45 (1).png',
              ],
            ),
            SizedBox(height: 10),

            Text(
              "Personal details",
              style: GoogleFonts.bricolageGrotesque(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            sectionCard(
              subtitle: Column(
                children: [
                  infoRow(
                    'assets/icons/Confetti.png',
                    "Date of birth",
                    controller.dob.value,
                  ),
                  Divider(color: Colors.white10, height: 20),

                  infoRow(
                    'assets/icons/User.png',
                    "Gender",
                    controller.gender.value,
                  ),
                  Divider(color: Colors.white10, height: 20),

                  infoRow(
                    'assets/icons/Star Rings.png',
                    "Pronouns",
                    controller.pronouns.value,
                  ),
                  Divider(color: Colors.white10, height: 20),

                  infoRow(
                    'assets/icons/Point On Map.png',
                    "Location",
                    controller.location.value,
                  ),
                ],
              ),
            ),

            sectionCard(
              title: Row(
                children: [
                  Image.asset(
                    "assets/icons/Confetti.png",
                    width: 30,
                    height: 20,
                    color: Colors.white,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Bio",
                    style: GoogleFonts.bricolageGrotesque(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              subtitle: Obx(
                () => Text(
                  controller.bio.value.isEmpty
                      ? 'Bio not yet added'
                      : controller.bio.value,
                  style: GoogleFonts.bricolageGrotesque(color: Colors.white70),
                ),
              ),
              onEdit: () {
                Get.defaultDialog(
                  title: "Edit Bio",
                  content: TextField(
                    onChanged: (val) => controller.bio.value = val,
                    decoration: InputDecoration(hintText: 'Enter bio...'),
                  ),
                  confirm: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: Text("Save"),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Text(
              "Social media details",
              style: GoogleFonts.bricolageGrotesque(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            sectionCard(
              subtitle: Column(
                children: [
                  infoRow(
                    'assets/icons/instagram.png',
                    "Instagram",
                    controller.dob.value,
                  ),
                  Divider(color: Colors.white10, height: 20),

                  infoRow(
                    'assets/icons/twitter.png',
                    "x(Twitter)",
                    controller.gender.value,
                  ),
                  Divider(color: Colors.white10, height: 20),

                  infoRow(
                    'assets/icons/snapchat.png',
                    "Snapchat",
                    controller.pronouns.value,
                  ),
                  Divider(color: Colors.white10, height: 20),

                  infoRow(
                    'assets/icons/facebook.png',
                    "Facebook",
                    controller.location.value,
                  ),
                  Divider(color: Colors.white10, height: 20),
                ],
              ),
            ),
            SizedBox(height: 10),

            preferenceSection(
              onEdit: () {
                // Handle edit logic
              },
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.grey.shade900],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade800, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/Trash Bin 2.png',
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Delete my account",
                            style: GoogleFonts.bricolageGrotesque(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icons/Arrow Right.png',
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionCard({
    Widget? title,
    required Widget subtitle,
    VoidCallback? onEdit,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ?title,
              if (onEdit != null) editResuse(onEdit: () {}),
            ],
          ),
          SizedBox(height: 10),
          subtitle,
        ],
      ),
    );
  }

  Widget infoRow(String assetspath, String value, String value1) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Image.asset(
            assetspath,
            width: 30,
            height: 20,
            color: Colors.white,
            colorBlendMode: BlendMode.srcIn,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: GoogleFonts.bricolageGrotesque(color: Colors.white70),
                ),
                Text(
                  value1,
                  style: GoogleFonts.bricolageGrotesque(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget photoSection({
    required VoidCallback onEdit,
    required List<String> photoPaths,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Photos",
              style: GoogleFonts.bricolageGrotesque(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            editResuse(onEdit: () {}),
          ],
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: photoPaths.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(photoPaths[index], fit: BoxFit.cover),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget preferenceSection({required VoidCallback onEdit}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your preferences",
          style: GoogleFonts.bricolageGrotesque(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row with icon, title, edit
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/Masks.png',
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Events or Activities interested in",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  editResuse(onEdit: () {}),
                ],
              ),
              Divider(color: Colors.white10),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  interestChip("assets/icons/Suitcase Tag.png", "Picnic"),
                  interestChip("assets/icons/Leaf.png", "Outdoor"),
                  interestChip("assets/icons/Suitcase Tag.png", "Travel"),
                  interestChip("assets/icons/Wineglass.png", "Dinner"),
                  interestChip("assets/icons/Hiking.png", "Hiking"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget interestChip(String iconPath, String label, {bool showDot = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, width: 16, height: 16, color: Colors.white),
          SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.bricolageGrotesque(color: Colors.white),
          ),
          if (showDot)
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget editResuse({required VoidCallback onEdit}) {
    return InkWell(
      onTap: onEdit,
      child: Row(
        children: [
          Image.asset(
            "assets/icons/Edit Pen.png",
            width: 20,
            height: 20,
            color: Colors.purple,
          ),
          SizedBox(width: 6),
          Text(
            "Edit",
            style: GoogleFonts.bricolageGrotesque(color: Colors.purple),
          ),
        ],
      ),
    );
  }
}
