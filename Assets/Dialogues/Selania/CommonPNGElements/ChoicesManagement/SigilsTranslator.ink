=== function sigils_translator(wordValue)
//Da fare quando son sicura del tutto
{debug_nest: sigils_translator.}

    {wordValue:       
            
            - FireAirWater: 
                ~ return "Trottola"
            
            - FireAirEarth: 
                ~ return "Dado"
                
            - FireAirAether: 
                ~ return "Corda"
   
            - FireWaterEarth: 
                ~ return "Catena"
 
            - FireWaterAether: 
                ~ return "Moschettone"
                
            - FireWaterAir: 
                ~ return "Soglia"

            - FireEarthWater: 
                ~ return "Chiodo"
 
            - FireEarthAether: 
                ~ return "Uncinetto"
   
            - FireEarthAir: 
                ~ return "Scalpello"
    
            - FireAetherAir:
                ~ return "Griglia"
                
            - FireAetherEarth:
                ~ return "Traguardo"
                
            - FireAetherWater:
                ~ return "Bussola"
      
        
        
        
            - AirFireEarth:
                ~ return "Mestolo"
  
            - AirFireAether:
                ~ return "Setaccio"
                
            - AirFireWater:
                ~ return "Tagliere"
                
            - AirWaterEarth:
                ~ return "Macchia"

            - AirWaterAether:
                ~ return "Linea"
   
            - AirWaterFire:
                ~ return "Punto"
  
            - AirEarthAether:
                ~ return "Registro"
  
            - AirEarthWater:
                ~ return "Diario"
      
            - AirEarthFire:
                ~ return "Agenda"
            
            - AirAetherEarth:
                ~ return "Vassoio"
            
            - AirAetherWater:
                ~ return "Caraffa"

            - AirAetherFire:
                ~ return "Macina"
                
                

            
            - WaterFireEarth:
                ~ return "Alluvione"
 
            - WaterFireAether:
                ~ return "Diga"
                
            - WaterFireAir:
                ~ return "Zattera"
 
            - WaterAirEarth:
                ~ return "Neve"

            - WaterAirAether:
                ~ return "Nebbia"
                
            - WaterAirFire:
                ~ return "Grandine"
 
            - WaterEarthAether:
                ~ return "Pinna"
  
            - WaterEarthAir:
                ~ return "Vela"
 
            - WaterEarthFire:
                ~ return "Pontile"
 
            - WaterAetherEarth:
                ~ return "Pozzo"
  
            - WaterAetherAir:
                ~ return "Catino"

            - WaterAetherFire:
                ~ return "Barile"
  
                
            
            - EarthFireAether:
                ~ return "Seme"
                
            - EarthFireWater:
                ~ return "Polpa"

            - EarthFireAir:
                ~ return "Buccia"
  
            - EarthAirAether:
                ~ return "Polline"
  
            - EarthAirWater:
                ~ return "Gemma"
            
            - EarthAirFire:
                ~ return "Ghianda"
 
            - EarthWaterAether:
                ~ return "Floema"
 
            - EarthWaterAir:
                ~ return "Corteccia"
  
            - EarthWaterFire:
                ~ return "Resina"
   
            - EarthAetherWater:
                ~ return "Zolla"
                
            - EarthAetherAir:
                ~ return "Apice"
                
            - EarthAetherFire:
                ~ return "Fittone"
                
                
            
            - AetherFireEarth:
                ~ return "Lama"

            - AetherFireWater:
                ~ return "Punta"
                
            - AetherFireAir:
                ~ return "Dorso"
 
            - AetherAirEarth:
                ~ return "Spago"
    
            - AetherAirWater:
                ~ return "Fumo"
   
            - AetherAirFire:
                ~ return "Cenere"
  
            - AetherWaterEarth:
                ~ return "Fondo"
  
            - AetherWaterAir:
                ~ return "Crepa"
  
            - AetherWaterFire:
                ~ return "Ruggine"
  
            - AetherEarthWater:
                ~ return "Arazzo"
   
            - AetherEarthAir:
                ~ return "Altare"

            - AetherEarthFire:
                ~ return "Campanella"
   
    //Venti sigilli principali
            - WaterEarth:
                ~ return "Lago"
            - WaterAir:
                ~ return "Nube"
            - WaterFire:
                ~ return "Fiume"
            - WaterAether:
                ~ return "Fonte"
            
            - AirWater:
                ~ return "Cavalletto"
            - AirEarth:
                ~ return "Leggio"
            - AirFire:
                ~ return "Stufa"
            - AirAether:
                ~ return "Tavolo"

            - AetherWater:
                ~ return "Calice"
            - AetherEarth:
                ~ return "Tempio"
            - AetherFire:
                ~ return "Pugnale"
            - AetherAir:
                ~ return "Incenso"

            - EarthWater:
                ~ return "Linfa"
            - EarthAir:
                ~ return "Frasca"
            - EarthFire:
                ~ return "Frutto"
            - EarthAether:
                ~ return "Radice"

            - FireWater:
                ~ return "Chiave"
            - FireEarth:
                ~ return "Calibro"
            - FireAir:
                ~ return "Palla"
            - FireAether:
                ~ return "Mappa"
                                                            
            -else: Traduzione colore parola {glyph_actualActiveSigil} non trovato!
    }


    


