import 'package:flutter/material.dart';
import 'package:joyn/constants.dart';

class TagSlider extends StatefulWidget {
  String name;
  int index;

  TagSlider(this.name, this.index);

  @override
  _TagSliderState createState() => _TagSliderState();
}

class _TagSliderState extends State<TagSlider> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    _value = kTagValues[widget.index];
    return Padding(
      padding: const EdgeInsets.only(bottom: kPostPadding),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.name + " - ",
                style: kDefault,
              ),
              Text(
                "$_value%",
                style: kDefault.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: kBlue,
              inactiveTrackColor: Colors.white,
              trackShape: CustomTrackShape(),
              trackHeight: 6.0,
              thumbColor: Colors.white,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
              overlayColor: kBlue.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
            ),
            child: Slider(
              min: 0,
              max: 100,
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = double.parse(value.toStringAsFixed(1));
                  kTagValues[widget.index] = _value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
