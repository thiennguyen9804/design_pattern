void runBuilder() {
  Application().makeCar();
}

class Car {}

class Manual {}

abstract class Builder {
  void reset();
  void setSeats();
  void setEngine();
  void setTripComputer();
  void setGPS();
}

class CarBuilder implements Builder {
  late Car _car;
  CarBuilder() {
    reset();
  }
  @override
  void reset() {
    _car = Car();
  }

  @override
  void setEngine() {
    print("Install a given engine");
  }

  @override
  void setGPS() {
    print("Install a global positioning system");
  }

  @override
  void setSeats() {
    print("Set the number of seats in the car");
  }

  @override
  void setTripComputer() {
    print("Install a trip computer");
  }

  Car getProduct() {
    reset();
    print("Car is retrieved");
    return _car;
  }
}

class CarManualBuilder implements Builder {
  late Manual _manual;

  CarManualBuilder() {
    reset();
  }

  @override
  void reset() {
    _manual = Manual();
  }

  @override
  void setEngine() {
    print("Add engine instructions");
  }

  @override
  void setGPS() {
    print("Add GPS instructions");
  }

  @override
  void setSeats() {
    print("Document car seat features");
  }

  @override
  void setTripComputer() {
    print("Add trip computer instructions");
  }

  Manual getProduct() {
    reset();
    print("Manual is retrieved");
    return _manual;
  }
}

class Director {
  late Builder _builder;
  void setBuilder(Builder builder) {
    _builder = builder;
  }

  void constructSportsCar(Builder builder) {
    print("Start constructing sports car...");
    builder.reset();
    builder.setSeats();
    builder.setTripComputer();
    builder.setGPS();
    builder.setEngine();
    print("Sports car is built");
  }

  void constructSUV(Builder builder) {
    print("Start constructing SUV...");
    builder.reset();
    builder.setSeats();
    builder.setTripComputer();
    builder.setGPS();
    builder.setEngine();
    print("SUV is built");
  }

  void constructManual(Builder builder) {
    print("Start constructing manual...");
    builder.reset();
    builder.setSeats();
    builder.setTripComputer();
    builder.setGPS();
    builder.setEngine();
    print("Manual is built");
  }
}

class Application {
  void makeCar() {
    final director = Director();
    final carBuilder = CarBuilder();
    final manualBuilder = CarManualBuilder();
    director.constructSportsCar(carBuilder);
    final sportCar = carBuilder.getProduct();
    director.constructSUV(carBuilder);
    final suv = carBuilder.getProduct();
    director.constructManual(manualBuilder);
    final manual = manualBuilder.getProduct();
  }
}
