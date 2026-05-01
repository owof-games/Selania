/***********************************

    Funzioni per pagine personagge

***********************************/
//Per le descrizioni delle personagge
=== function grimoire_characterDescription(PNG)
{PNG:
    - FirstCharacter:
        {   
            - grimoire_firstChar hasnt grimFirstCharTwo:
                ~ return ""

            - firstChar_ActualName has Chitarra:
                ~ return "Una ragazza in cerca della sua melodia"

            - firstChar_ActualName has Triangolo:
                ~ return "Ha ritrovato il bello nelle cose quotidiane"

            - firstChar_ActualName has Orchestra:
                ~ return "Ha abbracciato la gioia del cambiamento" 

            - firstChar_ActualName has FlautoDolce:
                ~ return "Vive la musica come cambiamento"

            - firstChar_ActualName has Ocarina:
                ~ return "Ha deciso di curare le proprie radici"

            - firstChar_ActualName has Violino:
                ~ return "Ha trovato nell'amore il cambiamento"
        }
        
    
    - SecondCharacter:
       {    
            - grimoire_secondChar hasnt grimSecondCharFour:
                ~ return ""

            - secondChar_ActualName has Riccio:
                ~ return "Un insieme di aculei, rabbia e curiosità"

            - secondChar_ActualName has Grizzly:
                ~ return "Ha ritrovato nella lotta la sua strada"

            - secondChar_ActualName has Lupo:
                ~ return "Pronto a proteggere tutta la sua famiglia" 

            - secondChar_ActualName has Delfino:
                ~ return "Fantasia e piccole bugie per vincere assieme la paura"

            - secondChar_ActualName has Capibara:
                ~ return "Stare assieme per combattere la paura"

            - secondChar_ActualName has Corvo:
                ~ return "La conoscenza come mezzo per cambiare le cose e far del bene"
        }
    
    - ThirdCharacter:
        {   
            - grimoire_thirdChar hasnt grimThirdCharFour:
                ~ return ""

            - thirdChar_ActualName has Boccale:
                ~ return "frase"

            - thirdChar_ActualName has Grizzly:
                ~ return "frase"

            - thirdChar_ActualName has Lupo:
                ~ return "frase"

            - thirdChar_ActualName has Delfino:
                ~ return "frase"

            - thirdChar_ActualName has Capibara:
                ~ return "frase"

            - thirdChar_ActualName has Corvo:
                ~ return "frase"
        }
    
    - FourthCharacter:
        {   
            - grimoire_fourthChar hasnt grimFourthCharFour:
                ~ return ""
            
            - fourthChar_ActualName has NonnaMolotov:
                ~ return "frase"

            - fourthChar_ActualName has Grizzly:
                ~ return "frase"

            - fourthChar_ActualName has Lupo:
                ~ return "frase"

            - fourthChar_ActualName has Delfino:
                ~ return "frase"

            - fourthChar_ActualName has Capibara:
                ~ return "frase"

            - fourthChar_ActualName has Corvo:
                ~ return "frase"
        }
    
    - FifthCharacter:
        {
            
            - fifthChar_storyStatus has Mentor:
                ~ return "Ogni petalo un consiglio"

            - fifthChar_storyStatus has Mostro:
                ~ return "frase"

            - fifthChar_storyStatus has Lupo:
                ~ return "frase"

            - fifthChar_storyStatus has Delfino:
                ~ return "frase"

            - fifthChar_storyStatus has Capibara:
                ~ return "frase"

            - fifthChar_storyStatus has Corvo:
                ~ return "frase"

            - fifthChar_storyStatus has Corvo:
                ~ return "frase"    
        }

    
    - TheWitch:
        ~ return "Luce dal cielo, guida dalla discarica"

    - Franco:
        ~ return "Un concentrato di craaa-ggezza!"

    //Appendici
    - AppendiceA:
        ~ return "Su scelte, dialoghi e relazioni"

    - AppendiceB:
        ~ return "Sul potere dei doni"

    - AppendiceC:
        ~ return "Su cucina e affinità"

    - AppendiceD:
        ~ return "Su scrittura e riscrittura"

    - AppendiceE:
        ~ return "Sui sigilli"

    - LettersAndDocuments:
        ~ return "Voci da un altro tempo"

}


