//Settaggio nome finale
=== function newName(PNG)
/********************
                                                                        Per la riscrittura non si tratta più di creare una relazione, ma di mostrare un mondo. 
                                                                        Per cui non ragioniamo più con le funzioni di relazione ma semplicemente tracciamo il colore delle scelte, ed è quello a definire il nome. 
                                                                        In questo modo non è più un discorso di esito positivo/negativo, ma di espressione.
                                                                        PERO', per non rendere inutile tutta la conversazione precedente, terremo conto anche di tutte le scelte fatte fino a quel momento.
                                                                        In questo modo avere più scelte (e quindi più inchiostro) o utilizzare il giusto sigillo sono cose che creano effettivamente un vantaggio perché per (es) spostare da una visione "fire" a 12 a una "water" che parte da un 6 ho bisogno di più scelte possibile (e qui interviene comunque anche il vantaggio del modificatore.) 
                                                                                                        ********************/

//Primo step: associo i glifi temporanei alla PNG di riferimento
~ temp temporaryAir = 0
~ temp temporaryWater = 0
~ temp temporaryAether = 0
~ temp temporaryFire = 0
~ temp temporaryEarth = 0
~ temp mainGlyph = ()
~ temp possiblesMainGlyphs = ()
//per non complicarmi la vita nei controlli, setto questo valore a 0, 1 e 2 (0, situazione non di Boccale, 1 è negativa, 2 positiva)
~ temp thirdCharBadEnding = 0

{PNG:
    - FirstCharacter:
        ~ temporaryAir = firstChar_air
        ~ temporaryWater = firstChar_water
        ~ temporaryAether = firstChar_aether
        ~ temporaryFire = firstChar_fire
        ~ temporaryEarth = firstChar_earth

    - SecondCharacter:
        ~ temporaryAir = secondChar_air
        ~ temporaryWater = secondChar_water
        ~ temporaryAether = secondChar_aether
        ~ temporaryFire = secondChar_fire
        ~ temporaryEarth = secondChar_earth

    - ThirdCharacter:
        ~ temporaryAir = thirdChar_air
        ~ temporaryWater = thirdChar_water
        ~ temporaryAether = thirdChar_aether
        ~ temporaryFire = thirdChar_fire
        ~ temporaryEarth = thirdChar_earth
            {
             - (temporaryAir + temporaryFire + temporaryEarth) >= (temporaryWater + temporaryAether):
                ~ thirdCharBadEnding = 1
            - else:
                ~ thirdCharBadEnding = 2
            }

    - FourthCharacter:
        ~ temporaryAir = fourthChar_air
        ~ temporaryWater = fourthChar_water
        ~ temporaryAether = fourthChar_aether
        ~ temporaryFire = fourthChar_fire
        ~ temporaryEarth = fourthChar_earth

    - FifthCharacter:
        ~ temporaryAir = fifthChar_air
        ~ temporaryWater = fifthChar_water
        ~ temporaryAether = fifthChar_aether
        ~ temporaryFire = fifthChar_fire
        ~ temporaryEarth = fifthChar_earth       

}

