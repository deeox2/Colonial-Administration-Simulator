class turnManager {
  turnManager() {
    pops = 1;
    food = 10;
    minerals = 100;
    energy = 100;
  }

  void updateResources() {
    pops = pops + popIncrease;
    popIncrease = 0;

    food = food + foodIncrease;
    minerals = minerals + mineralIncrease;
    energy = energy + energyIncrease;
  }

  void updateResourceIncreases() {
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        buildingGrid[i][j].tileUpdate();
      }
    }
  }

  void advanceTurn() {
    turn++;
    updateResources();
  }

  void setupBaseGame() {
    pops = 1;
    food = 10;
    minerals = 100;
    energy = 100;

    buildingGrid[0][0].tileType = 1;
    buildingGrid[4][2].tileType = 2;
    buildingGrid[0][2].tileType = 3;
    buildingGrid[4][0].tileType = 4;

  }
}