//Lista dei descrittori

//Dominante fuoco
    //Più aria
    VAR glyph_textFireAirWaterOne = "Maglie sull’erba, occhi febbrili."
    VAR glyph_textFireAirWaterTwo = "Corpi accalcati,"
    VAR glyph_textFireAirWaterThree = "una coppa spezzata."

    VAR glyph_textFireAirEarthOne = "Grida al tavolo, si mischia il mazzo."
    VAR glyph_textFireAirEarthTwo = " Sterco fiorito,"
    VAR glyph_textFireAirEarthThree = "nudo il campo."

    VAR glyph_textFireAirAetherOne = "Lotte tra le sterpaglie, l’ansimare dei cuccioli."
    VAR glyph_textFireAirAetherTwo = "I padri a distanza,"
    VAR glyph_textFireAirAetherThree = "sangue sul crisantemo."

    //Più acqua
    VAR glyph_textFireWaterEarthOne = "Colmo il nido, tiepido il pelo."
    VAR glyph_textFireWaterEarthTwo = "Lo scoiattolo indugia,"
    VAR glyph_textFireWaterEarthThree = "brucia la ginestra."

    VAR glyph_textFireWaterAetherOne = "Piede nudo, la viola si piega."
    VAR glyph_textFireWaterAetherTwo = "Mano alzata,"
    VAR glyph_textFireWaterAetherThree = "il cane morde."

    VAR glyph_textFireWaterAirOne = "Vento sul naso, pioggia alle spalle."
    VAR glyph_textFireWaterAirTwo = "Sentiero cancellato,"
    VAR glyph_textFireWaterAirThree = "gambe d’albero."

    //Più terra
    VAR glyph_textFireEarthWaterOne = " Cuori caldi, respiro unito."
    VAR glyph_textFireEarthWaterTwo = "Osso levigato,"
    VAR glyph_textFireEarthWaterThree = "cernia sull’arpione."

    VAR glyph_textFireEarthAetherOne = "Si spoglia la pecora, si essica il cardo."
    VAR glyph_textFireEarthAetherTwo = "Dalla stalla al filatoio,"
    VAR glyph_textFireEarthAetherThree = "dal filatoio alla torre."

    VAR glyph_textFireEarthAirOne = "Il mare nascosto nella bianca pietra."
    VAR glyph_textFireEarthAirTwo = "La punta mostra,"
    VAR glyph_textFireEarthAirThree = "la punta cancella."

    //Più spirito
    VAR glyph_textFireAetherWaterOne = "Cielo incerto, bassa la rondine."
    VAR glyph_textFireAetherWaterTwo = "La lucertola segue il sole,"
    VAR glyph_textFireAetherWaterThree = "bassa la poiana."

    VAR glyph_textFireAetherEarthOne = "Rami e fango, il castoro nell’acqua."
    VAR glyph_textFireAetherEarthTwo = "Cresce la diga, "
    VAR glyph_textFireAetherEarthThree = "vuota la tana."

    VAR glyph_textFireAetherAirOne = "Testa di serpente, capelli sulla riva."
    VAR glyph_textFireAetherAirTwo = "Svolazza l’atlante,"
    VAR glyph_textFireAetherAirThree = "il salice si bagna."

