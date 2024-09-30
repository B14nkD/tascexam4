import 'package:flutter/material.dart';
import '../models/place.dart';
import '../services/api_service.dart';
import '../widgets/place_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Destinations'),
      ),
      body: FutureBuilder<List<Place>>(
        future: ApiService.fetchPlaces(),  // Gọi API để lấy dữ liệu
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());  // Hiển thị vòng tròn chờ
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));  // Hiển thị lỗi
          } else {
            final places = snapshot.data;  // Lấy dữ liệu
            return ListView.builder(
              itemCount: places?.length ?? 0,
              itemBuilder: (context, index) {
                return PlaceItem(place: places![index]);  // Hiển thị danh sách địa điểm
              },
            );
          }
        },
      ),
    );
  }
}
