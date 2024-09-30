import 'services/api_service.dart';
import 'models/place.dart';

void main() async {
  print('Fetching places...');
  
  try {
    List<Place> places = await ApiService.fetchPlaces();
    print('Successfully fetched places:');
    for (Place place in places) {
      print(place);
    }
  } catch (e) {
    print('Error fetching places: $e');
  }
}
