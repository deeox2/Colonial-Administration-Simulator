class gameManager {

  gameManager() {
  }

  void handleGameState() {
    background(255);
    // Title Screen
    if (state == 0) {
      titleMenu.displayMenu();
    } 
    // Game
    else if (state == 1) {
      gmf.displayMenu();
      turMan.updateResourceIncreases();
      if (gmf.displayResearchMenu == true) {
        researchMenu.displayMenu();
      }
      if (gmf.displayConstructionMenu == true) {   
        constructionMenu.displayMenu();
      }
    } 
    // Loss Screen
    else if (state == 2) {
      gmf.loseScreen();
    }
  }

  void handleMouseClick() {
    if (state == 0) {
      titleMenu.menuClick();
    } else if (state == 1) {
      gmf.menuClick();
      constructionMenu.menuClick();
      researchMenu.menuClick();
    }
  }

  void handleKeyPress() {
    if (state == 1) {
      gmf.menuPress();
    }
    if (key == 't') {
      println(food);
    }
  }
}