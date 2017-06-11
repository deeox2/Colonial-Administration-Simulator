class randomEventManager {
  int randomEventCount = 9;
  int randomEasyEventCount = 4;
  String resultString, shipEventString;
  randomEventManager() {
  }

  void generateRandomEventNumber() {
    if (turn > 150) {
      eventNumber = int(random(1, randomEventCount+1));
    } else {
      eventNumber = int(random(1, randomEasyEventCount+1));
    }
  }

  void runEvent() {
        // 1-2 Gain Resources
        // 3-4 Lose Resources
    // 5 Gain Building
    // 6 Lose Building
      // 7 Gain All of a Resource
      // 8 Lose All of a Resource
    // 9 Take Ship Damage
    if (eventNumber == 1) {
      minerals += 100;
      resultString = "Gained Materials";
    } else if (eventNumber == 2) {
      energy += 100; 
      resultString = "Gained Energy";
    } else if (eventNumber == 3) {
      if (minerals > 100);
      minerals -= 100;
      resultString = "Lost Materials";
    } else if (eventNumber == 4) {
      if (energy > 100) {
        minerals -= 100;
      }
      resultString = "Lost Energy";
    } else if (eventNumber == 5) {
    } else if (eventNumber == 6) {
    } else if (eventNumber == 7) {
      minerals = mineralMax;
      energy = energyMax;
      resultString = "Gained Max Resources";
    } else if (eventNumber == 8) {
      minerals = 0;
      energy = 0;
      resultString = "Lost All Resources";
    } else if (eventNumber == 9) {
    }
  }

  void runShipEvent(int result) {
    if (result == 1) {
      int roll = int(random(1, 3));
      if (roll == 1) {
        minerals = mineralMax;
        shipEventString = "Gained Materials";
      } else {
        energy = energyMax; 
        shipEventString = "Gained Energy";
      }
    } else if (result == 2) {
    } else if (result == 3) {
    }
  }

  void displayNotification() {
    rectMode(CENTER);
    fill(WHITE);
    rect(width/2, height/2, width*2/3, width/6);
    rectMode(CORNER);
    rect(width/6, width*5/12, width/6, width/6);
    if (mouseX > width*2/3 && mouseX < width*5/6 && mouseY > 250 && mouseY < width/6) {
      fill(GREY);
    } else {
      fill(WHITE);
    }
    rect(width*2/3, width*5/12, width/6, width/6);
    textAlign(CENTER, CENTER);
    textSize(width*8/75);
    fill(BLACK);
    text("OK", width*3/4, width*59/120);
    textAlign(LEFT, CENTER);
    textSize(width/30);
    text("RANDOM EVENT!", width*205/600, width*270/600);
    text("Result: " + resultString, width*205/600, width*330/600);
  }

  void displayShipNotification() {
    rectMode(CENTER);
    fill(WHITE);
    rect(width/2, height/2, width*2/3, width/6);
    rectMode(CORNER);
    rect(width/6, width*5/12, width/6, width/6);
    if (mouseX > width*2/3 && mouseX < width*5/6 && mouseY > 250 && mouseY < width/6) {
      fill(GREY);
    } else {
      fill(WHITE);
    }
    rect(width*2/3, width*5/12, width/6, width/6);
    textAlign(CENTER, CENTER);
    textSize(width*8/75);
    fill(BLACK);
    text("OK", width*3/4, width*59/120);
    textAlign(LEFT, CENTER);
    textSize(width/30);
    text("MISSION SUCCESS!", width*205/600, width*270/600);
    text("Result:", width*205/600, width*330/600);
  }
}