//Dominante aria
    //Più fuoco
    VAR glyph_textAirFireEarthOne = "Ceramica calda, brodo fumante."
    VAR glyph_textAirFireEarthTwo = "Patate galleggiano, "
    VAR glyph_textAirFireEarthThree = "fagioli bruciati."

    VAR glyph_textAirFireAetherOne = "Chicchi dorati, bianca farina."
    VAR glyph_textAirFireAetherTwo = "Salmi per il grano,"
    VAR glyph_textAirFireAetherThree = "pula scura sotto il tavolo."

    VAR glyph_textAirFireWaterOne = "Tovaglioli sporchi, piatti pieni."
    VAR glyph_textAirFireWaterTwo = "Cipolle e barbabietole,"
    VAR glyph_textAirFireWaterThree = "la lama sul legno."

    //Più acqua
    VAR glyph_textAirWaterEarthOne = "Idee mobili, creta cedevole."
    VAR glyph_textAirWaterEarthTwo = "La figura di un vaso,"
    VAR glyph_textAirWaterEarthThree = "nessun manico."

    VAR glyph_textAirWaterAetherOne = "Intuito luminoso, inchiostro fluente."
    VAR glyph_textAirWaterAetherTwo = "Parole divine,"
    VAR glyph_textAirWaterAetherThree = "azioni umane."

    VAR glyph_textAirWaterFireOne = "Setole rigide, tela umida."
    VAR glyph_textAirWaterFireTwo = "Nero su bianco,"
    VAR glyph_textAirWaterFireThree = "una sola direzione."

    //Più terra
    VAR glyph_textAirEarthAetherOne = "Nomi in fila, numeri e azioni."
    VAR glyph_textAirEarthAetherTwo = "La dispensa è piena,"
    VAR glyph_textAirEarthAetherThree = "ciotole senza nome."

    VAR glyph_textAirEarthWaterOne = "Parole minute, moltitudine di voci."
    VAR glyph_textAirEarthWaterTwo = "Commenti trasparenti,"
    VAR glyph_textAirEarthWaterThree = "ferite personali."

    VAR glyph_textAirEarthFireOne = "Azione decisa, tempo pianificato."
    VAR glyph_textAirEarthFireTwo = "L’occhio guida la penna,"
    VAR glyph_textAirEarthFireThree = "il piede scalcia."

    //Più spirito
    VAR glyph_textAirAetherEarthOne = "Colline sul tavolo, parole grandi."
    VAR glyph_textAirAetherEarthTwo = "Polenta e patate,"
    VAR glyph_textAirAetherEarthThree = "pance piccole."

    VAR glyph_textAirAetherWaterOne = "Bicchieri colmi, ricordi e risate."
    VAR glyph_textAirAetherWaterTwo = "L’oste rassicura,"
    VAR glyph_textAirAetherWaterThree = "la mano sulla brocca."

    VAR glyph_textAirAetherFireOne = "Impasto morbido, forno caldo."
    VAR glyph_textAirAetherFireTwo = "Sale come neve,"
    VAR glyph_textAirAetherFireThree = "pane come montagna."


//Dominante acqua
    //Più fuoco
    VAR glyph_textWaterFireEarthOne = "Fango sul soffitto, sedie nel campo."
    VAR glyph_textWaterFireEarthTwo = "La riva germina,"
    VAR glyph_textWaterFireEarthThree = "valigie si allontanano."

    VAR glyph_textWaterFireAetherOne = "Pressione sul dorso, ritmo incalzante."
    VAR glyph_textWaterFireAetherTwo = "Una mano difende"
    VAR glyph_textWaterFireAetherThree = "l’altra distanzia."

    VAR glyph_textWaterFireAirOne = "Flusso impetuoso, remo disperso."
    VAR glyph_textWaterFireAirTwo = "Il tarabuso si dichiara,"
    VAR glyph_textWaterFireAirThree = "la volpe cattura."

    //Più aria
    VAR glyph_textWaterAirEarthOne = "Nubi cineree, rumori soffocati."
    VAR glyph_textWaterAirEarthTwo = "Il seme supera l’inverno,"
    VAR glyph_textWaterAirEarthThree = "l’arvicola s’affama."

    VAR glyph_textWaterAirAetherOne = "Velo bluastro, luna coperta."
    VAR glyph_textWaterAirAetherTwo = "Ponte verso il cielo,"
    VAR glyph_textWaterAirAetherThree = "invisibile il piede."

    VAR glyph_textWaterAirFireOne = "Cielo cereo, acqua di pietra."
    VAR glyph_textWaterAirFireTwo = "Foglie strappate,"
    VAR glyph_textWaterAirFireThree = "il lombrico banchetta."

    //Più terra -> remind: queste sono le frasi originali, da non cambiare
    VAR glyph_textWaterEarthFireOne = "Sole sull’acqua, legno sicuro,"
    VAR glyph_textWaterEarthFireTwo = "gambe tese"
    VAR glyph_textWaterEarthFireThree = "in un salto sospeso."

    VAR glyph_textWaterEarthAirOne = "Onde tranquille, assi solide."
    VAR glyph_textWaterEarthAirTwo = "Il riflesso dei monti,"
    VAR glyph_textWaterEarthAirThree = "profondità precluse."

    VAR glyph_textWaterEarthAetherOne = "Acqua sulla pelle, tiepide correnti,"
    VAR glyph_textWaterEarthAetherTwo = "scalciare verso il fondo,"
    VAR glyph_textWaterEarthAetherThree = "toccare la riva."

    //Più spirito
    VAR glyph_textWaterAetherEarthOne = "Eco distante, pietra compatta."
    VAR glyph_textWaterAetherEarthTwo = "Sete condivisa,"
    VAR glyph_textWaterAetherEarthThree = "acqua accumulata."

    VAR glyph_textWaterAetherAirOne = "Flusso gioioso, panni candidi."
    VAR glyph_textWaterAetherAirTwo = "Amici vicini,"
    VAR glyph_textWaterAetherAirThree = "sconosciuti esiliati."

    VAR glyph_textWaterAetherFireOne = "Acqua cristallina, segreti raccolti."
    VAR glyph_textWaterAetherFireTwo = "La lumaca conserva,"
    VAR glyph_textWaterAetherFireThree = "la rana mormora."


