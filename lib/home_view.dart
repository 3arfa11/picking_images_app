import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picking_cubit.dart';
import 'image_preview_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ImagePickingCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Picker Example',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              BlocBuilder<ImagePickingCubit, ImagePickingState>(
                builder: (context, state) {
                  if (cubit.imageFiles.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('No images selected.'),
                    );
                  }
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height / 1.45,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: cubit.imageFiles.length,
                      itemBuilder: (context, index) {
                        final file = cubit.imageFiles[index];
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        ImagePreviewPage(imageFile: file),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 4.0,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),

                                  child: FittedBox(
                                    child: Image.file(file, fit: BoxFit.none),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: InkWell(
                                onTap: () => cubit.removeImageAt(index),
                                child: const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.close,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),

              Divider(
                height: 80,
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
                          ).clearAllImages();
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
