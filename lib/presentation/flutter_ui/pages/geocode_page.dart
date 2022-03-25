import 'package:clean_boilerplate/presentation/contract/model_controller/geocode_model_controller_mixin.dart';
import 'package:clean_boilerplate/presentation/flutter_ui/pages/abstract_bottom_page.dart';
import 'package:clean_boilerplate/presentation/flutter_ui/widgets/home_divider.dart';
import 'package:clean_boilerplate/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

const _geocodeKeyboardType = TextInputType.numberWithOptions(
  decimal: true,
  signed: true,
);

class GeocodePage extends BottomPage {
  GeocodePage({Key? key}) : super(key: key);

  final _latController = TextEditingController();
  final _lngController = TextEditingController();

  @override
  Widget getBuild(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            _rowInput(),
            const HomeDivider(),
            _GetAddressButton(
              latController: _latController,
              lngController: _lngController,
            ),
            const HomeDivider(),
            _AddressInfo(),
          ],
        ),
      ),
    );
  }

  Widget _rowInput() => Row(children: [
        Expanded(
          child: TextField(
            controller: _latController,
            keyboardType: _geocodeKeyboardType,
            decoration: const InputDecoration(hintText: 'Latitude'),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: _lngController,
            keyboardType: _geocodeKeyboardType,
            decoration: const InputDecoration(hintText: 'Longitude'),
          ),
        ),
      ]);
}

class _GetAddressButton extends StatelessWidget with GetItMixin {
  final TextEditingController latController;
  final TextEditingController lngController;

  _GetAddressButton(
      {Key? key, required this.latController, required this.lngController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isShowAddressLoader = watchX(
        (GeocodeModelControllerMixin model) => model.isShowAddressLoader);

    if (isShowAddressLoader) {
      return const Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
          height: 30.0,
          width: 30.0,
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: _getAddressAction,
        child: const Text('Get address'),
      );
    }
  }

  void _getAddressAction() {
    final lat = double.tryParse(latController.text);
    final lng = double.tryParse(lngController.text);

    uiLocator.geocodeMC.updateCurrentAddress(latitude: lat, longitude: lng);
  }
}

class _AddressInfo extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    final address =
        watchX((GeocodeModelControllerMixin model) => model.savedAddress);

    if (address == null) {
      return const SizedBox.shrink();
    }

    return Text(
      'Result:\n'
      '${address.houseNumber != null ? 'House number: ${address.houseNumber}\n' : ''}'
      '${address.road != null ? 'Road: ${address.road}\n' : ''}'
      '${address.village != null ? 'Village: ${address.village}\n' : ''}'
      '${address.stateDistrict != null ? 'State district: ${address.stateDistrict}\n' : ''}'
      '${address.state != null ? 'State: ${address.state}\n' : ''}'
      '${address.town != null ? 'Town: ${address.town}\n' : ''}'
      '${address.county != null ? 'County: ${address.county}\n' : ''}'
      '${address.city != null ? 'City: ${address.city}\n' : ''}'
      '${address.postcode != null ? 'Postcode: ${address.postcode}\n' : ''}'
      '${address.country != null ? 'Country: ${address.country}\n' : ''}'
      '${address.countryCode != null ? 'Country code: ${address.countryCode}' : ''}',
    );
  }
}
