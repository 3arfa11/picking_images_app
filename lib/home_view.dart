import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picking_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ImagePickingCubit>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker Example')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<ImagePickingCubit, ImagePickingState>(
                builder: (context, state) {
                  if (cubit.imageFile != null) {
                    return Image.file(cubit.imageFile!);
                  } else {
                    return const Text('No image selected.');
                  }
                },
              ),
              const SizedBox(height: 20),
              Divider(
                height: 40,
                color: Colors.grey[400],
                thickness: 1,
                indent: 40,
                endIndent: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => BlocProvider.of<ImagePickingCubit>(
                          context,
                        ).acceptImage(ImageSource.camera),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 24,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Camera',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => BlocProvider.of<ImagePickingCubit>(
                          context,
                        ).acceptImage(ImageSource.gallery),
                        child: const Icon(
                          Icons.photo_camera_back_outlined,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Gallery',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                  // remove image button
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<ImagePickingCubit>(
                            context,
                          ).removeImage();
                        },
                        child: const Icon(
                          Icons.remove_circle_outline,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Remove',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