//Dominante Terra
    //Più fuoco
    VAR glyph_textEarthFireAetherOne = "Petali al vento, ventre teso."
    VAR glyph_textEarthFireAetherTwo = "Gambe intrecciate,"
    VAR glyph_textEarthFireAetherThree = "briciole sull’erba."

    VAR glyph_textEarthFireWaterOne = "Rivoli sulla roccia, umide le corolle."
    VAR glyph_textEarthFireWaterTwo = "Polline sulle dita,"
    VAR glyph_textEarthFireWaterThree = "ghirlande essiccate."

    VAR glyph_textEarthFireAirOne = "Ninfee dormienti, il canto dell’anatra."
    VAR glyph_textEarthFireAirTwo = "Danze circolari,"
    VAR glyph_textEarthFireAirThree = "piuma contro piuma."

    //Più aria
    VAR glyph_textEarthAirAetherOne = "Ombra sul pesco, rami come onde."
    VAR glyph_textEarthAirAetherTwo = "Uova nell’incavo,"
    VAR glyph_textEarthAirAetherThree = "riposa lo scoiattolo."

    VAR glyph_textEarthAirWaterOne = "Grappolo sull’apice, rondini nel cielo.."
    VAR glyph_textEarthAirWaterTwo = "Il ramo si piega,"
    VAR glyph_textEarthAirWaterThree = "il bruco ingrassa."

    VAR glyph_textEarthAirFireOne = "Azioni sparse, corpi fermi."
    VAR glyph_textEarthAirFireTwo = "Polloni fragili,"
    VAR glyph_textEarthAirFireThree = "il daino cresce."

    //Più acqua
    VAR glyph_textEarthWaterAetherOne = "Canto di cicale, aria secca."
    VAR glyph_textEarthWaterAetherTwo = "Fichi voluttuosi,"
    VAR glyph_textEarthWaterAetherThree = "muore e nasce la vespa."

    VAR glyph_textEarthWaterAirOne = "Acacia verso il cielo, erba in ombra."
    VAR glyph_textEarthWaterAirTwo = "La formica protegge,"
    VAR glyph_textEarthWaterAirThree = "l’albero rifugia."

    VAR glyph_textEarthWaterFireOne = "Asce a riposare, chiacchiericcio sudato."
    VAR glyph_textEarthWaterFireTwo = "Ambra lungo gli anelli,"
    VAR glyph_textEarthWaterFireThree = "piatto il tronco."

    //Più spirito
    VAR glyph_textEarthAetherWaterOne = "Rami sotterranei e lana di micelio."
    VAR glyph_textEarthAetherWaterTwo = "Florido il trifoglio,"
    VAR glyph_textEarthAetherWaterThree = "nuda la senape."

    VAR glyph_textEarthAetherAirOne = "Notte piena, luna assente."
    VAR glyph_textEarthAetherAirTwo = " L’edera si espande,"
    VAR glyph_textEarthAetherAirThree = "si abbracciano le falene."

    VAR glyph_textEarthAetherFireOne = "Giardino di pietra, foglie rade."
    VAR glyph_textEarthAetherFireTwo = "Pugno nella terra,."
    VAR glyph_textEarthAetherFireThree = "ossa di talpa"

