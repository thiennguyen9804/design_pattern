void runPrototype() {

}

abstract class Shape {
  int x, y;
  String color;

  Shape(this.x, this.y, this.color);

  Shape.from(Shape source)
      : x = source.x,
        y = source.y,
        color = source.color;

  Shape clone();
}

class Rectangle extends Shape {
  final int _width, _height;

  Rectangle(super.x, super.y, super.color, this._width, this._height);
  Rectangle.from(Rectangle super.source) : _width = source._width, _height = source._height, super.from();
  @override
  Shape clone() {
    return Rectangle.from(this);
  }
}

class Circle extends Shape {
  late int radius;


  Circle(super.x, super.y, super.color, this.radius);

  Circle.from(Circle super.source) : radius = source.radius, super.from();

  @override
  Shape clone() {
    return Circle.from(this);
  }

}

class Application {
  Application() {
    var circle = Circle(0, 0, "red", 10);
    final anotherCircle = circle.clone();
  }
}








