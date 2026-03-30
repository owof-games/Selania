=== function grimoire_statusPlants(plant)

    {
        - greenhouse_findedCultivables ^ backpack_findedGifts hasnt plant:
            ~ return missing
        
        - else:
            ~ return owned
    }


=== function grimoire_statusSigils(sigilList)

    {
        - glyph_aetherFireSigils ^ glyph_actualActiveSigil has sigilList:
            ~ return true
        
        - else:
            ~ return false
    }    