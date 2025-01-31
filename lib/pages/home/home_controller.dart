import 'package:app_test_build/repositories/times_repository.dart';
import 'package:app_test_build/models/time.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeController {
  final TimesRepository _timesRepository = TimesRepository();
  RxList get tabela => _timesRepository.times;

  HomeController() {}
}