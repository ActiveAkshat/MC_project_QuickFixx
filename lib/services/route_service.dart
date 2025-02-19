import 'package:latlong2/latlong.dart';

class RouteService {
  // Simulating a route between service provider & user
  List<LatLng> getRoute(LatLng start, LatLng end) {
    return [
      start,
      LatLng((start.latitude + end.latitude) / 2, (start.longitude + end.longitude) / 2),
      end
    ];
  }
}
