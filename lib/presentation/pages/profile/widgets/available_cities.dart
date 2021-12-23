import 'package:caupe_custumer/domain/entities/city_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/theme.dart';
import '../../../../data/models/models.dart';

class AvailableCities extends StatefulWidget {
  final List<CityEntity> cities;
  final List<CityEntity>? initialCities;
  final Function(CityEntity) onCity;
  final Function(CityEntity) onDeleteCity;

  const AvailableCities({
    Key? key,
    required this.initialCities,
    required this.cities,
    required this.onDeleteCity,
    required this.onCity,
  }) : super(key: key);

  @override
  _AvailableCitiesState createState() => _AvailableCitiesState();
}

class _AvailableCitiesState extends State<AvailableCities> {
  late List<CityEntity> cities;
  @override
  void initState() {
    cities = widget.initialCities ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GridView.builder(
        itemCount: widget.cities.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 60,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (_, index) => CityButton(
          onCity: (city) {
            setState(() {
              final containsCity = cities
                  .where((element) => element.guid == widget.cities[index].guid)
                  .toList();
              if (containsCity.length > 0) {
                cities.removeWhere(
                    (element) => element.guid == widget.cities[index].guid);
                widget.onDeleteCity(containsCity.first);
              } else {
                cities.add(city);
                widget.onCity(city);
              }
            });
          },
          code: widget.cities[index].code,
          guid: widget.cities[index].guid,
          address: widget.cities[index].address,
          city: widget.cities[index].city,
          isSelected: (cities.where(
                      (element) => element.guid == widget.cities[index].guid))
                  .length >
              0,
        ),
      ),
    );
  }
}

class CityButton extends StatelessWidget {
  final Function(CityModel) onCity;
  final String address;
  final String guid;
  final String code;
  final String city;
  final bool isSelected;
  const CityButton({
    Key? key,
    required this.guid,
    required this.onCity,
    required this.city,
    required this.code,
    required this.address,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          onCity(CityModel(address: city, guid: guid, city: city, code: code)),
      onLongPress: () => HapticFeedback.vibrate(),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: AppDefault.defaultBorderRadius(radius: 12),
          color: isSelected
              ? Theme.of(context).primaryColor
              : Colors.grey[800]?.withOpacity(0.5),
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInBack,
        child: Center(
          child: Text(
            address,
            style: AppTypography.t14().copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