//Dominante Spirito
    //Più fuoco
    VAR glyph_textAetherFireEarthOne = "Seggio consunto, bilancia incrostata."
    VAR glyph_textAetherFireEarthTwo = "Freme il leone,"
    VAR glyph_textAetherFireEarthThree = "trema l’agnello."

    VAR glyph_textAetherFireWaterOne = "Pieno il fossato, alto il ponte."
    VAR glyph_textAetherFireWaterTwo = "Si solleva la colomba,"
    VAR glyph_textAetherFireWaterThree = "la mano sull’elsa."

    VAR glyph_textAetherFireAirOne = "Lunga attesa, piatti vuoti."
    VAR glyph_textAetherFireAirTwo = "Un’altra mela ammaccata"
    VAR glyph_textAetherFireAirThree = "gettata nel fango"

    //Più aria
    VAR glyph_textAetherAirEarthOne = "Spezie essiccate, mortaio e macina."
    VAR glyph_textAetherAirEarthTwo = "Miele che amalgama,"
    VAR glyph_textAetherAirEarthThree = "tempo che paralizza.."

    VAR glyph_textAetherAirWaterOne = "Il libro e la mirra."
    VAR glyph_textAetherAirWaterTwo = "Parole incatenate,"
    VAR glyph_textAetherAirWaterThree = "l’occhio al pavimento."

    VAR glyph_textAetherAirFireOne = "Panche calde, vesti composte."
    VAR glyph_textAetherAirFireTwo = "La lingua ubbidisce,"
    VAR glyph_textAetherAirFireThree = "la lingua dissolve."

    //Più acqua
    VAR glyph_textAetherWaterEarthOne = "Bocca viola, prodigio nell’occhio."
    VAR glyph_textAetherWaterEarthTwo = "Il sole a destra,"
    VAR glyph_textAetherWaterEarthThree = "la luna a sinistra."

    VAR glyph_textAetherWaterAirOne = "Ciotola nel temporale, la pioggia straborda."
    VAR glyph_textAetherWaterAirTwo = "Il cane si disseta,"
    VAR glyph_textAetherWaterAirThree = "l’ape affoga."

    VAR glyph_textAetherWaterFireOne = "Gola sabbiosa, mente inquieta."
    VAR glyph_textAetherWaterFireTwo = "Polvere nella coppa,"
    VAR glyph_textAetherWaterFireThree = "un cavatappi spuntato."

    //Più terra
    VAR glyph_textAetherEarthWaterOne = "Dita intrecciate, preghiere e voti."
    VAR glyph_textAetherEarthWaterTwo = "Il cerchio accoglie,"
    VAR glyph_textAetherEarthWaterThree = "il cerchio chiude."

    VAR glyph_textAetherEarthAirOne = "Olio e vino e spighe di grano."
    VAR glyph_textAetherEarthAirTwo = "Verde il drappo,"
    VAR glyph_textAetherEarthAirThree = "sgocciola su vecchie pietre."

    VAR glyph_textAetherEarthFireOne = "Candele agli angoli, mani protese."
    VAR glyph_textAetherEarthFireTwo = "Nomi cantati,"
    VAR glyph_textAetherEarthFireThree = "ombre disperse."




//Lista delle varianti per il grimorio
//Dominante fuoco
    //Più aria
    VAR grimoire_textFireAirWaterOne = ""
    VAR grimoire_textFireAirWaterTwo = ""
    VAR grimoire_textFireAirWaterThree = ""

    VAR grimoire_textFireAirEarthOne = ""
    VAR grimoire_textFireAirEarthTwo = ""
    VAR grimoire_textFireAirEarthThree = ""

    VAR grimoire_textFireAirAetherOne = ""
    VAR grimoire_textFireAirAetherTwo = ""
    VAR grimoire_textFireAirAetherThree = ""

    //Più acqua
    VAR grimoire_textFireWaterEarthOne = ""
    VAR grimoire_textFireWaterEarthTwo = ""
    VAR grimoire_textFireWaterEarthThree = ""

    VAR grimoire_textFireWaterAetherOne = ""
    VAR grimoire_textFireWaterAetherTwo = ""
    VAR grimoire_textFireWaterAetherThree = ""

    VAR grimoire_textFireWaterAirOne = ""
    VAR grimoire_textFireWaterAirTwo = ""
    VAR grimoire_textFireWaterAirThree = ""

    //Più terra
    VAR grimoire_textFireEarthWaterOne = ""
    VAR grimoire_textFireEarthWaterTwo = ""
    VAR grimoire_textFireEarthWaterThree = ""

    VAR grimoire_textFireEarthAetherOne = ""
    VAR grimoire_textFireEarthAetherTwo = ""
    VAR grimoire_textFireEarthAetherThree = ""

    VAR grimoire_textFireEarthAirOne = ""
    VAR grimoire_textFireEarthAirTwo = ""
    VAR grimoire_textFireEarthAirThree = ""

    //Più spirito
    VAR grimoire_textFireAetherWaterOne = ""
    VAR grimoire_textFireAetherWaterTwo = ""
    VAR grimoire_textFireAetherWaterThree = ""

    VAR grimoire_textFireAetherEarthOne = ""
    VAR grimoire_textFireAetherEarthTwo = ""
    VAR grimoire_textFireAetherEarthThree = ""

    VAR grimoire_textFireAetherAirOne = ""
    VAR grimoire_textFireAetherAirTwo = ""
    VAR grimoire_textFireAetherAirThree = ""

