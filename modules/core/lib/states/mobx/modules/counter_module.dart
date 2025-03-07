import 'package:mobx/mobx.dart';
import 'package:base_module/interfaces/state_interfaces/counter_module_interface.dart';
import 'package:base_module/interfaces/state_interfaces/counter_store_interface.dart';
import 'package:base_module/interfaces/service_interfaces/counter_service_interface.dart';

import '/DI/service_locator.dart';
import '/states/mobx/stores/counter_store.dart';

part 'counter_module.g.dart';

class CounterModule = CounterModuleBase with _$CounterModule;

abstract class CounterModuleBase with Store implements CounterModuleInterface {
  CounterModuleBase(ServiceLocator serviceLocator)
      : _serviceLocator = serviceLocator;

  final ServiceLocator _serviceLocator;

  CounterStore? _counterStore;

  // singleton pattern + lazy conecept using getter, so store is created only when needed
  @override
  CounterStoreInterface get counterStore {
    _counterStore ??=
        CounterStore(_serviceLocator.get<CounterServiceInterface>());
    return _counterStore!;
  }
}
