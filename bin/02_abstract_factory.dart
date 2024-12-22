abstract class Button {
  void paint();
}

class MacButton implements Button {
  @override
  void paint() {
    print("Render a button in macOS style");
  }
}

class WinButton implements Button {
  WinButton();

  @override
  void paint() {
    print("Render a button in Windows style");
  }
}

abstract class CheckBox {
  void paint();
}

class WinCheckBox implements CheckBox {
  WinCheckBox();

  @override
  void paint() {
    print("Render a checkbox in Windows style");
  }
}

class MacCheckBox implements CheckBox {
  @override
  void paint() {
    print("Render a checkbox in macOS style");
  }
}

abstract class GUIFactory {
  Button createButton();
  CheckBox createCheckBox();
}

class WinFactory implements GUIFactory {
  @override
  Button createButton() {
    return WinButton();
  }

  @override
  CheckBox createCheckBox() {
    return WinCheckBox();
  }
}

class MacFactory implements GUIFactory {
  @override
  Button createButton() {
    return MacButton();
  }

  @override
  CheckBox createCheckBox() {
    return MacCheckBox();
  }
}

class Application {
  late final Button button;
  final GUIFactory factory;

  Application(this.factory);

  void createUI() {
    button = factory.createButton();
  }

  void paint() {
    button.paint();
  }
}

void runAbstractFactory() {
  GUIFactory factory;
  const String os = "MacOS";
  if (os == "Windows") {
    factory = WinFactory();
  } else if (os == "MacOS") {
    factory = MacFactory();
  } else {
    throw Exception("Unknown OS");
  }

  Application app = Application(factory);
  app.createUI();
  app.paint();
}

