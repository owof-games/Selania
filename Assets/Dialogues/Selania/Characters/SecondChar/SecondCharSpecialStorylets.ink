//Questi storylets speciali non tornano sulle opzioni di dialogo, ma sul main        
    === not_talk
        ~ temp mentorName = translator(mentor_ActualName)
        
        {not_talk: 
        
            - 1: 
                Io ODIO {not welcome:quella strega coi petali| {mentorName}}!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                E non ci parlerò
                mai
                MAI
                PIU'!
                Mi ha fatto male!
            
            - else: 
                {stopping:
                    - Non ci parlo con chi è {player_pronouns has him:amico|{player_pronouns has her:amica|amicə}} di quella là!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry   
                    
                    - Hai risolto le cose con quella?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry   
                    
                    - Mi ha fatto male, e tu sei qui a non fare nulla?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry   
                    
                    - Vai via!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry   
                }
                   
        }

        {
            - are_two_entities_together(Mentor, PG) && (not that_little_liar_storylet):
                ~ mentor_riccioMentoreViciniColpo = true
                -> that_little_liar_storylet  

            - else:
                -> main           
        }
                


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

    Ehi {player_name}!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    Prima ho letto una storia strana.
    Non l'ho capita proprio tantissimo.
    Ma quello che ho capito mi piace.
    C'è un sassolino.
    E si ribella.
    Fa le cose che non deve fare.
    E poi mica si ferma lì, ma aiuta altri sassolini.
    E a una certa uno dice di tagliare la testa all'aragosta.
    Che non ha senso perché se era una cosa fatta dall'aragosta allora sarebbe uscita lei dalla vasca, no?
    Tu cosa fai se ti capita una cosa del genere?
        
        {
            - are_two_entities_together(FirstCharacter, PG): 
                Non dire che mangi l'aragosta, non dire che mangi l'aragosta, non dire che mangi l'aragosta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                
        }

        + [Li incollo, come dice Giracollo: i sassi devono stare fermi.]
             -> color_variation_management(SecondCharacter, blueC)->
            Non mi piace come idea.
            No.
            Questa è una cosa crudele.
                {
                - are_two_entities_together(FirstCharacter, PG): 
                    Concordo col bimbo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    
                }
    
        + [Indicherei loro un paio di case da distruggere.]
            -> color_variation_management(SecondCharacter, redC)->
            Uuuh, questa è cattiva!
            Ma mi piace.
            Anche io ne ho un po'!
                {
                    - are_two_entities_together(Mentor, PG): 
                        {player_name}, non dovresti comportarti da persona adulta? #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                }
     
        + [Cercherei di capire le loro intenzioni.]
            -> color_variation_management(SecondCharacter, purpleC)->
            Me le sono chieste anche io, sai?
            Perché alla fine il primo è in prigione.
            E se ci pensi proprio bene tutti i sassi sono in prigione, perché non si muovono da soli!
    
        + [Inizierei a saltellare in giro con loro. E fare dispetti al sindaco.]
            -> color_variation_management(SecondCharacter, yellowC)->
            Ahah sarebbe divertente!
            Così ci lanciamo contro le finestre poi!
                {
                    - are_two_entities_together(Mentor, PG): 
                        {player_name}, non credo sia il caso di dare a {charNameTwo} altre idee bislacche. #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                }
            
        + [Mi sarei pres{player_pronouns has him:o|{player_pronouns has her:a|ə}} cura dell'aragosta.]
            -> color_variation_management(SecondCharacter, greenC)->
            Già.
            Alla fine non ha mica fatto nulla lei.
            Non capisco perché la vogliono sgozzare.
        -    
    A me mi ha fatto pensare tanto tanto alla scuola.
    Perché alla fine vogliono che ce ne stiamo fermi fermi.
    E se facciamo qualcosa che non gli piace, allora qualcuno ci vuole sempre legare a terra, come i sassi al pavimento.
    E c'è sempre qualcuno che vuole punirci.
    Ma perché secondo me i grandi non la vedono mica l'aragosta.
    Non vedono mai certi problemi.    
    Mi sa che dopo mi leggo qualcosa di nuovo!
    
        ~ secondChar_pauseTalking = secondChar_pauseDuration
        -> main


=== dog_second_char
    {player_name} {player_name} {player_name} {player_name} {player_name} <b>{player_name} </b>!!!
    C'è
    In giro
    Un
    CANEEEEE!
    {
        - contentsTrainStop has PG:
            {
                - contentsTrainStop has DoggoNoNotes:
                    L'hai visto?!?! Lì sotto al tabellone!
                
                - else:
                    Era lì, sotto al tabellone!     
            }
        - else:
            L'ho visto prima alla stazione ed è adorabileeeeeeeeeeee!
               
    }
    L'hai visto?
    Uh, è tanto carino.
    Mi ha abbaiato contro.
    Ma poi son stato fermo e mi ha leccato la mano.
    Poi si è messo a guardare una lucertola.
    Ha provato a prenderla, ma ha sbattuto contro l'albero.
    E poi si è messa a fissarmi.
    C'è un caneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee!
-> main        