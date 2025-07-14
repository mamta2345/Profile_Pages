import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_pages/Controller/Host_Pages/detail_controller.dart';
import 'package:profile_pages/Reusable/decoration_field_host_page.dart';
import 'package:profile_pages/Reusable/test_reusable_detail_host.dart';

class EventFormPage extends StatelessWidget {
  final controller = Get.put(EventFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back(); // Go back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Get.offAllNamed('/home'); // Or navigate to main screen directly
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormLabel("Event Title", fontSize: 16),
            inputField(controller.titleController, 'Friday Game Night'),
            FormLabel("Description", fontSize: 16),
            inputField(
              controller.descriptionController,
              'What will happen at your event?',
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
              hint: '00:00',
              iconPath: 'assets/icons/Hourglass.png',
            ),
            decoratedTextInput(
              controller: controller.durationController,
              hint: '00:00',
              iconPath: 'assets/icons/Hourglass.png',
            ),
            FormLabel("Loaction", fontSize: 16),
            decoratedTextInput(
              controller: controller.locationController,
              hint: 'Add venue',
              iconPath: "assets/icons/Map Point.png",
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget inputField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          color: Colors.white54,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: Color(0xFF1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
              style: TextStyle(color: Colors.white),
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
