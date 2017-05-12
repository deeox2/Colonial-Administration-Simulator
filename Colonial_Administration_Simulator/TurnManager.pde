class turnManager {
  turnManager() {
  }

  void updateResources() {
    pops = pops + popIncrease;
    popIncrease = 0;

    food = food + foodIncrease;
    minerals = minerals + mineralIncrease;
    energy = energy + energyIncrease;

    if (food > 100) {
      pops++;
      food = food - 100;
    }

    if (food < 0 || energy < 0 || minerals < 0) {
      state = 2;
    }
  }

  void updateResourceIncreases() {
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        buildingGrid[i][j].tileUpdate();
      }
    }

    mineralIncrease = 0;
    energyIncrease = 0;
    foodIncrease = 0;

    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        mineralIncrease += buildingGrid[i][j].mineralValue;
        energyIncrease += buildingGrid[i][j].powerValue;
        foodIncrease += buildingGrid[i][j].foodValue;
      }
    }

    mineralTax = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].tileType != 0) {
          mineralTax++;
        }
      }
    }

    energyTax = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].tileType != 0) {
          energyTax++;
        }
      }
    }

    foodTax = pops;

    mineralIncrease = mineralIncrease - mineralTax;
    energyIncrease = energyIncrease - energyTax;
    foodIncrease = foodIncrease - foodTax;
  }

  void processConstruction() {
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].buildTime > 0) {
          buildingGrid[i][j].buildTime--;
        }
      }
    }
  }

  void advanceTurn() {
    turn++;
    updateResources();
    processConstruction();
  }

  void setupBaseGame() {
    pops = 3;
    food = 10;
    minerals = 100;
    energy = 100;

    buildingGrid[0][0].tileType = 1;
    buildingGrid[4][2].tileType = 2;
    buildingGrid[0][2].tileType = 3;
    buildingGrid[4][0].tileType = 4;
  }
}