//Secondo step: calcolo il valore dominante.
    {
        //Aria elemento più usato     
        - (temporaryAir > temporaryWater) && (temporaryAir > temporaryFire) && (temporaryAir > temporaryEarth) && (temporaryAir > temporaryAether) && thirdCharBadEnding != 2:
            ~ mainGlyph = airC
          
        //Fuoco elemento più usato         
        - (temporaryFire> temporaryWater) && (temporaryFire> temporaryAir) && (temporaryFire> temporaryEarth) && (temporaryFire> temporaryAether) && thirdCharBadEnding != 2:
            ~ mainGlyph = fireC

        //Terra elemento più usato           
        - (temporaryEarth > temporaryWater) && (temporaryEarth > temporaryFire) && (temporaryEarth > temporaryAir) && (temporaryEarth > temporaryAether) && thirdCharBadEnding != 2:
            ~ mainGlyph = earthC

        //Acqua elemento più usato     
        - (temporaryWater > temporaryAir) && (temporaryWater > temporaryFire) && (temporaryWater > temporaryEarth) && (temporaryWater > temporaryAether) && thirdCharBadEnding != 1:
            ~ mainGlyph = waterC

        //Spirito elemento più usato        
        - (temporaryAether > temporaryWater) && (temporaryAether > temporaryFire) && (temporaryAether > temporaryEarth) && (temporaryAether > temporaryAir) && thirdCharBadEnding != 1:
            ~ mainGlyph = aetherC   

                
        - else:
            //In caso di pareggio cerco di assegnare un nome casuale da quelli più plausibili, sempre secondo la logica qui sopra elemento == nome.
            //Prima di tutto cerco di capire qual è il valore più alto comune.
            ~ temp maxValue = 0
                {
                    - temporaryAether >= maxValue && thirdCharBadEnding != 1:
                        ~ maxValue = temporaryAether
                }
                {
                    - temporaryWater >= maxValue && thirdCharBadEnding != 1:
                        ~ maxValue = temporaryWater
                }
                {
                    - temporaryFire >= maxValue && thirdCharBadEnding != 2:
                        ~ maxValue = temporaryFire
                }
                {
                    - temporaryAir >= maxValue && thirdCharBadEnding != 2:
                        ~ maxValue =  temporaryAir
                }
                {
                    - temporaryEarth >= maxValue && thirdCharBadEnding != 2:
                        ~ maxValue = temporaryEarth

                }

            {debug: Il valore massimo raggiunto dai glifi è {maxValue}.}

            //Poi aggiungo alla lista dei potenziali generatori di nomi solo quei glifi che superano il valore medio delle scelte. 

            {
                - temporaryAether >= maxValue && thirdCharBadEnding != 1:
                    ~ possiblesMainGlyphs += aetherC
            }

            {
                - temporaryWater >= maxValue && thirdCharBadEnding != 1:
                    ~ possiblesMainGlyphs += waterC
            }

            {
                - temporaryFire >= maxValue && thirdCharBadEnding != 2:
                    ~ possiblesMainGlyphs += fireC
            }

            {
                - temporaryAir >= maxValue && thirdCharBadEnding != 2:
                    ~ possiblesMainGlyphs += airC
            }

            {
                - temporaryEarth >= maxValue && thirdCharBadEnding != 2:
                    ~ possiblesMainGlyphs += earthC
            } 

            {debug: La lista di possibili nomi in caso di pareggio è {possiblesMainGlyphs}.}
            //E infine ne prendo uno casuale dalla lista. Se dovesse essere vuota, ne assegno uno che ha senso con una cattiva relazione creata con lx png.
            {
                - possiblesMainGlyphs != ():
                    ~ mainGlyph = LIST_RANDOM(possiblesMainGlyphs)
            }
        
        }

