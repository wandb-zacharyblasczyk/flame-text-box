import 'package:flame/anchor.dart';
import 'package:flame/components/text_box_component.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/game/game_widget.dart';
import 'package:flame/palette.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
    GameWidget(
      game: BoxCount(),
    ),
  );
}

TextConfig regular = TextConfig(color: BasicPalette.white.color);
TextConfig tiny = regular.withFontSize(12.0);

class BoxCount extends BaseGame {

  //Shows in bottom left if render() and update() are commented out
  @override
  Future<void> onLoad() async {
    add(MyTextBox(
      'Example Text',
    )
      ..anchor = Anchor.bottomLeft
      ..y = size.y);
  }

  // Begin Scenario 1
  // Uncomment to break MyTextBox from onLoad()
  // @override
  // void update(double t) {
  //   // TODO: implement update
  // }
  // End Scenario 1


  // Begin Scenario 2
  // Uncomment to break MyTextBox from onLoad()
  // @override
  // void render(Canvas canvas) {
  //   // TODO: implement update
  // }
  // End Scenario 2


  // Begin Scenario 3
  // Uncomment to break MyTextBox from onLoad()
  // Draws green canvas
  // @override
  // void render(Canvas canvas) {
  //   // Green Screen
  //   Rect bgRect = Rect.fromLTWH(0, 0, size.x, size.y);
  //   Paint bgPaint = Paint();
  //   bgPaint.color = Color(0xff0ff000);
  //   canvas.drawRect(bgRect, bgPaint);
  // }
  // End Scenario 3 


  // Begin Scenario 4  
  // Uncomment to break MyTextBox from onLoad()
  // Draws green canvas No Text Box...
  // @override
  // void render(Canvas canvas) {
  //   // Green Screen
  //   Rect bgRect = Rect.fromLTWH(0, 0, size.x, size.y);
  //   Paint bgPaint = Paint();
  //   bgPaint.color = Color(0xff0ff000);
  //   canvas.drawRect(bgRect, bgPaint);
  //   // textbox test1 Not sure if this rendrers at all..
  //   add( 
  //     MyTextBox("Example Text")
  //     ..anchor = Anchor.topCenter
  //     ..x = size.x / 2
  //     ..y = 32.0
  //   );
  // }
  // End Scenario 4


  // Begin RScenario 5
  // Uncomment to break MyTextBox from onLoad()
  // Draws green canvas and Pink Text Box without words in upper left
  // void render(Canvas canvas) {
  //   // Green Screen
  //   Rect bgRect = Rect.fromLTWH(0, 0, size.x, size.y);
  //   Paint bgPaint = Paint();
  //   bgPaint.color = Color(0xff0ff000);
  //   canvas.drawRect(bgRect, bgPaint);
  //   // textbox test2
  //   MyTextBox mtb = MyTextBox("Example Text");
  //   mtb.drawBackground(canvas);
  //   // Draws in upper left hand corner, but no text.
  // }
  // End Scenario 5
}

class MyTextBox extends TextBoxComponent {
  MyTextBox(String text)
    : super(
      text,
      config: tiny,
      boxConfig: TextBoxConfig(
        timePerChar: 0.05,
        growingBox: true,
        margins: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      ),
    );

  @override
  void drawBackground(Canvas c) {
    final Rect rect = Rect.fromLTWH(0, 0, width, height);
    c.drawRect(rect, Paint()..color = const Color(0xFFFF00FF));
    final margin = boxConfig.margins;
    final Rect innerRect = Rect.fromLTWH(
      margin.left,
      margin.top,
      width - margin.horizontal,
      height - margin.vertical,
    );
    c.drawRect(
      innerRect,
      Paint()
        ..color = BasicPalette.white.color
        ..style = PaintingStyle.stroke
    );
  }
}