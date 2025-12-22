import 'package:flutter/material.dart';
import 'package:parafeed/common/app_button.dart';

import '../sign_up.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // COVER + AVATAR
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 160,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1585829365295-ab7cd400c167?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: 32,
                  child: CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 33,
                      backgroundImage: const NetworkImage(
                        "https://i.pinimg.com/1200x/47/0f/a8/470fa8ecdf5bb4efbedc3e05751bfa17.jpg",
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // NAME + EDIT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Kaushal Mistry",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "kaushal_14",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Edit Profile"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // FOLLOWING / INTERESTS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Text(
                    "30 ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Following"),
                  SizedBox(width: 16),
                  Text(
                    "5 ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Interests topics"),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // OPTIONS
            ProfileOption(
              icon: Icons.menu_book_outlined,
              title: "Interests Topics",
              onTap: () {},
            ),
            ProfileOption(
              icon: Icons.lock_outline,
              title: "Change Password",
              onTap: () {},
            ),
            ProfileOption(
              icon: Icons.language,
              title: "Language",
              onTap: () {},
            ),

            const SizedBox(height: 24),

            // LOGOUT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: AppButton(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                  }, btnText: "Log Out", isOutline: true,),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.black),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}