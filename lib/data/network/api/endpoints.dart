//Endpointi koji nam koriste da nas app zna koji URL treba loviti, movies za dio koji trebamo dobiti sa servera

class Endpoints {
  Endpoints._();

  static const String baseUrl = "https://api.themoviedb.org/3/";

  static const int recieveTimeout = 150000;

  static const int connectionTimeout = 15000;

  static const String movies = '/movie';
}