//Infine vado ad associare i nomi
{PNG:
    - FirstCharacter:
        ~ firstChar_ActualName = ()
        {mainGlyph:
            - airC:
                ~ firstChar_ActualName += Triangolo
            - waterC:
                ~ firstChar_ActualName += Violino
            - earthC:
                ~ firstChar_ActualName += Ocarina
            - fireC:
                ~ firstChar_ActualName += Orchestra
            - aetherC:
                ~ firstChar_ActualName += FlautoDolce
            - else:
                //La lettura negativa per Chitarra probabilmente è quella romantica.
                ~ firstChar_ActualName += Violino
        }

    - SecondCharacter:
        ~ secondChar_ActualName = ()
        {mainGlyph:
            - airC:
                ~ secondChar_ActualName += Corvo
            - waterC:
                ~ secondChar_ActualName += Lupo
            - earthC:
                ~ secondChar_ActualName += Capibara
            - fireC:
                ~ secondChar_ActualName += Orso
            - aetherC:
                ~ secondChar_ActualName += Delfino
            - else:
                //La lettura negativa per Riccio è quella violenta.
                ~ secondChar_ActualName += Orso
        }

    - ThirdCharacter:
        ~ thirdChar_ActualName = ()
        {mainGlyph:
            - airC:
                ~ thirdChar_ActualName += Forum
            - waterC:
                ~ thirdChar_ActualName += Canovaccio
            - earthC:
                ~ thirdChar_ActualName += Sigaro
            - fireC:
                ~ thirdChar_ActualName += Guantone
            - aetherC:
                ~ thirdChar_ActualName += Cerchio
            - else:
                //La lettura negativa per Boccale è quella autodistruttiva
                ~ thirdChar_ActualName += Guantone
        }


    - FourthCharacter:
         ~ fourthChar_ActualName = ()
        {mainGlyph:
            - airC:
                ~ fourthChar_ActualName += FourthB
            - waterC:
                ~ fourthChar_ActualName += FourthC
            - earthC:
                ~ fourthChar_ActualName += FourthD
            - fireC:
                ~ fourthChar_ActualName += FourthE
            - aetherC:
                ~ fourthChar_ActualName += FourthF
            - else:
                //Definire e assegnare il negativo
                ~ fourthChar_ActualName += FourthB
        }


    - FifthCharacter:
         ~ fifthChar_ActualName = ()
        {mainGlyph:
            - airC:
                ~ fifthChar_ActualName += FifthB
            - waterC:
                ~ fifthChar_ActualName += FifthC
            - earthC:
                ~ fifthChar_ActualName += FifthD
            - fireC:
                ~ fifthChar_ActualName += FifthE
            - aetherC:
                ~ fifthChar_ActualName += FifthF
            - else:
                //Definire e assegnare il negativo
                ~ fifthChar_ActualName += FifthB
        }
    

}

/* ---------------------------------
                
Funzione di traduzione da variabile a stringa 
                
----------------------------------*/

=== function translator(characterState)
    {characterState:
    
    //Personaggia Uno
        - Chitarra:
            ~ return "Chitarra"
        - Triangolo:
            ~ return "Triangolo"
        - Orchestra:
            ~ return "Orchestra"
        - FlautoDolce:
            ~ return "Flauto Dolce"
        - Ocarina:
            ~ return "Ocarina"
        - Violino:
            ~ return "Violino"

    //Personaggia Due       
        - Riccio:
            ~ return "Riccio"
        - Orso:
            ~ return "Orso"
        - Lupo:
            ~ return "Lupo"
        - Delfino:
            ~ return "Delfino"
        - Capibara:
            ~ return "Capibara"
        - Corvo:
            ~ return "Corvo"

    //Personaggio Tre
        - Boccale:
            ~ return "Boccale"
        - Forum:
            ~ return "Forum"
        - Canovaccio:
            ~ return "Canovaccio"
        - Sigaro:
            ~ return "Sigaro"
        - Guantone:
            ~ return "Guantone"
        - Cerchio:
            ~ return "Cerchio"                   
    
    //Personaggia Quattro        
        - NonnaMolotov:
            ~ return "Nonna Molotov"
        - FourthB:
            ~ return "FourthB"
        - FourthC:
            ~ return "FourthC"
        - FourthD:
            ~ return "FourthD"
        - FourthE:
            ~ return "FourthE"
        - FourthF:
            ~ return "FourthF"                   
        

    //Personaggia Cinque        
        - Mentore:
            ~ return "Mentore"
        - Mostro:
            ~ return "Mostro"
        - FifthB:
            ~ return "FifthB"
        - FifthC:
            ~ return "FifthC"
        - FifthD:
            ~ return "FifthD"
        - FifthE:
            ~ return "FifthE"
        - FifthF:
            ~ return "FifthF"                   
        

    }

