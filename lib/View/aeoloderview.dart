import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:aeoloader/View/customviews.dart';


class AeoLoaderView extends StatefulWidget
{
  String loaderTitle;
  double loaderWidth;
  double loaderHeight;
  int animationTimeMS;
  double animationSpeed;
  int uicount;

  AeoLoaderView({
    Key key,
    @required this.loaderTitle,
    this.loaderWidth = 200.0,
    this.loaderHeight = 200.0,
    this.animationTimeMS = 5000,
    this.animationSpeed = 0.15,
    this.uicount = 4
  });


  @override
  _AeoLoaderState createState() => new _AeoLoaderState(loaderWidth: this.loaderWidth,loaderHeight: this.loaderHeight,loaderTitle: this.loaderTitle,animationSpeed: this.animationSpeed,animationTimeMS: this.animationTimeMS, uicount: this.uicount);
}


class _AeoLoaderState extends State<AeoLoaderView> with TickerProviderStateMixin
{
  String loaderTitle;
  double loaderWidth;
  double loaderHeight;
  int animationTimeMS;
  double animationSpeed;
  int uicount;

  _AeoLoaderState({
    Key key,
    @required this.loaderTitle,
    this.loaderWidth = 200.0,
    this.loaderHeight = 200.0,
    this.animationTimeMS = 5000,
    this.animationSpeed = 0.15,
    this.uicount = 4
  });


  List<Widget> createWidigetForAnimation()
  {
    // ARRAY TO HOLD ALL ANIMATED WIDGETS
    List<Widget>  widgets = [];
    // ANIMATION DRIVING VALUES
    final double as = this.animationSpeed;
    double initialSpeed = 0.0;

    // ANIMATION CLASSES
    Tween<double> t = new Tween<double>(begin: 0.0, end: 1.00);
    AnimationController _controller = new AnimationController(
      duration: Duration(milliseconds: this.animationTimeMS),
      vsync: this,
    );
    _controller.repeat().orCancel;

    for (var i = 0; i < 4; i++)
    {
      widgets.add(new ScaleCircle(controller: _controller,
          animation: t.animate(
            new CurvedAnimation(
              parent: _controller,
              curve: new Interval(
                initialSpeed,
                initialSpeed+as,
                curve: Curves.linear,
              ),
            ),
          ),
          size: 25.0));
      initialSpeed += as;
    }
    return widgets;
  }

  @override
  void initState()
  {
    super.initState();
  }

  @override
  dispose()
  {
    super.dispose();
  }


  @override
  Widget build(BuildContext context)
  {
    return new Container(
      width: this.loaderWidth,
      height: this.loaderHeight,

      child: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: createWidigetForAnimation(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Text(this.loaderTitle, style: new TextStyle(
                  color: Colors.orange,
                fontSize: 16.0,
                decoration: TextDecoration.none,
              ),),
            ),
          ],
        ),
      ),
    );
  }

}


