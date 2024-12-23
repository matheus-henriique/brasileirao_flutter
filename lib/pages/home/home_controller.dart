import 'package:app_test_build/repositories/times_repository.dart';
import 'package:app_test_build/models/time.dart';

class HomeController {
  final TimesRepository _timesRepository = TimesRepository();
  List<Time> get tabela => _timesRepository.times;

  HomeController() {}
}