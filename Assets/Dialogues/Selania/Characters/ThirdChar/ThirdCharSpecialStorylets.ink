//Questi storylets speciali non tornano sulle opzioni di dialogo, ma sul main        
    === open_nest
    //Apertura del nido
    Dialogo in biblioteca.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        + [Scelta blu.]
             -> glyph_modifier_variation_management(SecondCharacter, airC, varPGYes)->
    
        + [Scelta rossa.]
            -> glyph_modifier_variation_management(SecondCharacter, fireC, varPGYes)->
     
        + [Scelta viola.]
                -> glyph_modifier_variation_management(SecondCharacter, aetherC, varPGYes)->
    
        + [Scelta gialla.]
            -> glyph_modifier_variation_management(SecondCharacter, earthC, varPGYes)->
            
        + [Scelta verde.]
            -> glyph_modifier_variation_management(SecondCharacter, waterC, varPGYes)->
        -    
    Ci viene aperto il nido.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral

        -> third_char_closing_storylet ->
        -> opening_places ->
        -> main
        

=== third_read_story_library
~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(thirdChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Ehi {player_name}!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    Prima ho letto una storia strana.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
    Non l'ho capita proprio tantissimo.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    Ma quello che ho capito mi piace.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
    C'è un sassolino.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
    E si ribella.
    Fa le cose che non deve fare.
    E poi mica si ferma lì, ma aiuta altri sassolini.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    E a una certa uno dice di tagliare la testa all'aragosta.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
    Che non ha senso perché se era una cosa fatta dall'aragosta allora sarebbe uscita lei dalla vasca, no?
    Tu cosa fai se ti capita una cosa del genere?#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        
        {
            - are_two_entities_together(FirstCharacter, PG): 
                Non dire che mangi l'aragosta, non dire che mangi l'aragosta, non dire che mangi l'aragosta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                
        }

        + Li incollo, come dice Giracollo: i sassi devono stare fermi.
             -> glyph_modifier_variation_management(ThirdCharacter, airC, varPGYes)->
            Non mi piace come idea.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            No.
            Questa è una cosa crudele.
                {
                - are_two_entities_together(FirstCharacter, PG): 
                    Concordo col bimbo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    
                }
    
        + Indicherei loro un paio di case da distruggere.
            -> glyph_modifier_variation_management(ThirdCharacter, fireC, varPGYes)->
            Uuuh, questa è cattiva!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            Ma mi piace.
            Anche io ne ho un po'!
                {
                    - are_two_entities_together(Mentor, PG): 
                        {player_name}, non dovresti comportarti da persona adulta? #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                }
     
        + Cercherei di capire le loro intenzioni.
            -> glyph_modifier_variation_management(ThirdCharacter, aetherC, varPGYes)->
            Me le sono chieste anche io, sai?#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            Perché alla fine il primo è in prigione.
            E se ci pensi proprio bene tutti i sassi sono in prigione, perché non si muovono da soli!
    
        + Inizierei a saltellare in giro con loro. E fare dispetti al sindaco.
            -> glyph_modifier_variation_management(ThirdCharacter, earthC, varPGYes)->
            Ahah sarebbe divertente!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            Così ci lanciamo contro le finestre poi!
                {
                    - are_two_entities_together(Mentor, PG): 
                        {player_name}, non credo sia il caso di dare a {charNameTwo} altre idee bislacche. #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                }
            
        + Mi sarei pres{player_pronouns has him:o|{player_pronouns has her:a|ə}} cura dell'aragosta.
            -> glyph_modifier_variation_management(ThirdCharacter, waterC, varPGYes)->
            Già.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
            Alla fine non ha mica fatto nulla lei.
            Non capisco perché la vogliono sgozzare.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        -    
    A me mi ha fatto pensare tanto tanto alla scuola.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    Perché alla fine vogliono che ce ne stiamo fermi.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
    E se facciamo qualcosa che non gli piace, allora qualcuno ci vuole sempre legare a terra, come i sassi al pavimento.
    E c'è sempre qualcuno che vuole punirci.
    Ma perché thirdo me i grandi non la vedono mica l'aragosta.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        {
                - are_two_entities_together(Franco, PG):
                    Spesso non vedono neanche le rane.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    O i girini.
                    O l'uomo lucertola.
        }
    Non vedono mai certi problemi.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
    Mi sa che dopo mi leggo qualcosa di nuovo!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    - (bookUpdate)
    
        ~ thirdChar_pauseTalking = thirdChar_pauseDuration
        -> main


=== dog_third_char
    {player_name} {player_name} {player_name} {player_name} {player_name} <b>{player_name} </b>!!!speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
    In giro
    C'è#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
    In giro
    Un
    CANEEEEE!
    {
        - contentsTrainStop has PG:
            {
                - contentsTrainStop has DoggoNoLetters:
                    L'hai visto?!?! Lì sotto al tabellone!
                
                - else:
                    Era lì, sotto al tabellone!     
            }
        - else:
            L'ho visto prima alla stazione ed è adorabileeeeeeeeeeee!
               
    }
    L'hai visto?
    Uh, è tanto carino.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
    Mi ha abbaiato contro.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
    Ma poi son stato fermo e mi ha leccato la mano.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
    Poi si è messo a guardare una lucertola.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
    Ha provato a prenderla, ma ha sbattuto contro l'albero.
    E poi si è messa a fissarmi.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
    C'è un caneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
-> main        