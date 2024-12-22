abstract class Button {
  void onClick();
  void render();
}

class WindowsButton implements Button {
  @override
  void onClick() {
    print("Bind a native OS click event");
  }

  @override
  void render() {
    print("Render a button in Windows style");
  }
}

class HtmlButton implements Button {
  @override
  void onClick() {
    print("Bind a web browser click event");
  }

  @override
  void render() {
    print("Return an HTML representation of a button");
  }
}

abstract class Dialog {
  Button createButton();

  void render() {
    Button button = createButton();
    button.onClick();
    button.render();
  }
}

class WindowsDialog extends Dialog {
  @override
  Button createButton() {
    return WindowsButton();
  }
}

class HtmlDialog extends Dialog {
  @override
  Button createButton() {
    return HtmlButton();
  }
}

class Application {
  late final Dialog dialog;

  Application() {
    const String os = "Windows";
    if (os == "Windows") {
      dialog = WindowsDialog();
    } else if (os == "Html") {
      dialog = HtmlDialog();
    } else {
      throw Exception("Unknown OS");
    }

    dialog.render();
  }
}

void runFactoryMethod() {
  Application();
}

