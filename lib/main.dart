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

  @override
  void initState() {
    super.initState();
    _textController.text = 'Tap to edit';
    // _textController.addListener(_printLatestValue);
  }

  // _printLatestValue() {
  //   print("Second text field: ${_textController.text}");
  // }

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
      onTap: () => setState(() => isEdit = !isEdit),
      child: Scaffold(
        backgroundColor: _colorList[_selectedBGColor],
        body: Stack(
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
                        autofocus: true,
                        textAlign: TextAlign.center,
                        controller: _textController,
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                        decoration: InputDecoration(
                            fillColor: Colors.white, border: InputBorder.none),
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
              SafeArea(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    FlatButton(
                        minWidth: 10,
                        onPressed: _changeColor,
                        child:
                            //   Text('Color',
                            //       style: TextStyle(
                            //           color: _colorList[_selectedColor],
                            //           fontSize: 16.0)),
                            // )
                            Icon(
                          Icons.color_lens_outlined,
                          color: _colorList[_selectedColor],
                          size: 30.0,
                        )),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          '${_textController.text}',
                          textScaleFactor: _scaleFactor,
                          style: TextStyle(color: _colorList[_selectedColor]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
