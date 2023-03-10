
import 'package:flutter/material.dart' hide Slider;
import 'package:social_app2/screens/sliders/slider.dart';

class SliderWidget extends StatelessWidget {
  Slider slider;
  SliderWidget(this.slider);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin:const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(13)),
                child: SizedBox(
                    width: double.infinity,
                    height: 170,
                    child: Image.network(
                      slider.imageUrl!,
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                  right: 15,
                  top: 10,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: () {}, icon:const Icon(Icons.delete)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.edit)),
                      ),
                    ],
                  ))
            ],
          ),
          Container(
            margin:const EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Slider Title' + ': ' + slider.title!,
                  ),
                  Text(
                    'Slider Url' + ': ' + slider.url!,
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}