//Dominante aria
    //Più fuoco
    VAR grimoire_textAirFireEarthOne = ""
    VAR grimoire_textAirFireEarthTwo = ""
    VAR grimoire_textAirFireEarthThree = ""

    VAR grimoire_textAirFireAetherOne = ""
    VAR grimoire_textAirFireAetherTwo = ""
    VAR grimoire_textAirFireAetherThree = ""

    VAR grimoire_textAirFireWaterOne = ""
    VAR grimoire_textAirFireWaterTwo = ""
    VAR grimoire_textAirFireWaterThree = ""

    //Più acqua
    VAR grimoire_textAirWaterEarthOne = ""
    VAR grimoire_textAirWaterEarthTwo = ""
    VAR grimoire_textAirWaterEarthThree = ""

    VAR grimoire_textAirWaterAetherOne = ""
    VAR grimoire_textAirWaterAetherTwo = ""
    VAR grimoire_textAirWaterAetherThree = ""

    VAR grimoire_textAirWaterFireOne = ""
    VAR grimoire_textAirWaterFireTwo = ""
    VAR grimoire_textAirWaterFireThree = ""

    //Più terra
    VAR grimoire_textAirEarthAetherOne = ""
    VAR grimoire_textAirEarthAetherTwo = ""
    VAR grimoire_textAirEarthAetherThree = ""

    VAR grimoire_textAirEarthWaterOne = ""
    VAR grimoire_textAirEarthWaterTwo = ""
    VAR grimoire_textAirEarthWaterThree = ""

    VAR grimoire_textAirEarthFireOne = ""
    VAR grimoire_textAirEarthFireTwo = ""
    VAR grimoire_textAirEarthFireThree = ""

    //Più spirito
    VAR grimoire_textAirAetherEarthOne = ""
    VAR grimoire_textAirAetherEarthTwo = ""
    VAR grimoire_textAirAetherEarthThree = ""

    VAR grimoire_textAirAetherWaterOne = ""
    VAR grimoire_textAirAetherWaterTwo = ""
    VAR grimoire_textAirAetherWaterThree = ""

    VAR grimoire_textAirAetherFireOne = ""
    VAR grimoire_textAirAetherFireTwo = ""
    VAR grimoire_textAirAetherFireThree = ""


//Dominante acqua
    //Più fuoco
    VAR grimoire_textWaterFireEarthOne = ""
    VAR grimoire_textWaterFireEarthTwo = ""
    VAR grimoire_textWaterFireEarthThree = ""

    VAR grimoire_textWaterFireAetherOne = ""
    VAR grimoire_textWaterFireAetherTwo = ""
    VAR grimoire_textWaterFireAetherThree = ""

    VAR grimoire_textWaterFireAirOne = ""
    VAR grimoire_textWaterFireAirTwo = ""
    VAR grimoire_textWaterFireAirThree = ""

    //Più aria
    VAR grimoire_textWaterAirEarthOne = ""
    VAR grimoire_textWaterAirEarthTwo = ""
    VAR grimoire_textWaterAirEarthThree = ""

    VAR grimoire_textWaterAirAetherOne = ""
    VAR grimoire_textWaterAirAetherTwo = ""
    VAR grimoire_textWaterAirAetherThree = ""

    VAR grimoire_textWaterAirFireOne = ""
    VAR grimoire_textWaterAirFireTwo = ""
    VAR grimoire_textWaterAirFireThree = ""

    //Più terra
    VAR grimoire_textWaterEarthFireOne = ""
    VAR grimoire_textWaterEarthFireTwo = ""
    VAR grimoire_textWaterEarthFireThree = ""

    VAR grimoire_textWaterEarthAirOne = ""
    VAR grimoire_textWaterEarthAirTwo = ""
    VAR grimoire_textWaterEarthAirThree = ""

    VAR grimoire_textWaterEarthAetherOne = ""
    VAR grimoire_textWaterEarthAetherTwo = ""
    VAR grimoire_textWaterEarthAetherThree = ""

    //Più spirito
    VAR grimoire_textWaterAetherEarthOne = ""
    VAR grimoire_textWaterAetherEarthTwo = ""
    VAR grimoire_textWaterAetherEarthThree = ""

    VAR grimoire_textWaterAetherAirOne = ""
    VAR grimoire_textWaterAetherAirTwo = ""
    VAR grimoire_textWaterAetherAirThree = ""

    VAR grimoire_textWaterAetherFireOne = ""
    VAR grimoire_textWaterAetherFireTwo = ""
    VAR grimoire_textWaterAetherFireThree = ""


