=== take_this_book
//Se non abbiamo raccolto il libro della riscrittora autonomamente
    Ehi, {player_name}!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    Prima ai piedi di quel vecchio tronco ho trovato questo libro.
    E ha il tuo nome.
    Hai unə ammiratorə segretə?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
        {
            - are_two_entities_together(SecondCharacter, PG):Bleah!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        } 
    Comunque ho pensato fosse il caso di dartelo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        
        ~ move_entity(WitchRecap, BookPlace)
        ~ move_entity(miniBook, Bedroom)
        ~ move_entity(nightTable, Bedroom)
        @animation:RewriterBook
        ~ player_somethingStrange ++
            
            {
                - forestContents has PG:
                    ~ move_entity(RewriterBook, Forest)
                - trainStopContents has PG:
                    ~ move_entity(RewriterBook, TrainStop)
                - pondContents has PG:
                    ~ move_entity(RewriterBook, Pond)        
            }
            
        -> main


=== open_the_kitchen
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Dopo che {mentorName} mi ha detto che sei qui per aiutarci mi sono detta: come posso rendere la vita più facile a {player_name}?
    Alla fine ti stai ascoltando le mie seghe mentali da un bel po’.
    E immagino che anche il piccoletto avrà i suoi casini da gestire.
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }

    E {mentorName} mi sta simpatica, ma adora parlare di lavoro, non la cosa più riposante.
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }
        
    Poi ho trovato qualcosa di inaspettato dietro il pontile: una cucina abbandonata.
    Mi son messa a sistemarla tra una chiacchierata e l’altra, principalmente sperando di trovare qualcosa da mangiare.
    E man mano mi sono ricordata delle belle chiacchiere che mi son fatta a tavola.
    Il cibo apre alle confidenze.
    E quindi, ecco il mio regalo per te, {player_name}: un posto dove cucinare in compagnia, per conoscerci meglio.
    E visto che di solito siamo noi a decidere di cosa parlarti, ho già avvisato {charNameTwo} che a questo giro sarai tu a decidere di cosa parlare.
    Per cui: quando ti butta bene invita qualcunx di noi a cucinare, e vediamo che salta fuori.
    Magari scopri anche qualcosa di utile per il tuo lavoro qui.
    Che ne dici?

    //Risposte.    
    
        + [Scelta blu.]
             -> color_variation_management(FirstCharacter, blueC)->
    
        + [Scelta rossa.]
            -> color_variation_management(FirstCharacter, redC)->
     
        + [Scelta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
    
        + [Scelta gialla.]
            -> color_variation_management(FirstCharacter, yellowC)->
            
        + [Scelta verde.]
            -> color_variation_management(FirstCharacter, greenC)->
        -    
    
    Comunque: quando vuoi cucinare con qualcuna di noi, basta che ce lo chiedi.
        ~ firstChar_pauseTalking = firstChar_pauseDuration
        -> opening_places ->
        -> main
        
=== a_story_of_revenge 
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    Chitarra ha letto il racconto di Aza
    
     //Risposte.    
    
        + [Scelta blu.]
             -> color_variation_management(FirstCharacter, blueC)->
    
        + [Scelta viola.]
            -> color_variation_management(FirstCharacter, purpleC)->
            
        + [Scelta gialla.]
            -> color_variation_management(FirstCharacter, yellowC)->
            
        + [Scelta verde.]
            -> color_variation_management(FirstCharacter, greenC)->
            
        + [Scelta rossa.]
            -> color_variation_management(FirstCharacter, redC)->

        -    
    
    Comunque: quando vuoi cucinare con qualcuna di noi, basta che ce lo chiedi.
        ~ firstChar_pauseTalking = firstChar_pauseDuration

        -> main
    
    