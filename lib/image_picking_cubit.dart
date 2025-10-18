import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_picking_state.dart';

class ImagePickingCubit extends Cubit<ImagePickingState> {
  ImagePickingCubit() : super(ImagePickingInitial());

  final ImagePicker picker = ImagePicker();
  final List<File> imageFiles = [];

  /// Pick one image from camera or gallery and add to list
  Future<void> acceptImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      final newImage = File(pickedFile.path);
      imageFiles.add(newImage);
      emit(ImagesUpdated(List<File>.from(imageFiles))); // emit copy of list
    }
  }

  /// Remove specific image by index
  void removeImageAt(int index) {
    if (index >= 0 && index < imageFiles.length) {
      imageFiles.removeAt(index);
      emit(ImagesUpdated(List<File>.from(imageFiles)));
    }
  }

  /// Clear all images
  void clearAllImages() {
    imageFiles.clear();
    emit(ImagesUpdated(List<File>.from(imageFiles)));
  }
}
