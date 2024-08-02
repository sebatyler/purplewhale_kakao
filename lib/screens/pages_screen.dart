import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purplewhale/enums.dart';
import 'package:purplewhale/services/page_service.dart';
import '../controllers/pages_controller.dart';
import '../services/auth_service.dart';

class PagesScreen extends StatelessWidget {
  final AuthService _authService = Get.find();
  final _controller = Get.put(PagesController());
  final pages = Get.find<PageService>().pages;

  PagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pages Screen')),
      body: SingleChildScrollView(
        child: Center(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("User auth token: ${_controller.authToken}"),
                Text("Provider: ${_controller.authProvider?.label}"),
                TextButton(
                  onPressed: () => _authService.signOut(),
                  child: const Text('Logout'),
                ),
                const SizedBox(height: 20.0),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: pages
                      .map(
                        (page) => SizedBox(
                          height: 30.0,
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () => Get.toNamed(page.name),
                            child: Text(
                              page.name,
                              style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
