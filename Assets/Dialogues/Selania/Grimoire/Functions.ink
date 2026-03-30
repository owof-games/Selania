=== function grimoire_statusPlants(plant)

    {
        - greenhouse_findedCultivables ^ backpack_findedGifts hasnt plant:
            ~ return missing
        
        - else:
            ~ return owned
    }