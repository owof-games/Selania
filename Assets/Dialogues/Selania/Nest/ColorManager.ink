

// === color_variation_management(PNG, Color, VARPG)
// {debug_nest: passo per color_variation_management. Il valore di PNG è {PNG}, il valore di colore è {Color}. Lo stato della parola attiva è {nest_activeEmotionalWord}.}
// //Primo step: capiamo di chi si parla.

//     {
//     	- PNG == FirstCharacter:
//     	        ~ glyph_currentTalker = FirstCharacter
//     	        {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}.} 
    	 
//     	- PNG == SecondCharacter:
//     	        ~ glyph_currentTalker = SecondCharacter
//     	        {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}.} 
    	 
//     	- PNG == Mentor:
//     	        ~ glyph_currentTalker = Mentor
//     	        {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}.}
    	        
//     	- PNG == PG:
//     	//Nel caso dellx PG, non attivo mai le parole magiche.
//     	        {Color:
//                     -fireC:
//                         ~ player_fire ++
                
//                     -earthC:
//                         ~ player_earth ++
                    
//                     -airC:
//                         ~ player_air ++
                    
//                     -waterC:
//                         ~ player_water ++   
                    
//                     -aetherC:
//                         ~ player_aether ++
//                 }
//                 ->->
    	        
    	    
//         - else: ERROR: sono in color_variation_management ma non trovo lx PNG indicatx
//     }

// //Secondo step: aggiorniamo colori PG se stato positivo
// //Nota: per ora sono tutti i varPGYes, da valutare lato design che farne
// {VARPG == varPGYes:
//     {debug_nest: cambio il colore della PG, perché è la prima volta per questa scelta.}
    
//     {
//         - PNG == FirstCharacter:
//         	    {Color:
//                     -fireC:
//                         ~ player_fire_first_char ++
                
//                     -earthC:
//                         ~ player_earth_first_char ++
                    
//                     -airC:
//                         ~ player_air_first_char ++
                    
//                     -waterC:
//                         ~ player_water_first_char ++   
                    
//                     -aetherC:
//                         ~ player_aether_first_char ++
//                 }
        	 
//         - PNG == SecondCharacter:
//         	    {Color:
//                     -fireC:
//                         ~ player_fire_second_char ++
                
//                     -earthC:
//                         ~ player_earth_second_char ++
                    
//                     -airC:
//                         ~ player_air_second_char ++
                    
//                     -waterC:
//                         ~ player_water_second_char ++   
                    
//                     -aetherC:
//                         ~ player_aether_second_char ++
//                 }
        	 
//         - PNG == Mentor:
//         	  {Color:
//                     -fireC:
//                         ~ player_fire_mentor ++
                
//                     -earthC:
//                         ~ player_earth_mentor ++
                    
//                     -airC:
//                         ~ player_air_mentor ++
                    
//                     -waterC:
//                         ~ player_water_mentor ++   
                    
//                     -aetherC:
//                         ~ player_aether_mentor ++
//             }

//     }
// }    


// //Secondo step: se nest_activeEmotionalWord, andiamo a un nodo di verifica ad hoc per le parole magiche, altrimenti proseguiamo regolarmente.
// {
//     //Se una parola magica è attiva, andiamo al nodo di analisi dedicato
//     - nest_activeEmotionalWord != ():
//         {debug_nest: è attiva la parola magica {nest_activeEmotionalWord}, per cui mi sposto al settore dedicato.}
//             -> emotional_words
    
    
//     //Altrimenti aumentiamo di uno come sempre

//     - else:
//         {Color:
//             -fireC:
//                 ~ glyph_temporaryFire  ++
     
//             -earthC:
//                 ~ glyph_temporaryEarth ++
            
//             -airC:
//                 ~ glyph_temporaryAir++
            
//             -waterC:
//                 ~ glyph_temporaryWater++   
            
//             -aetherC:
//                 ~ glyph_temporaryAether ++
//         }
//         {debug_nest: non è attiva alcuna parola magica, per cui mi aumento di uno i valori e basta.}
//           //E poi aggiorniamo i dettagli
//                 -> update_PNG_color_values
    