//Gestione ad hoc di Mentore/Mostro
=== function grimoire_characterName(PNG)

{PNG:
    - FirstCharacter:
        ~ return translator(firstChar_ActualName)

    - SecondCharacter:
        {
            - ! second_char_main_storylets.one.nameSecond:
                ~ return "???"
            - else:
                ~ return translator(secondChar_ActualName)
        }
        
    - ThirdCharacter:
        {
            - ! third_char_main_storylets.one:
                ~ return "???"
            
            - else:
                ~ return translator(thirdChar_ActualName)
        }

    - FourthCharacter:
        ~ return translator(fourthChar_ActualName)

    - FifthCharacter:
        {

            - !tutorial_mentorTalkingChoiceRelationship.waterChoice && !tutorial_mentorTalkingChoiceRelationship.selfName:
                ~ return "???"
            
            - else:
                ~ return translator(fifthChar_ActualName)

        }

    - Franco:
        {
            - frog_nameDiscovered == false:
                ~ return "???"
            
            - are_two_entities_together(PG, Franco) && entity_location(PG) == Kitchen:
                ~ return "Franco Lo Chef"

            - else:
                ~ return "Franco La Rana"
        }

    - TheWitch:
        ~ return translator(witch_actualName)

}




/***********************************

    Funzioni per pagine piante

***********************************/


=== function grimoire_statusPlants(plant)

    {
        - greenhouse_findedCultivables has plant && backpack_findedGifts hasnt plant:
            ~ return missing
        
        - else:
            ~ return owned
    }


=== function grimoire_pageStatus(plant)
    {
        - plant == Hidden:
           ~ return hidden

        - greenhouse_findedCultivables hasnt plant:
           ~ return locked
           
        //se è tra le cose trovate ma non risulta nell'intersezione tra cose trovate e cose possedute, vuol dire che l'ho usata
        - greenhouse_findedCultivables has plant && backpack_findedGifts hasnt plant:
            ~ return consumed
        
        - else:
            ~ return owned       

    }


=== function grimoire_pageSubtitle(plant, PNG, location)

    {
        - PNG == FirstCharacter:
            {
                - location == Kitchen:
                    {
                        - kitchen_firstCharExtraIngredient == plant:
                            ~ return "Pianta utilizzata in cucina con {translator(firstChar_ActualName)}."
                    }
                - location == Backpack:
                    {
                        - firstChar_giftedObject == plant:
                            ~ return "Pianta donata a {translator(firstChar_ActualName)}."
                    }
            }

        - PNG == SecondCharacter:
            {
                - location == Kitchen:
                    {
                        - kitchen_secondCharExtraIngredient == plant:
                            ~ return "Pianta utilizzata in cucina con {translator(secondChar_ActualName)}."
                    }
                - location == Backpack:
                    {
                        - secondChar_giftedObject == plant:
                            ~ return "Pianta donata a {translator(secondChar_ActualName)}."
                    }
            }

        - PNG == ThirdCharacter:
            {
                - location == Kitchen:
                    {
                        - kitchen_thirdCharExtraIngredient == plant:
                            ~ return "Pianta utilizzata in cucina con {translator(thirdChar_ActualName)}."
                    }
                - location == Backpack:
                    {
                        - thirdChar_giftedObject == plant:
                            ~ return "Pianta donata a {translator(thirdChar_ActualName)}."
                    }
            }

        - PNG == FourthCharacter:
            {
                - location == Kitchen:
                    {
                        - kitchen_fourthCharExtraIngredient == plant:
                            ~ return "Pianta utilizzata in cucina con {translator(fourthChar_ActualName)}."
                    }
                - location == Backpack:
                    {
                        - fourthChar_giftedObject == plant:
                            ~ return "Pianta donata a {translator(fourthChar_ActualName)}."
                    }
            }

        - PNG == FifthCharacter:
            {
                - location == Kitchen:
                    {
                        - kitchen_fifthCharExtraIngredient == plant:
                            ~ return "Pianta utilizzata in cucina con {translator(fifthChar_ActualName)}."
                    }
                - location == Backpack:
                    {
                        - fifthChar_giftedObject == plant:
                            ~ return "Pianta donata a {translator(fifthChar_ActualName)}."
                    }
            }

        - PNG == Franco:
            {
                - plant == frog_recoveredCultivables:
                    ~ return "Pianta recuperata con l'aiuto di Franco."
            }          
    }


