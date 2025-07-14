import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_pages/Reusable/decoration_field_host_page.dart';
import 'package:profile_pages/Reusable/test_reusable_detail_host.dart';

class ToggleController extends GetxController {
  var isToggled = false.obs;

  void toggle() => isToggled.value = !isToggled.value;
}

class CapacityPage extends StatelessWidget {
  CapacityPage({super.key});
  final ToggleController controller = Get.put(ToggleController());

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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormLabel(
              "How many attendees and will it be free or paid?",
              fontSize: 22,
            ),
            SizedBox(height: 20),
            FormLabel("Capacity", fontSize: 16),
            DecoratedInput(
              hint: "00",
              iconPath: "assets/icons/Users Group Two Rounded.png",
            ),
            FormLabel("Free ticket", fontSize: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DecoratedInput(
                  hint: "Free",
                  iconPath: "assets/icons/Users Group Two Rounded.png",
                ),
                Obx(
                  () => Switch(
                    value: controller.isToggled.value,
                    onChanged: (value) => controller.toggle(),
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            textsmall(
              "Enable this if your event doesn’t require any payment from attendees. All ticket types will be free.",
            ),

            FormLabel("Stag", fontSize: 16),
            DecoratedInput(
              hint: "Price",
              iconPath: "assets/icons/Ticker Star.png",
            ),
            textsmall(
              "Use this to allow individual male guests to attend.You can leave this blank if it’s a women-only or couple-only event.",
            ),

            FormLabel("Women", fontSize: 16),
            DecoratedInput(
              hint: "Price",
              iconPath: "assets/icons/Ticker Star.png",
            ),
            textsmall(
              "Set this for women entry.or to make your event exclusively for women.",
            ),
            FormLabel("Couple", fontSize: 16),
            DecoratedInput(
              hint: "Price",
              iconPath: "assets/icons/Ticker Star.png",
            ),
            textsmall(
              "Set this for women entry.or to make your event exclusively for women.",
            ),
          ],
        ),
      ),
    );
  }

  Widget textsmall(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: Colors.grey,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