// }


// TODO: sistemare questa roba a nest risistemato


// = emotional_words
// // //Qui tracciamo gli effetti generici delle parole
// //     {nest_activeEmotionalWord:
// //         //Variazioni di un solo colore
// //             - Rosso:
// //                 ~ glyph_temporaryFire  ++
// //             - RossoRosso:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
                
// //             - RossoRossoRosso:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
            
// //             - Giallo:
// //                 ~ glyph_temporaryEarth ++
// //             - GialloGiallo:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //             - GialloGialloGiallo:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
            
// //             - Blu:
// //                 ~ glyph_temporaryAir++
// //             - BluBlu:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //             - BluBluBlu:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
            
// //             - Verde:
// //                 ~ glyph_temporaryWater++
// //             - VerdeVerde:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //             - VerdeVerdeVerde:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
            
// //             - Viola:
// //                 ~ glyph_temporaryAether ++
// //             - ViolaViola:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //             - ViolaViolaViola:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
                
// //         //Variazioni di due colori
// //             - RossoRossoBlu:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryAir--
                
// //             - RossoRossoVerde:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryWater--
                
// //             - RossoRossoViola:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryAether --
                
// //             - RossoRossoGiallo:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryEarth --
                
// //             - RossoGiallo:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryEarth --
                
// //             - RossoGialloRosso:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
            
// //             - RossoGialloGiallo:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
            
// //             - RossoBlu:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryAir--
                
// //             - RossoBluBlu:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
            
// //             - RossoBluRosso:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryFire  --
            
// //             - RossoVerde: 
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryWater--
            
// //             - RossoVerdeVerde:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
            
// //             - RossoVerdeRosso:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryFire  --
            
// //             - RossoViola:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryAether --
                
// //             - RossoViolaViola:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
            
// //             - RossoViolaRosso:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryFire  --
            
            
            
            
            
// //             - GialloVerde:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryWater--
        
// //             - GialloViola:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryAether --
            
// //             - GialloRosso:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryFire  --
            
// //             - GialloBlu:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryAir--
                
                
// //             - GialloRossoGiallo:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryEarth --
                
// //             - GialloRossoRosso:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
                
// //             - GialloGialloVerde:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryWater--
                
// //             - GialloGialloViola:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryAether --
                
// //             - GialloGialloBlu:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryAir--
                
// //             - GialloGialloRosso:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryFire  --
                
            
// //             - GialloBluBlu:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
                
// //             - GialloBluGiallo:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryEarth --
                
                
// //             - GialloVerdeVerde:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
                
// //             - GialloVerdeGiallo:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryEarth --
                
// //             - GialloViolaViola:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
                
// //             - GialloViolaGiallo:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryEarth --
                
            
            
            
            
            
            
            
// //             - BluRosso:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryFire  --
                
// //             - BluGiallo:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryEarth --
                
// //             - BluVerde:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryWater--
                
// //             - BluViola:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAether --
                
// //             - BluRossoBlu:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryAir--
                
// //             - BluRossoRosso:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
                
// //             - BluGialloBlu:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryAir--
                
// //             - BluGialloGiallo:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
                
// //             - BluBluVerde:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryWater--
                
// //             - BluBluViola:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAether --
                
// //             - BluBluGiallo:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryEarth --
                
// //             - BluBluRosso:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryFire  --
                
// //             - BluVerdeVerde:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
                
// //             - BluVerdeBlu:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryAir--
                
// //             - BluViolaViola:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
                
            
            
            
            
            
            
            
// //             - VerdeRosso:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryFire  --
                
// //             - VerdeViola:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryAether --
                
// //             - VerdeGiallo:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryEarth --
                
// //             - VerdeBlu:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryAir--
                
// //             - VerdeRossoVerde:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryWater--
                
// //             - VerdeRossoRosso:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
                