=== function grimoire_pageGiftDescription(plant, PNG)

    {
        - PNG == FirstCharacter:
            {
                - firstChar_giftedObject has plant && firstChar_favouritesGifts has plant:
                    ~ return "Dopo il dono, {player_name} ha ricevuto due gocce di inchiostro."

                - firstChar_giftedObject has plant && firstChar_goodGifts has plant:
                    ~ return "Dopo il dono, {player_name} ha ricevuto una goccia di inchiostro."
                
                - firstChar_giftedObject has plant:
                    ~ return "Dopo il dono, {player_name} non ha ricevuto alcuna goccia di inchiostro."
            }

        - PNG == SecondCharacter:
            {
                - secondChar_giftedObject has plant && secondChar_favouritesGifts has plant:
                    ~ return "Dopo il dono, {player_name} ha ricevuto due gocce di inchiostro."

                - secondChar_giftedObject has plant && secondChar_goodGifts has plant:
                    ~ return "Dopo il dono, {player_name} ha ricevuto una goccia di inchiostro."
                
                - secondChar_giftedObject has plant:
                    ~ return "Dopo il dono, {player_name} non ha ricevuto alcuna goccia di inchiostro."
            }

        - PNG == ThirdCharacter:
            {
                - thirdChar_giftedObject has plant && thirdChar_favouritesGifts has plant:
                    ~ return "Dopo il dono, {player_name} ha ricevuto due gocce di inchiostro."

                - thirdChar_giftedObject has plant && thirdChar_goodGifts has plant:
                    ~ return "Dopo il dono, {player_name} ha ricevuto una goccia di inchiostro."
                
                - thirdChar_giftedObject has plant:
                    ~ return "Dopo il dono, {player_name} non ha ricevuto alcuna goccia di inchiostro."
            }

        - PNG == FourthCharacter:
            {
                - fourthChar_giftedObject has plant && fourthChar_favouritesGifts has plant:
                    ~ return "Dopo il dono, {player_name} ha ricevuto due gocce di inchiostro."

                - fourthChar_giftedObject has plant && fourthChar_goodGifts has plant:
                    ~ return "Dopo il dono, {player_name} ha ricevuto una goccia di inchiostro."
                
                - fourthChar_giftedObject has plant:
                    ~ return "Dopo il dono, {player_name} non ha ricevuto alcuna goccia di inchiostro."
            }

        - PNG == FifthCharacter:
            {
                - fifthChar_giftedObject has plant && fifthChar_favouritesGifts has plant:
                    ~ return "Dopo il dono, {player_name} ha ricevuto due gocce di inchiostro."

                // - fifthChar_giftedObject has plant && fifthChar_goodGifts has plant:
                //     ~ return "Dopo il dono, {player_name} ha ricevuto una goccia di inchiostro."
                
                - fifthChar_giftedObject has plant:
                    ~ return "Dopo il dono, {player_name} non ha ricevuto alcuna goccia di inchiostro."
            }

    }


