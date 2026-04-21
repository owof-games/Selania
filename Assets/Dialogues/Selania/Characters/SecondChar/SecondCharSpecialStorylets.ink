//Questi storylets speciali non tornano sulle opzioni di dialogo, ma sul main        
    === not_talk
        ~ temp mentorName = translator(mentor_ActualName)
        
        {not_talk: 
        
            - 1: 
                {charTag(SecondCharacter, "angry")}:        Io ODIO {not tutorial_mentorTalkingChoiceRelationship:quella strega coi petali| {mentorName}}!
                E non ci parlerò
                mai
                MAI
                PIU'!
                Mi ha fatto male!
            
            - else: 
                {stopping:
                    - {charTag(SecondCharacter, "angry")}:        Non ci parlo con chi è {player_pronouns has him:amico|{player_pronouns has her:amica|amicə}} di quella là!   
                    
                    - {charTag(SecondCharacter, "angry")}:        Hai risolto le cose con quella?   
                    
                    - {charTag(SecondCharacter, "angry")}:        Mi ha fatto male, e tu sei qui a non fare nulla?   
                    
                    - {charTag(SecondCharacter, "angry")}:        Vai via!   
                }
                   
        }

        {
            - are_two_entities_together(Mentor, PG) && grimoire_fifthChar hasnt grimMentorLiar:
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

    {charTag(SecondCharacter, "neutral")}:        Ehi {player_name}!
    Prima mi stavo annoiando tanto.
    Ma proprio taaaaaaaaaanto.
    {charTag(SecondCharacter, "energy")}:       E ho cercato di capire cosa c'era dietro tutti quei legni.
    Perché {mentorName} non me lo dice mica.
        {
            - are_two_entities_together(Mentor, PG):
                {charTag(Mentor, "sad")}:               I posti chiusi sono posti pericolosi, {charNameTwo}.
                                                        E nemmeno io so cosa c'è dietro.
                {charTag(SecondCharacter, "angry")}:        Va bene va bene va bene.
        }
    {charTag(SecondCharacter, "energy")}:       C'è una cosa fighissima lì dietro.
    Prova a immaginare qual è la cosa più bella che puoi trovare.

        + \ {charTag(PG, "neutral")}:         Un laboratorio di chimica?
                -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "energy")}:       Non ci avevo pensato cavolo!
            Magari!
            {charTag(SecondCharacter, "neutral")}:        Va bene: ho trovato la <i>seconda</i> cosa più bella che puoi trovare!
            E niente può esplodere.
            Credo!
    
        + \ {charTag(PG, "neutral")}:         Un campetto da calcio!
                -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "angry")}:        Ma mi hai ascoltato quando ho parlato?
            Ti sembro uno che gioca a calcio?!?
     
        + \ {charTag(PG, "neutral")}:         Un luogo dove meditare?
                -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "neutral")}:        ...
                                                        Davvero?
                                                        La cosa più bella per te è un posto dove devi dormire seduto?    
    
        + \ {charTag(PG, "neutral")}:         La stanza dei videogiochi!
                -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "neutral")}:        Circa.
                                                        Non c'è un video.
            {charTag(SecondCharacter, "energy")}:       Ma con alcuni ci puoi giocare.
            
        + \ {charTag(PG, "neutral")}:         Una camera con tutti i tuoi amici?
                -> glyph_modifier_variation_management(SecondCharacter, waterC)->
            {charTag(SecondCharacter, "melanchonic")}:    Sarebbe vuota.
            {charTag(SecondCharacter, "angry")}:        No.
        -
    {charTag(SecondCharacter, "energy")}:       {player_name}: ho trovato una <b>biblioteca!</b>     
    Ed è bellissima!  
        {
            - are_two_entities_together(FirstCharacter, PG):
                Tu sei un bambino davvero strano.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                Molto molto strano.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate   
        } 
    {charTag(SecondCharacter, "neutral")}:        Ci sono anche i librogame, credo.
                                                    E ho già letto due racconti.
                                                    Ora voglio vedere se ci sono delle matite così lascio anche le mie storie!
        {
            - are_two_entities_together(Mentor, PG):
                {charTag(Mentor, "neutral")}:           Mi raccomando, non macchiare nulla!
        }
    {charTag(SecondCharacter, "energy")}:       Ora sposto tutti quei legni così puoi andarci anche tu!
    Chissà se ci sono anche i manga!

        -> second_char_closing_storylet ->
        ~ opening_places()
        ->->
        