// //             - VerdeGialloVerde:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryWater--
                
// //             - VerdeGialloGiallo:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
                
// //             - VerdeBluVerde:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryWater--
                
// //             - VerdeBluBlu:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
                
// //             - VerdeVerdeViola:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryAether --
                
// //             - VerdeVerdeBlu:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryAir--
                
// //             - VerdeVerdeGiallo:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryEarth --
                
// //             - VerdeVerdeRosso:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryFire  --
                
// //             - VerdeViolaVerde:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryWater--
                
// //             - VerdeViolaViola:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
                
            
            
            
            
// //             - ViolaRosso:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryFire  --
                
// //             - ViolaGiallo:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryEarth --
                
// //             - ViolaBlu:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAir--
                
// //             - ViolaVerde:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryWater--
                
// //             - ViolaRossoViola:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryAether --
                
// //             - ViolaRossoRosso:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
                
// //             - ViolaGialloViola:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryAether --
                
// //             - ViolaGialloGiallo:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
                
// //             - ViolaBluViola:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAether --
                
// //             - ViolaBluBlu:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
                
// //             - ViolaVerdeVerde:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
                
// //             - ViolaVerdeViola:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryAether --
                
// //             - ViolaViolaVerde:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryWater--
                
// //             - ViolaViolaBlu:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAir--
                
// //             - ViolaViolaGiallo:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryEarth --
                
// //             - ViolaViolaRosso:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryFire  --
                
        
        
// //         //Varizioni di tre colori
// //             - RossoGialloBlu: 
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryAir--
            
// //             - RossoGialloVerde: 
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryWater--
            
// //             - RossoGialloViola: 
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryAether --
            
// //             - RossoBluVerde: 
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryWater--
            
// //             - RossoBluViola: 
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAether --
            
// //             - RossoBluGiallo: 
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryEarth --
            
// //             - RossoVerdeBlu: 
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryAir--
            
// //             - RossoVerdeViola: 
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryAether --
            
// //             - RossoVerdeGiallo: 
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryEarth --
            
// //             - RossoViolaGiallo:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryEarth --
                
// //             - RossoViolaVerde:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryWater--
                
// //             - RossoViolaBlu:
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++ 
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAir--
                
        
        
        
        
// //             - GialloRossoVerde:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryWater--
                
// //             - GialloRossoViola:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryAether --
                
// //             - GialloRossoBlu:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryAir--
                
// //             - GialloBluVerde:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryWater--
                
// //             - GialloBluViola:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAether --
                
// //             - GialloBluRosso:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryFire  --
                
// //             - GialloVerdeViola:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryAether --
                
// //             - GialloVerdeBlu:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryAir--
                
// //             - GialloVerdeRosso:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryFire  --
                
// //             - GialloViolaVerde:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryWater--
                
// //             - GialloViolaBlu:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAir--
                
// //             - GialloViolaRosso:
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryEarth ++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryFire  --
                
                
                
                
                
            
// //             - BluRossoVerde:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryFire  ++
// //                 ~ glyph_temporaryFire  ++
                
// //             - BluRossoViola:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryAether --
                
// //             - BluRossoGiallo:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryEarth --
                
// //             - BluGialloVerde:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryWater--
                
// //             - BluGialloViola:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryAether --
                
// //             - BluGialloRosso:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryFire  --
                
// //             - BluVerdeViola:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryAether --
                
// //             - BluVerdeGiallo:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryEarth --
                
// //             - BluVerdeRosso:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryFire  --
                
// //             - BluViolaVerde:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryWater--
                
// //             - BluViolaBlu:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAir--
                
// //             - BluViolaGiallo:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryEarth --
                
// //             - BluViolaRosso:
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAir++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryFire  --
                
            
// //             - VerdeRossoViola:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryAether --
                
// //             - VerdeRossoBlu:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryAir--
                
// //             - VerdeRossoGiallo:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryEarth --
                
