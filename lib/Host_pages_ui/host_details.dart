import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_pages/Controller/Host_Pages/detail_controller.dart';
import 'package:profile_pages/Reusable/decoration_field_host_page.dart';
import 'package:profile_pages/Reusable/test_reusable_detail_host.dart';

class HostDetails extends StatelessWidget {
  HostDetails({super.key});
  final controller = Get.put(EventFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Get.back();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Get.offAllNamed('/home');
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Event Title Label
            FormLabel("Event Title", fontSize: 16),

            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: controller.titleController,
                style: GoogleFonts.poppins(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'White Affair',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            /// Description Label
            FormLabel("Description", fontSize: 16),

            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TextField(
                controller: controller.descriptionController,
                maxLines: null,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText:
                      "SIP CLUB POP-UP: DISCO DREAM Wednesday, 18th June | Bastian Garden CityHosted by Pragya Mishra & VrithiManjeshwarTheme: Silver-Coded & Blinged to PerfectionBrace yourself.This isn't just a party — it's a statement.A mirrorball fantasy where every sparkle tells a story, and every second drips with glitz, glam, and electric energy.DISCO DREAM is your passport to the most exclusive night of the seasonwhere-fashion meets fever and the vibe? Unreal.Think Studio 54, reborn in Bangalore - reimagined for the bold, the beautiful, and the unapologetically extra.THE NIGHT:Sequins in motion.Crystals catching strobe flashes.High-gloss glamour with no dimmer switch.This is where the who's-who shows up and shows off.THE SOUND:On the decks - DJ GANESH, India's most iconic wedding DJ, teaming up with Yudi for",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
              ),
            ),
            FormLabel("Date", fontSize: 16),
            Obx(
              () => GestureDetector(
                onTap: () => controller.selectDate(context),
                child: DecoratedInput(
                  iconPath: 'assets/icons/Calendar Mark.png',
                  hint: 'DD/MM/YYYY',
                  value: controller.date.value,
                  iconSize: 24,
                  iconColor: Colors.grey,
                ),
              ),
            ),
            FormLabel("Time", fontSize: 16),
            Obx(
              () => GestureDetector(
                onTap: () => controller.selectTime(context),

                child: DecoratedInput(
                  iconPath: "assets/icons/Clock Circle.png",
                  hint: '7:00 PM',
                  value: controller.time.value,
                ),
              ),
            ),
            FormLabel("Duration", fontSize: 16),
            DecoratedInput(
              value: controller.durationController.text,
              hint: '4H',
              iconPath: 'assets/icons/Hourglass.png',
            ),
            // decoratedTextInput(
            //   controller: controller.durationController,
            //   hint: '4H',
            //   iconPath: 'assets/icons/Hourglass.png',
            // ),
            FormLabel("Loaction", fontSize: 16),
            decoratedTextInput(
              controller: controller.locationController,
              hint: 'Hyatt,Dehradun',
              iconPath: "assets/icons/Map Point.png",
            ),
          ],
        ),
      ),
    );
  }

  Widget decoratedTextInput({
    required TextEditingController controller,
    required String hint,
    required String iconPath,
    double iconSize = 24,
    Color? iconColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: iconSize,
            height: iconSize,
            color: iconColor,
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              style: GoogleFonts.poppins(color: Colors.white),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
