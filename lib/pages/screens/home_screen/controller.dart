
import 'package:get/get.dart';
import 'package:tours_guide/pages/screens/home_screen/state.dart';
// import 'package:geocoding/geocoding.dart';


class HomeController extends GetxController {


  final state = HomeState();
  // Location location = Location();



  late final List<String> category;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    //
    // location.onLocationChanged.listen((LocationData currentLocation) {
    //   state.currentLocation.value = LatLng(currentLocation.latitude!.toDouble(),
    //       currentLocation.longitude!.toDouble());


    category = [
      'Best Places' ,
      'Most Visited' ,
      'Favourites' ,
      'Hotels' ,
      'New Added' ,
      'Restaurants' ,
    ];

  }




}
