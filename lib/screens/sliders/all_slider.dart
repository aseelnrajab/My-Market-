import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/screens/sliders/slider_widget.dart';

import '../../Routers/app_router.dart';
import '../../providers/admin_provider.dart';
import 'add_new_slider.dart';

class AllSliderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('All Sliders'),
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewSliderScreen());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Consumer<AdminProvider>(
        builder: (context, provider, u) {
          return provider.allSliders == null
              ? const Center(
                  child: Text('No Slider'),
                )
              : provider.allSliders!.isEmpty
                  ? const Center(
                      child: Text('No Sliders Found'),
                    )
                  : ListView.builder(
                      itemCount: provider.allSliders!.length,
                      itemBuilder: (context, index) {
                        return SliderWidget(provider.allSliders![index]);
                      });
        },
      ),
    );
  }
}
