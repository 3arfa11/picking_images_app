import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_picking_state.dart';

class ImagePickingCubit extends Cubit<ImagePickingState> {
  ImagePickingCubit() : super(ImagePickingInitial());
  File? imageFile;
  final picker = ImagePicker();

  Future<void> acceptImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      emit(ImagePicked(pickedFile.path));
    }
  }

  removeImage() {
    imageFile = null;
    emit(ImageRemoved());
  }
}