// //             - VerdeGialloViola:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryAether --
                
// //             - VerdeGialloBlu:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryAir--
                
// //             - VerdeBluViola:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAether --
                
// //             - VerdeBluGiallo:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryEarth --
                
// //             - VerdeBluRosso:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryFire  --
                
// //             - VerdeGialloRosso:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryFire  --
                
// //             - VerdeViolaBlu:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAir--
                
// //             - VerdeViolaGiallo:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryEarth --
                
// //             - VerdeViolaRosso:
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryWater++
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryAether --
// //                 ~ glyph_temporaryFire  --
                
            
            
            
            
            
            
            
// //             - ViolaRossoVerde:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryWater--
                
// //             - ViolaRossoBlu:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryAir--
                
// //             - ViolaRossoGiallo:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryFire  --
// //                 ~ glyph_temporaryEarth --
                
// //             - ViolaGialloVerde:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryWater--
                
// //             - ViolaGialloBlu:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryAir--
                
// //             - ViolaGialloRosso:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryEarth --
// //                 ~ glyph_temporaryFire  --
                
// //             - ViolaBluVerde:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryWater--
                
// //             - ViolaBluGiallo:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryEarth --
                
// //             - ViolaBluRosso:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryAir--
// //                 ~ glyph_temporaryFire  --
                
            
// //             - ViolaVerdeBlu:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryAir--
                
// //             - ViolaVerdeGiallo:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryEarth --
                
// //             - ViolaVerdeRosso:
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryAether ++
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryWater--
// //                 ~ glyph_temporaryFire  --
                
            
// //             -else: Valore colore parola {nest_activeEmotionalWord} non trovato!
// //     }




// // //E poi andiamo alle reazioni
// //     {
// //         - glyph_currentTalker == FirstCharacter:
// //             -> firstCharEmotionalActions
        
// //         - glyph_currentTalker == SecondCharacter:
// //             -> secondCharEmotionalActions
        
// //         - glyph_currentTalker == Mentor:
// //             -> fifthCharEmotionalActions
    
// //     }

// //     //Le reazioni le creiamo e gestiamo per gruppi di parole, non per singola parola.

        
// //         = firstCharEmotionalActions
// //             {debug_nest: entro in firstCharEmotionalActions.}
            
// //             {
 
// //                 //Varianti monocolore
// //                     - nest_redWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_yellowWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_blueWords  has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_greenWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_purpleWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                
// //                 //Varianti a dominante Rosso
// //                     - nest_redYellowWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_redBlueWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_redGreenWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_redPurpleWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                
// //                 //Varianti a dominante Giallo
// //                     - nest_yellowRedWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_yellowBlueWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_yellowGreenWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_yellowPurpleWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                
// //                 //Varianti a dominate blu
// //                     - nest_blueRedWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_blueYellowWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_blueGreenWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_bluePurpleWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                
// //                 //Varianti a dominante verde
// //                     - nest_greenRedWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_greenYellowWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_greenBlueWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_greenPurpleWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                
// //                 //Varianti a dominante viola
// //                     - nest_purpleRedWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_purpleYellowWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_purpleBlueWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //                     - nest_purpleGreenWords has nest_activeEmotionalWord:
// //                         Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
// //             }
        
        
// //             -> word_state_manager
        
        
// //         = secondCharEmotionalActions
// //             {debug_nest: entro in secondCharEmotionalActions.}
// //             {
 
// //                 //Varianti monocolore
// //                     - nest_redWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_yellowWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_blueWords  has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_greenWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_purpleWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                
// //                 //Varianti a dominante Rosso
// //                     - nest_redYellowWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_redBlueWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_redGreenWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_redPurpleWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                
// //                 //Varianti a dominante Giallo
// //                     - nest_yellowRedWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_yellowBlueWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_yellowGreenWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_yellowPurpleWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                
// //                 //Varianti a dominate blu
// //                     - nest_blueRedWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_blueYellowWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_blueGreenWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_bluePurpleWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                
// //                 //Varianti a dominante verde
// //                     - nest_greenRedWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_greenYellowWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_greenBlueWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_greenPurpleWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                
// //                 //Varianti a dominante viola
// //                     - nest_purpleRedWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_purpleYellowWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_purpleBlueWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //                     - nest_purpleGreenWords has nest_activeEmotionalWord:
// //                         Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
// //             }
        
        
// //             -> word_state_manager
        
        
// //         = fifthCharEmotionalActions
// //             {debug_nest: entro in fifthCharEmotionalActions.}
// //             {
 
