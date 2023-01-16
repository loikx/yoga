import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants.dart';

class TilesList extends StatefulWidget {
  const TilesList({required this.names, Key? key}) : super(key: key);

  final List<String> names;

  @override
  State<TilesList> createState() => _TilesListState();
}

class _TilesListState extends State<TilesList> {
  final List<bool> _isSelected = <bool>[];

  @override
  void initState() {
    super.initState();

    for (var _ in widget.names) {
      _isSelected.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _createTiles(size),
    );
  }

  List<Widget> _createTiles(Size size) {
    return List.generate(
      widget.names.length,
      (index) => GestureDetector(
        onTap: () {
          setState(() {
            for (int i = 0; i < _isSelected.length; i++) {
              _isSelected[i] = false;
            }
            _isSelected[index] = true;
          });
        },
        child: Padding(
          padding: EdgeInsets.all(defaultPadding / 4),
          child: Container(
              child: Center(
                child: Text(
                  widget.names[index],
                  style: GoogleFonts.roboto(
                    fontSize: defaultTextSize * 1.25,
                    color: _getColor(_isSelected[index]),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPadding * 4),
                border: Border.all(
                  color: _getColor(_isSelected[index]),
                  width: defaultPadding / 10,
                ),
              ),
              width: size.width * 0.85,
              height: size.height * 0.06),
        ),
      ),
    );
  }

  Color _getColor(bool isSelected) {
    return isSelected ? primaryColor : darkColor.withOpacity(0.5);
  }
}