//Dominante Terra
    //Più fuoco
    VAR grimoire_textEarthFireAetherOne = ""
    VAR grimoire_textEarthFireAetherTwo = ""
    VAR grimoire_textEarthFireAetherThree = ""

    VAR grimoire_textEarthFireWaterOne = ""
    VAR grimoire_textEarthFireWaterTwo = ""
    VAR grimoire_textEarthFireWaterThree = ""

    VAR grimoire_textEarthFireAirOne = ""
    VAR grimoire_textEarthFireAirTwo = ""
    VAR grimoire_textEarthFireAirThree = ""

    //Più aria
    VAR grimoire_textEarthAirAetherOne = ""
    VAR grimoire_textEarthAirAetherTwo = ""
    VAR grimoire_textEarthAirAetherThree = ""

    VAR grimoire_textEarthAirWaterOne = ""
    VAR grimoire_textEarthAirWaterTwo = ""
    VAR grimoire_textEarthAirWaterThree = ""

    VAR grimoire_textEarthAirFireOne = ""
    VAR grimoire_textEarthAirFireTwo = ""
    VAR grimoire_textEarthAirFireThree = ""

    //Più acqua
    VAR grimoire_textEarthWaterAetherOne = ""
    VAR grimoire_textEarthWaterAetherTwo = ""
    VAR grimoire_textEarthWaterAetherThree = ""

    VAR grimoire_textEarthWaterAirOne = ""
    VAR grimoire_textEarthWaterAirTwo = ""
    VAR grimoire_textEarthWaterAirThree = ""

    VAR grimoire_textEarthWaterFireOne = ""
    VAR grimoire_textEarthWaterFireTwo = ""
    VAR grimoire_textEarthWaterFireThree = ""

    //Più spirito
    VAR grimoire_textEarthAetherWaterOne = ""
    VAR grimoire_textEarthAetherWaterTwo = ""
    VAR grimoire_textEarthAetherWaterThree = ""

    VAR grimoire_textEarthAetherAirOne = ""
    VAR grimoire_textEarthAetherAirTwo = ""
    VAR grimoire_textEarthAetherAirThree = ""

    VAR grimoire_textEarthAetherFireOne = ""
    VAR grimoire_textEarthAetherFireTwo = ""
    VAR grimoire_textEarthAetherFireThree = ""

//Dominante Spirito
    //Più fuoco
    VAR grimoire_textAetherFireEarthOne = ""
    VAR grimoire_textAetherFireEarthTwo = ""
    VAR grimoire_textAetherFireEarthThree = ""

    VAR grimoire_textAetherFireWaterOne = ""
    VAR grimoire_textAetherFireWaterTwo = ""
    VAR grimoire_textAetherFireWaterThree = ""

    VAR grimoire_textAetherFireAirOne = ""
    VAR grimoire_textAetherFireAirTwo = ""
    VAR grimoire_textAetherFireAirThree = ""

    //Più aria
    VAR grimoire_textAetherAirEarthOne = ""
    VAR grimoire_textAetherAirEarthTwo = ""
    VAR grimoire_textAetherAirEarthThree = ""

    VAR grimoire_textAetherAirWaterOne = ""
    VAR grimoire_textAetherAirWaterTwo = ""
    VAR grimoire_textAetherAirWaterThree = ""

    VAR grimoire_textAetherAirFireOne = ""
    VAR grimoire_textAetherAirFireTwo = ""
    VAR grimoire_textAetherAirFireThree = ""

    //Più acqua
    VAR grimoire_textAetherWaterEarthOne = ""
    VAR grimoire_textAetherWaterEarthTwo = ""
    VAR grimoire_textAetherWaterEarthThree = ""

    VAR grimoire_textAetherWaterAirOne = ""
    VAR grimoire_textAetherWaterAirTwo = ""
    VAR grimoire_textAetherWaterAirThree = ""

    VAR grimoire_textAetherWaterFireOne = ""
    VAR grimoire_textAetherWaterFireTwo = ""
    VAR grimoire_textAetherWaterFireThree = ""

    //Più terra
    VAR grimoire_textAetherEarthWaterOne = ""
    VAR grimoire_textAetherEarthWaterTwo = ""
    VAR grimoire_textAetherEarthWaterThree = ""

    VAR grimoire_textAetherEarthAirOne = ""
    VAR grimoire_textAetherEarthAirTwo = ""
    VAR grimoire_textAetherEarthAirThree = ""

    VAR grimoire_textAetherEarthFireOne = ""
    VAR grimoire_textAetherEarthFireTwo = ""
    VAR grimoire_textAetherEarthFireThree = ""



