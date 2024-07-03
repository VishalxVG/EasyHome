import 'package:easyhome/consts/app_image.dart';
import 'package:easyhome/views/pages/profile_page.dart';
import 'package:flutter/material.dart';

SliverAppBar customAppBar(BuildContext context) {
  return SliverAppBar(
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage(AppImage.PROFILEIMAGE),
        ),
      )
    ],
    backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 50,
        ),
        const Text(
          "Overview: ",
          style: TextStyle(fontSize: 20),
        ),
        TextButton(
          onPressed: () {},
          child: const Row(
            children: [
              Text("My House"),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ],
    ),
    centerTitle: true,
    pinned: true,
    floating: true,
    expandedHeight: 100.0,
    flexibleSpace: const FlexibleSpaceBar(),
    bottom: const TabBar(
      tabs: [
        Tab(text: 'SPENDING'),
        Tab(text: 'TRANSACTIONS'),
      ],
    ),
  );
}

PreferredSizeWidget mainPageAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size(400, 70),
    child: Container(
      height: 60,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile
          ProfileCompletionIndicator(
            imageUrl: AppImage.PROFILEIMAGE,
            completionPercentage: 0.78,
            ontap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProfilePage(),
            )),
          ),

          // Welcome Text
          Container(
            margin: const EdgeInsets.only(right: 70),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hello Vishal Ghosh"),
                Text("Welcome Back"),
              ],
            ),
          ),

          // Notification Icons + Message Icon
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

class ProfileCompletionIndicator extends StatelessWidget {
  final String imageUrl;
  final double completionPercentage;
  void Function()? ontap;

  ProfileCompletionIndicator(
      {super.key,
      required this.imageUrl,
      required this.completionPercentage,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: double.maxFinite,
        margin: const EdgeInsets.only(left: 10, top: 10),
        child: Stack(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                value: completionPercentage,
                strokeWidth: 10,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(
                  completionPercentage < 0.5
                      ? Colors.red
                      : (completionPercentage < 0.7
                          ? Colors.yellow
                          : Colors.green),
                ),
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: Image.asset(imageUrl).image,
            ),
            //
            Positioned(
              top: 32,
              left: 7,
              child: Container(
                width: 25,
                height: 14,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 196, 212, 238),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${(completionPercentage * 100).toInt()}%',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
