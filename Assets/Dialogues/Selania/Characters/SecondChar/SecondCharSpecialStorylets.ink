=== open_the_library
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Ehi {player_name}!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    Prima mi stavo annoiando tanto.
    Ma proprio taaaaaaaaaanto.
    E ho cercato di capire cosa c'era dietro tutti quei legni.
    Perché {mentorName} non me lo dice mica.
        {
            - are_two_entities_together(Mentor, PG):
                I posti chiusi sono posti pericolosi, {charNameTwo}.
                E nemmeno io so cosa c'è dietro. 
        }
    E c'è una cosa fighissima.
    Prova a immaginare qual è la cosa più bella che puoi trovare.

        + [Un laboratorio di chimica?]
            -> color_variation_management(SecondCharacter, blueC)->
            Non ci avevo pensato cavolo!
            Magari!
            Va bene: ho trovato la <i>seconda</i> cosa più bella che puoi trovare!
            E niente può esplodere.
            Credo!
    
        + [Un campetto da calcio!]
            -> color_variation_management(SecondCharacter, redC)->
            Ma mi hai ascoltato quando ho parlato?
            Ti sembro uno che gioca a calcio?!?
     
        + [Un luogo dove meditare?]
            -> color_variation_management(SecondCharacter, purpleC)->
            ...
            Davvero?
            La cosa più bella per te è un posto dove devi dormire seduto?    
    
        + [La stanza dei videogiochi!]
            -> color_variation_management(SecondCharacter, yellowC)->
            Circa.
            Non c'è un video.
            Ma con alcuni ci puoi giocare.
            
        + [Una camera con tutti i tuoi amici?]
            -> color_variation_management(SecondCharacter, greenC)->
            Sarebbe vuota.
            No.
        -
    {player_name}: ho trovato una <b>biblioteca!</b>     
    Ed è bellissima!  
        {
            - are_two_entities_together(FirstCharacter, PG):
                Tu sei un bambino davvero strano.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                Molto molto strano.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate   
        } 
    Ci sono anche i librogame, credo.
    E ho già letto due racconti.
    Ora voglio vedere se ci sono delle matite così lascio anche le mie storie!
        {
            - are_two_entities_together(Mentor, PG):
                Mi raccomando, non macchiare nulla!
        }
    E ora sposto tutti quei legni così puoi andarci anche tu!
    Chissà se ci sono anche i manga!
        ~ secondChar_pauseTalking = secondChar_pauseDuration
        -> opening_places ->
        -> main
        

=== a_story_of_rebellion
~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
Qui Riccio ci dice che ha letto <b>Il sassolino</b> e ci chiede cosa ne pensiamo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        
        {
                - are_two_entities_together(Mentor, PG): Commento mentore. #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
}
            {
                - are_two_entities_together(FirstCharacter, PG): Commento Chitarra!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    
            } 

        + [Scelta blu.]
             -> color_variation_management(SecondCharacter, blueC)->
    
        + [Scelta rossa.]
            -> color_variation_management(SecondCharacter, redC)->
     
        + [Scelta viola.]
                -> color_variation_management(SecondCharacter, purpleC)->
    
        + [Scelta gialla.]
            -> color_variation_management(SecondCharacter, yellowC)->
            
        + [Scelta verde.]
            -> color_variation_management(SecondCharacter, greenC)->
        -    
        
        ~ secondChar_pauseTalking = secondChar_pauseDuration
        -> main


=== dog_second_char
Commento sul cane

-> main        