//Venti sigilli principali: varianti per la raccolta del testo
    //Dominante acqua
    VAR glyph_textWaterAirOne = "La nube trasforma l’acqua in vita o dolore,"
    VAR glyph_textWaterAirTwo = "similmente l’emozione trasforma il messaggio."

    VAR glyph_textWaterFireOne = "Scavando o collegando,"
    VAR glyph_textWaterFireTwo = "acqua ed emotività mutano il mondo."

    VAR glyph_textWaterAetherOne = "Una fonte gioiosa e una comunicazione trasparente,"
    VAR glyph_textWaterAetherTwo = "tengono in vita una comunità."

    VAR glyph_textWaterEarthOne = "Le acque calme solo in superficie,"
    VAR glyph_textWaterEarthTwo = "come le motivazioni dietro le nostre azioni."

    //Dominante aria
    VAR glyph_textAirAetherOne = "A tavola ci si passa il sale,"
    VAR glyph_textAirAetherTwo = "si condividono esperienze."

    VAR glyph_textAirFireOne = "Cucina e domande trasformano"
    VAR glyph_textAirFireTwo = "il dubbio in sapere."

    VAR glyph_textAirEarthOne = "Una casa solida è"
    VAR glyph_textAirEarthTwo = "spazio per la conoscenza."

    VAR glyph_textAirWaterOne = " La tela raccoglie verità"
    VAR glyph_textAirWaterTwo = "che chiedono bugie per essere comprese."

    //Dominante spirito
    VAR glyph_textAetherAirOne = "Fumo e tradizioni rafforzano"
    VAR glyph_textAetherAirTwo = "quando sono scelte e condivise."

    VAR glyph_textAetherFireOne = "Nel rito si agisce richiamando rabbia,"
    VAR glyph_textAetherFireTwo = "o evocando tutela."

    VAR glyph_textAetherEarthOne = "Lo spirito si accresce"
    VAR glyph_textAetherEarthTwo = "tra le braccia della famiglia scelta."

    VAR glyph_textAetherWaterOne = "La natura ci offre infiniti modi"
    VAR glyph_textAetherWaterTwo = "per bere e vedere il divino."

    //Dominante terra
    VAR glyph_textEarthAirOne = "Capire i propri bisogni separa"
    VAR glyph_textEarthAirTwo = "l’azione dalla reazione."

    VAR glyph_textEarthWaterOne = "L’albero non scinde tronco e linfa,"
    VAR glyph_textEarthWaterTwo = "corpo e mente chiedono cura."

    VAR glyph_textEarthFireOne = "L’estate ci offre la calura,"
    VAR glyph_textEarthFireTwo = "e il frutto per goderne."

    VAR glyph_textEarthAetherOne = "Sotto terra non c’è grossa distinzione"
    VAR glyph_textEarthAetherTwo = "tra l’albero e la foresta."

    //Dominante fuoco
    VAR glyph_textFireAetherOne = "La mappa è una guida per chi"
    VAR glyph_textFireAetherTwo = "ha la meta già scelta."

    VAR glyph_textFireAirOne = "Il gioco è trasformazione simulata,"
    VAR glyph_textFireAirTwo = "e scoperta insensata."

    VAR glyph_textFireEarthOne = "La mano inquieta trova sempre."
    VAR glyph_textFireEarthTwo = "nuovi modi di creare."

    VAR glyph_textFireWaterOne = "La chiave di un vecchio baule è una azione"
    VAR glyph_textFireWaterTwo = "tesa verso il passato."



//Venti sigilli principali: varianti per il grimorio
    //Dominante acqua
    VAR grimoire_textWaterAirOne = ""
    VAR grimoire_textWaterAirTwo = ""

    VAR grimoire_textWaterFireOne = ""
    VAR grimoire_textWaterFireTwo = ""

    VAR grimoire_textWaterAetherOne = ""
    VAR grimoire_textWaterAetherTwo = ""

    VAR grimoire_textWaterEarthOne = ""
    VAR grimoire_textWaterEarthTwo = ""

    //Dominante aria
    VAR grimoire_textAirAetherOne = ""
    VAR grimoire_textAirAetherTwo = ""

    VAR grimoire_textAirFireOne = ""
    VAR grimoire_textAirFireTwo = ""

    VAR grimoire_textAirEarthOne = ""
    VAR grimoire_textAirEarthTwo = ""

    VAR grimoire_textAirWaterOne = ""
    VAR grimoire_textAirWaterTwo = ""

    //Dominante spirito
    VAR grimoire_textAetherAirOne = ""
    VAR grimoire_textAetherAirTwo = ""

    VAR grimoire_textAetherFireOne = ""
    VAR grimoire_textAetherFireTwo = ""

    VAR grimoire_textAetherEarthOne = ""
    VAR grimoire_textAetherEarthTwo = ""

    VAR grimoire_textAetherWaterOne = ""
    VAR grimoire_textAetherWaterTwo = ""

    //Dominante terra
    VAR grimoire_textEarthAirOne = ""
    VAR grimoire_textEarthAirTwo = ""

    VAR grimoire_textEarthWaterOne = ""
    VAR grimoire_textEarthWaterTwo = ""

    VAR grimoire_textEarthFireOne = ""
    VAR grimoire_textEarthFireTwo = ""

    VAR grimoire_textEarthAetherOne = ""
    VAR grimoire_textEarthAetherTwo = ""

    //Dominante fuoco
    VAR grimoire_textFireAetherOne = ""
    VAR grimoire_textFireAetherTwo = ""

    VAR grimoire_textFireAirOne = ""
    VAR grimoire_textFireAirTwo = ""

    VAR grimoire_textFireEarthOne = ""
    VAR grimoire_textFireEarthTwo = ""

    VAR grimoire_textFireWaterOne = ""
    VAR grimoire_textFireWaterTwo = ""    