=== function ingredientTranslator(ingredient)

    {ingredient:

        - BaccaDellaAddolorata: 
            ~ return "un seme di Bacca della Addolorata"
        
        - BarbaDellInciampo:
            ~ return "una spina di Barba dell'Inciampo"
            
        - BastoneDellOzioso:
            ~ return "un nodo di Bastone dell'Ozioso"
                
        - BrinaDellImpossibile:
            ~ return "un frammento di Brina dell'Impossibile"
            
        - CantoDelleCompagne: 
            ~ return "una goccia di Canto delle Compagne"

        - CardoAspinato:
            ~ return "un ciuffo di Cardo Aspinato"
            
        - EderaDelleAmanti:
            ~ return "una foglia di Edera delle Amanti"
    
        - ErbaLiccia:
            ~ return "un ricordo di Erba Liccia"
            
        - FalsaPalude:
            ~ return "un petalo di Falsa Palude"

        - LanaNotturna:
            ~ return "il calore della Lana Notturna"        
                        
        - LicheneDegliAbissi:
            ~ return "una traccia dell'odore del Lichene degli Abissi"
            
        - NonTiScordarDiTe:
            ~ return "l'impronta del Non Ti Scordar di Te"

        - Olobino:
            ~ return "un cappello di Olobino"

        - LaSpazzata: 
            ~ return "una foglia della Spezzata"
        
        - universalIngredient:
            ~ return "un pizzico di Ingrediente Universale"
                        
    }
    



/***********************************

    Funzioni per pagine sigilli

***********************************/


=== function grimoire_statusSigils(sigilList)
//Per secondo livello
    {
        - sigilList has glyph_actualActiveSigil:
            ~ return true
        
        - else:
            ~ return false
    }


=== function grimoire_statusThirdSigils(sigil)
//Per terzo livello

{
    - glyph_actualActiveSigil has sigil:
        ~ return selected

    - glyph_usedSigils has sigil:
        ~ return consumed

    - glyph_actualActiveSigil != () && glyph_usedSigils hasnt sigil && glyph_actualActiveSigil hasnt sigil:
        ~ return unclickable

    - else:
         ~ return default   

}


=== function grimoire_sigilGlyph3(sigil)
    {
        - glyph_thirdFire has sigil:
            ~ return Fire
        - glyph_thirdWater has sigil:
            ~ return Water
        - glyph_thirdEarth has sigil:
            ~ return Earth
        - glyph_thirdAir has sigil:
            ~ return Air
        - glyph_thirdAether has sigil:
            ~ return Aether
    }


=== function grimoire_sigilsLabelsName(sigil)
//La logica è: se quel "doppio sigillo" ha un contenuto, mostro l'etichetta, altrimenti mostro altro.

        {
        //Venti sigilli principali
            - WaterEarth has sigil:
                ~ return "Lago"
            - WaterAir has sigil:
                ~ return "Nube"
            - WaterFire has sigil:
                ~ return "Fiume"
            - WaterAether has sigil:
                ~ return "Fonte"
            
            - AirWater has sigil:
                ~ return "Cavalletto"
            - AirEarth has sigil:
                ~ return "Leggio"
            - AirFire has sigil:
                ~ return "Stufa"
            - AirAether has sigil:
                ~ return "Tavolo"

            - AetherWater has sigil:
                ~ return "Calice"
            - AetherEarth has sigil:
                ~ return "Tempio"
            - AetherFire has sigil:
                ~ return "Pugnale"
            - AetherAir has sigil:
                ~ return "Incenso"

            - EarthWater has sigil:
                ~ return "Linfa"
            - EarthAir has sigil:
                ~ return "Frasca"
            - EarthFire has sigil:
                ~ return "Frutto"
            - EarthAether has sigil:
                ~ return "Radice"

            - FireWater has sigil:
                ~ return "Chiave"
            - FireEarth has sigil:
                ~ return "Calibro"
            - FireAir has sigil:
                ~ return "Palla"
            - FireAether has sigil:
                ~ return "Mappa"
                                                            
            -else:
                ~ return "Sconosciuto"
        }