// //                 //Varianti monocolore
// //                     - nest_redWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_yellowWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_blueWords  has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_greenWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_purpleWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                
// //                 //Varianti a dominante Rosso
// //                     - nest_redYellowWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_redBlueWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_redGreenWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_redPurpleWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                
// //                 //Varianti a dominante Giallo
// //                     - nest_yellowRedWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_yellowBlueWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_yellowGreenWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_yellowPurpleWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                
// //                 //Varianti a dominate blu
// //                     - nest_blueRedWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_blueYellowWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_blueGreenWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_bluePurpleWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                
// //                 //Varianti a dominante verde
// //                     - nest_greenRedWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_greenYellowWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_greenBlueWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_greenPurpleWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                
// //                 //Varianti a dominante viola
// //                     - nest_purpleRedWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_purpleYellowWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_purpleBlueWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //                     - nest_purpleGreenWords has nest_activeEmotionalWord:
// //                         Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
// //             }
        
            
//             -> word_state_manager
        
        
//         = word_state_manager
//             {debug_nest: entro in word_state_manager.}
//         //Qui abbasso l'uso della parola, e se il suo uso è esaurito, la disattivo    
//             {debug_nest: prima di modificare glyph_temporaryWordUsageCounter il suo valore è {glyph_temporaryWordUsageCounter}.}
//                 ~ glyph_temporaryWordUsageCounter --
//             {debug_nest: dopo aver ridotto glyph_temporaryWordUsageCounter il suo valore è {glyph_temporaryWordUsageCounter}.}
            
//                 {
//                     - glyph_temporaryWordUsageCounter == 0:
//                     L'effetto di {nest_activeEmotionalWord} si è esaurito.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
//                         ~ nest_activeEmotionalWord = ()
//                 }
        
//         -> update_PNG_color_values


// = update_PNG_color_values
//     {debug_nest: entro in update_PNG_color_values.}
//     {debug_nest: prima dell'operazione il parlante attuale è {glyph_currentTalker}.}
//     //Prima aggiorniamo i dati a seconda dei parlanti
//     {
//         - glyph_currentTalker == FirstCharacter:
//             ~ firstChar_fire+= glyph_temporaryFire 
//             ~ firstChar_earth += glyph_temporaryEarth
//             ~ firstChar_air += glyph_temporaryAir
//             ~ firstChar_water += glyph_temporaryWater
//             ~ firstChar_aether += glyph_temporaryAether
        
//         - glyph_currentTalker == SecondCharacter:
//             ~ secondChar_fire += glyph_temporaryFire 
//             ~ secondChar_earth += glyph_temporaryEarth
//             ~ secondChar_air += glyph_temporaryAir
//             ~ secondChar_water += glyph_temporaryWater
//             ~ secondChar_aether += glyph_temporaryAether
        
//         - glyph_currentTalker == Mentor:
//             ~ mentor_fire += glyph_temporaryFire 
//             ~ mentor_earth += glyph_temporaryEarth
//             ~ mentor_air += glyph_temporaryAir
//             ~ mentor_water += glyph_temporaryWater
//             ~ mentor_aether += glyph_temporaryAether
//     }

//     //Poi azzeriamo i valori temporanei
//         ~ glyph_currentTalker = ()
//         ~ glyph_temporaryFire  = 0
//         ~ glyph_temporaryEarth = 0
//         ~ glyph_temporaryAir= 0
//         ~ glyph_temporaryWater= 0
//         ~ glyph_temporaryAether = 0
//     {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}.}

// ->->

