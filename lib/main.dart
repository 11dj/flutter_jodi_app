import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jodi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Jodi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();
  var _colorList = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];
  int _selectedColor = 1;
  int _selectedBGColor = 0;
  double _scaleFactor = 2.0;
  double _baseScaleFactor = 1.0;
  bool isEdit = false;
  int _selectedRotate = 0;
  String initText = 'Tap to edit';

  @override
  void initState() {
    super.initState();
    _textController.text = initText;
  }

  void _changeColor() {
    setState(() {
      _selectedBGColor = (_selectedBGColor + 1) % (_colorList.length);
    });
    setState(() {
      if (_selectedColor == 0)
        _selectedColor = 1;
      else
        _selectedColor = 0;
    });
  }

  void _changeRotate() {
    setState(() {
      if (_selectedRotate == 0)
        _selectedRotate = 1;
      else
        _selectedRotate = 0;
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (scaleDetails) {
        _baseScaleFactor = _scaleFactor;
      },
      onScaleUpdate: (ScaleUpdateDetails scaleDetails) {
        setState(() {
          _scaleFactor = _baseScaleFactor * scaleDetails.scale;
        });
      },
      onTap: () {
        if (_textController.text == initText) _textController.text = '';
        setState(() => isEdit = !isEdit);
      },
      child: Scaffold(
        backgroundColor: _colorList[_selectedBGColor],
        body: SafeArea(
          child: Stack(
            children: [
              if (isEdit)
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0),
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          autofocus: true,
                          textAlign: TextAlign.center,
                          controller: _textController,
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                            onPressed: () => setState(() => isEdit = !isEdit),
                            child: Text('Done',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              if (!isEdit)
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                            minWidth: 10,
                            onPressed: _changeRotate,
                            child: Icon(
                              Icons.screen_rotation_outlined,
                              color:
                                  _colorList[_selectedColor].withOpacity(0.5),
                              size: 30.0,
                            )),
                        FlatButton(
                            minWidth: 10,
                            onPressed: _changeColor,
                            child: Icon(
                              Icons.color_lens_outlined,
                              color:
                                  _colorList[_selectedColor].withOpacity(0.5),
                              size: 30.0,
                            )),
                      ],
                    ),
                    RotatedBox(
                      quarterTurns: _selectedRotate,
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            '${_textController.text}',
                            textScaleFactor: _scaleFactor,
                            style: TextStyle(color: _colorList[_selectedColor]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
