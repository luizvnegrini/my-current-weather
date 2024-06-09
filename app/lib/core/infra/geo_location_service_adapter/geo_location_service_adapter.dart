import 'dart:async';

import 'package:external_dependencies/external_dependencies.dart';

import '../../../domain/entities/entities.dart' as entities;

abstract class IGeoLocationServiceAdapter {
  Future<entities.Position> getCurrentPosition();
  Future<void> handlePermission();
}

class GeoLocationServiceImpl implements IGeoLocationServiceAdapter {
  late LocationPermission permission;

  Future<LocationPermission> get checkPermission =>
      Geolocator.checkPermission();

  @override
  Future<void> handlePermission() async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  @override
  Future<entities.Position> getCurrentPosition() async {
    await handlePermission();
    final permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true,
      );

      return entities.Position(
        altitude: position.altitude,
        latitude: position.latitude,
        heading: position.heading,
        longitude: position.longitude,
        speed: position.speed,
      );
    }

    return entities.Position(
      altitude: 30.37487301576242,
      latitude: -97.73875517798376,
      heading: 0,
      longitude: 0,
      speed: 0,
    );
  }
}
