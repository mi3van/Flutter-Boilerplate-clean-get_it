import 'package:clean_boilerplate/domain/common/exception/common_input_value_exception.dart';
import 'package:clean_boilerplate/domain/contract/interactor/geocode_interactor_mixin.dart';
import 'package:clean_boilerplate/service_locator.dart';

class GeocodeInteractor with GeocodeInteractorMixin {
  late final _controller = iLocator.geocodeController;
  late final _repository = iLocator.geocodeRepository;

  @override
  Future<void> updateCurrentAddress(
      {required double? latitude, required double? longitude}) async {
    try {
      _controller.showAddressLoader();

      if (latitude == null || longitude == null) {
        throw (CommonInputValueException());
      }
      final address = await _repository.getAddress(
        latitude: latitude,
        longitude: longitude,
      );
      _controller.setAddress(address);
    } on Exception catch (ex) {
      iLocator.appAlertController.showExceptionAlert(ex);
    } finally {
      _controller.hideAddressLoader();
    }
  }
}
