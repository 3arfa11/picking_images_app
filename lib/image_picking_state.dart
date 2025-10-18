part of 'image_picking_cubit.dart';

@immutable
sealed class ImagePickingState {}

final class ImagePickingInitial extends ImagePickingState {}

final class ImagePicked extends ImagePickingState {
  final String imagePath;

  ImagePicked(this.imagePath);
}

class ImagesUpdated extends ImagePickingState {
  final List<File> images;
  ImagesUpdated(this.images);
}

final class ImageRemoved extends ImagePickingState {}