=== function grimoire_sigilSigilName(glyph1, glyph2) ===
    ~ temp pertinentSigils = sigilsWithGlyphInFirstPosition(glyph1) ^ sigilsWithGlyphInSecondPosition(glyph2)
    ~ temp discoveredPertinentSigils = pertinentSigils ^ glyph_discoveredSigils
    {not discoveredPertinentSigils:
        ~ return ""
    }

    ~ temp sigilName = "{glyph1}{glyph2}"

{sigilName:
     //Venti sigilli principali
            - "WaterEarth":
                ~ return "Lago"
            - "WaterAir":
                ~ return "Nube"
            - "WaterFire":
                ~ return "Fiume"
            - "WaterAether":
                ~ return "Fonte"
            
            - "AirWater":
                ~ return "Cavalletto"
            - "AirEarth":
                ~ return "Leggio"
            - "AirFire":
                ~ return "Stufa"
            - "AirAether":
                ~ return "Tavolo"

            - "AetherWater":
                ~ return "Calice"
            - "AetherEarth":
                ~ return "Tempio"
            - "AetherFire":
                ~ return "Pugnale"
            - "AetherAir":
                ~ return "Incenso"

            - "EarthWater":
                ~ return "Linfa"
            - "EarthAir":
                ~ return "Frasca"
            - "EarthFire":
                ~ return "Frutto"
            - "EarthAether":
                ~ return "Radice"

            - "FireWater":
                ~ return "Chiave"
            - "FireEarth":
                ~ return "Calibro"
            - "FireAir":
                ~ return "Palla"
            - "FireAether":
                ~ return "Mappa"
}





=== function grimoire_sigilsDescription(sigilName)
{sigilName:
    - "WaterEarth":
        ~ return "{grimoire_textWaterEarthOne} {grimoire_textWaterEarthTwo}"
    - "WaterAir":
        ~ return "{grimoire_textWaterAirOne} {grimoire_textWaterAirTwo}"
    - "WaterFire":
        ~ return "{grimoire_textWaterFireOne} {grimoire_textWaterFireTwo}"
    - "WaterAether":
        ~ return "{grimoire_textWaterAetherOne} {grimoire_textWaterAetherTwo}"
    
    - "AirWater":
        ~ return "{grimoire_textAirWaterOne} {grimoire_textAirWaterTwo}"
    - "AirEarth":
        ~ return "{grimoire_textAirEarthOne} {grimoire_textAirEarthTwo}"
    - "AirFire":
        ~ return "{grimoire_textAirFireOne} {grimoire_textAirFireTwo}"
    - "AirAether":
        ~ return "{grimoire_textAirAetherOne} {grimoire_textAirAetherTwo}"

    - "AetherWater":
        ~ return "{grimoire_textAetherWaterOne} {grimoire_textAetherWaterTwo}"
    - "AetherEarth":
        ~ return "{grimoire_textAetherEarthOne} {grimoire_textAetherEarthTwo}"
    - "AetherFire":
        ~ return "{grimoire_textAetherFireOne} {grimoire_textAetherFireTwo}"
    - "AetherAir":
        ~ return "{grimoire_textAetherAirOne} {grimoire_textAetherAirTwo}"

    - "EarthWater":
        ~ return "{grimoire_textEarthWaterOne} {grimoire_textEarthWaterTwo}"
    - "EarthAir":
        ~ return "{grimoire_textEarthAirOne} {grimoire_textEarthAirTwo}"
    - "EarthFire":
        ~ return "{grimoire_textEarthFireOne} {grimoire_textEarthFireTwo}"
    - "EarthAether":
        ~ return "{grimoire_textEarthAetherOne} {grimoire_textEarthAetherTwo}"

    - "FireWater":
        ~ return "{grimoire_textFireWaterOne} {grimoire_textFireWaterTwo}"
    - "FireEarth":
        ~ return "{grimoire_textFireEarthOne} {grimoire_textFireEarthTwo}"
    - "FireAir":
        ~ return "{grimoire_textFireAirOne} {grimoire_textFireAirTwo}"
    - "FireAether":
        ~ return "{grimoire_textFireAetherOne} {grimoire_textFireAetherTwo}"


}