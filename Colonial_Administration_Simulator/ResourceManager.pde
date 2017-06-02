class resourceManager {
  resourceManager() {
  }


  void updateResources() {
    // Applies increases and checks for a game over.
    // Also ensures resources do not go over their maxes.

    food = food + foodIncrease;
    minerals = minerals + mineralIncrease;
    energy = energy + energyIncrease;
    research = researchIncrease;

    if (food > 100 && foodIncrease > 10) {
      pops++;
      food = food - 100;
    } else if (food < 100 && foodIncrease < 10 && pops > 10) {
      pops--;
    }

    if (food < 0 || energy < 0 || minerals < 0) {
      state = 2;
    }

    if (food > foodMax) {
      food = foodMax;
    }
    if (energy > energyMax) {
      energy = energyMax;
    }
    if (minerals > mineralMax) {
      minerals = mineralMax;
    }
  }

  void updateResourceIncreases() {
    // Checks for the increase and the tax of each resource.
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        buildingGrid[i][j].tileUpdate();
      }
    }


    updateFoodIncreases();
    updateMineralIncreases();
    updatePowerIncreases();
    updateResearchIncreases();
  }

  void updateFoodIncreases() {
    foodIncrease = getBuildingFoodIncrease();

    foodTax = getFoodTax();
    foodIncrease = foodIncrease - foodTax;

    foodMax = getFoodMax();
  }

  void updateMineralIncreases() {
    mineralIncrease = getBuildingMineralIncrease() + getPopMineralIncrease();

    mineralTax = getMineralTax();

    mineralResearchBonus = getResearchMineralIncrease();

    mineralIncrease = mineralIncrease + int(mineralResearchBonus) - mineralTax;

    mineralMax = getMineralMax();
  }

  void updatePowerIncreases() {

    energyIncrease = getBuildingEnergyIncrease() + getPopEnergyIncrease();

    energyTax = getEnergyTax();

    energyResearchBonus = getResearchEnergyIncrease();

    energyIncrease = energyIncrease + int(energyResearchBonus) - energyTax;

    energyMax = getEnergyMax();
  }

  void updateResearchIncreases() {
    researchIncrease = getResearchValue();
  }

  // Energy Functions

  int getBuildingEnergyIncrease() {
    int bei = 0;

    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        bei += buildingGrid[i][j].powerValue;
      }
    }
    return bei;
  }

  int getPopEnergyIncrease() {
    return (getBuildingEnergyIncrease() * pops/3) - getBuildingEnergyIncrease();
  }

  int getResearchEnergyIncrease() {
    return int((getBuildingEnergyIncrease() * researchTracks[4].bonus) - getBuildingEnergyIncrease());
  }

  int getEnergyTax() {
    int et = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].tileType != 0 && buildingGrid[i][j].tileType != 3) {
          et++;
        }
        if (buildingGrid[i][j].tileLevel == 3) {
          et++;
        }
      }
    }
    return et;
  }

  int getEnergyMax() {
    int em = energyIncrease * 10;

    if (em < 100) {
      em = 100;
    }
    return em;
  }

  // Mineral Functions

  int getBuildingMineralIncrease() {
    int bmi = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        bmi += buildingGrid[i][j].mineralValue;
      }
    }
    return bmi;
  }

  int getPopMineralIncrease() {
    return (getBuildingMineralIncrease() * pops/3) - getBuildingMineralIncrease();
  }

  int getResearchMineralIncrease() {
    return int((getBuildingMineralIncrease() * researchTracks[3].bonus) - getBuildingMineralIncrease());
  }

  int getMineralTax() {
    int mt = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].tileType != 0) {
          mt++;
        }
      }
    }
    return mt;
  }

  int getMineralMax() {

    int mm = mineralIncrease * 10 + getNoOfBuildings() * 5;

    if (mm < 100) {
      mm = 100;
    }
    return mm;
  }

  // Food Functions

  int getBuildingFoodIncrease() {
    int bfi = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        bfi += buildingGrid[i][j].foodValue;
      }
    }
    return bfi;
  }

  int getFoodTax() {
    int ft = pops;
    return ft;
  }

  int getFoodMax() {
    int fm = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].tileType == 1) {
          fm++;
        }
      }
    }
    fm = fm * 10;

    if (fm < 0) {
      fm = 10;
    }
    return fm;
  }

  // Research Functions

  int getResearchValue() {
    int ri = 0;

    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        ri += buildingGrid[i][j].researchValue;
      }
    }
    return ri;
  }

  // Number of Buildings Function

  int getNoOfBuildings() {
    int noOfBuildings = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].tileType != 0) {
          noOfBuildings++;
        }
      }
    }
    return noOfBuildings;
  }
}