=== a_story_of_rebellion
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(SecondCharacter, "energy")}:       {charTag(SecondCharacter, "neutral")}:        Ehi {player_name}!
    Prima ho letto una storia strana.
    {charTag(SecondCharacter, "neutral")}:        Non l'ho capita proprio tantissimo.
    {charTag(SecondCharacter, "emotional")}:        Ma quello che ho capito mi piace.
    {charTag(SecondCharacter, "energy")}:       C'è un sassolino.
    E si ribella.
    Fa le cose che non deve fare.
    {charTag(SecondCharacter, "neutral")}:        E poi mica si ferma lì, ma aiuta altri sassolini.
    {charTag(SecondCharacter, "angry")}:        E a una certa uno dice di tagliare la testa all'aragosta.
    Che non ha senso perché se era una cosa fatta dall'aragosta allora sarebbe uscita lei dalla vasca, no?
    {charTag(SecondCharacter, "neutral")}:        Tu cosa fai se ti capita una cosa del genere?
        
        {
            - are_two_entities_together(FirstCharacter, PG): 
                Non dire che mangi l'aragosta, non dire che mangi l'aragosta, non dire che mangi l'aragosta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                
        }

        + \ {charTag(PG, "neutral")}:         Li incollo, come dice Giracollo: i sassi devono stare fermi.
             -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "angry")}:        Non mi piace come idea.
            No.
            Questa è una cosa crudele.
                {
                - are_two_entities_together(FirstCharacter, PG): 
                    Concordo col bimbo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    
                }
    
        + \ {charTag(PG, "neutral")}:         Indicherei loro un paio di case da distruggere.
            -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "energy")}:       Uuuh, questa è cattiva!
            Ma mi piace.
            Anche io ne ho un po'!
                {
                    - are_two_entities_together(Mentor, PG): 
                        {charTag(Mentor, "hurry")}:             {player_name}, non dovresti comportarti da persona adulta?
                }
     
        + \ {charTag(PG, "neutral")}:         Cercherei di capire le loro intenzioni.
            -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "neutral")}:        Me le sono chieste anche io, sai?
                                                             Perché alla fine il primo è in prigione.
                                                            E se ci pensi proprio bene tutti i sassi sono in prigione, perché non si muovono da soli!
    
        + \ {charTag(PG, "neutral")}:         Inizierei a saltellare in giro con loro. E fare dispetti al sindaco.
            -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "energy")}:       Ahah sarebbe divertente!
            Così ci lanciamo contro le finestre poi!
                {
                    - are_two_entities_together(Mentor, PG): 
                        {charTag(Mentor, "bored")}:            {player_name}, non credo sia il caso di dare a {charNameTwo} altre idee bislacche.
                }
            
        + \ {charTag(PG, "neutral")}:         Mi sarei pres{player_pronouns has him:o|{player_pronouns has her:a|ə}} cura dell'aragosta.
            -> glyph_modifier_variation_management(SecondCharacter, waterC)->
            {charTag(SecondCharacter, "emotional")}:        Già.
            Alla fine non ha mica fatto nulla lei.
            {charTag(SecondCharacter, "angry")}:        Non capisco perché la vogliono sgozzare.
        -    
    {charTag(SecondCharacter, "neutral")}:        A me mi ha fatto pensare tanto tanto alla scuola.
    {charTag(SecondCharacter, "angry")}:        Perché alla fine vogliono che ce ne stiamo fermi.
    E se facciamo qualcosa che non gli piace, allora qualcuno ci vuole sempre legare a terra, come i sassi al pavimento.
    E c'è sempre qualcuno che vuole punirci.
    {charTag(SecondCharacter, "neutral")}:        Ma perché secondo me i grandi non la vedono mica l'aragosta.
        {
                - are_two_entities_together(Franco, PG):
                    {charTag(Franco, "{portrait_Franco()}")}:       Spesso non vedono neanche le rane.
                                                                    O i girini.
                                                                    O l'uomo lucertola.
        }
    {charTag(SecondCharacter, "melanchonic")}:    Non vedono mai certi problemi.
    {charTag(SecondCharacter, "neutral")}:        Mi sa che dopo mi leggo qualcosa di nuovo!
    
        -> second_char_closing_storylet ->
        ->->


=== dog_second_char
    {charTag(SecondCharacter, "energy")}:       {player_name} {player_name} {player_name} {player_name} {player_name} <b>{player_name} </b>!!!speaker:{secondChar_tag()}
    In giro
    {charTag(SecondCharacter, "energy")}:       C'è
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
    {charTag(SecondCharacter, "emotional")}:        Uh, è tanto carino.
    {charTag(SecondCharacter, "melanchonic")}:    Mi ha abbaiato contro.
    {charTag(SecondCharacter, "emotional")}:        Ma poi son stato fermo e mi ha leccato la mano.
    {charTag(SecondCharacter, "energy")}:       Poi si è messo a guardare una lucertola.
    Ha provato a prenderla, ma ha sbattuto contro l'albero.
    {charTag(SecondCharacter, "emotional")}:        E poi si è messa a fissarmi.
    {charTag(SecondCharacter, "energy")}:       C'è un caneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee!

        -> second_char_closing_storylet ->
        ->->       