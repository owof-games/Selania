//Questi storylets speciali non tornano sulle opzioni di dialogo, ma sul main        
    === not_talk
    ~ temp charNameFive = translator(fifthChar_ActualName)    
        
    {not_talk: 
    
        - 1: 
            {charTag(SecondCharacter, "angry")}:                Io ODIO {grimoire_appendices hasnt grimChoicesMentor:quella strega coi petali| {charNameFive}}!
                                                                E non ci parlerò
                                                                mai
                                                                MAI
                                                                PIU'!
                                                                Mi ha fatto male!
                {
                - are_two_entities_together(ThirdCharacter, PG):
                {charTag(ThirdCharacter, "neutral")}:           La zia? Cosa può aver mai fatto?     
                }                                                 
        
        - else: 
        {stopping:
            - {charTag(SecondCharacter, "angry")}:              Non ci parlo con chi è {player_pronoun has him:amico|{player_pronoun has her:amica|amicə}} di quella là!   
            
            - {charTag(SecondCharacter, "angry")}:              Hai risolto le cose con quella?   
            
            - {charTag(SecondCharacter, "angry")}:              Mi ha fatto male, e tu sei qui a non fare nulla?   
            
            - {charTag(SecondCharacter, "angry")}:              Vai via!   
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
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

    {charTag(SecondCharacter, "neutral")}:                      Ehi {player_name}!
                                                                Prima mi stavo annoiando tanto.
                                                                Ma proprio taaaaaaaaaanto.
    {charTag(SecondCharacter, "energy")}:                       E ho cercato di capire cosa c'era dietro tutti quei legni.
                                                                Perché {charNameFive} non me lo dice mica.
        {
            - second_char_main_storylets.eight.ragione:
            {charTag(SecondCharacter, "emotional")}:                E tu mi hai detto di non dare sempre ragione ai grandi.
        }                                                     
        {
            - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "sad")}:                       I posti chiusi sono posti pericolosi, {charNameTwo}.
                                                                    E nemmeno io so cosa c'è dietro.
            {charTag(SecondCharacter, "angry")}:                    Va bene va bene va bene.
        }
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "jester")}:                    Ma abbiamo un ribelle qui tra noi!
        }
    {charTag(SecondCharacter, "energy")}:                       C'è una cosa fighissima lì dietro.
                                                                Prova a immaginare qual è la cosa più bella che puoi trovare.

        + \ {charTag(PG, "neutral")}:                           Un museo?
                -> glyph_choice_manager(false, airC)->
        {charTag(SecondCharacter, "energy")}:                   Non ci avevo pensato cavolo!
                                                                Magari!
        {charTag(SecondCharacter, "neutral")}:                  Va bene: ho trovato la <i>seconda</i> cosa più bella che puoi trovare!
                                                                E senza roba impagliata.
                                                                Credo.
    
        + \ {charTag(PG, "neutral")}:                           Un campetto da calcio!
                -> glyph_choice_manager(false, fireC)->
            {
            - are_two_entities_together(ThirdCharacter, PG):
            {charTag(ThirdCharacter, "neutral")}:               No dai sarebbe bellissimo!
            }    
        {charTag(SecondCharacter, "angry")}:                    Ma mi hai ascoltato quando ho parlato?
                                                                Ti sembro uno che gioca a calcio?!?
     
        + \ {charTag(PG, "neutral")}:                           Un luogo dove meditare?
                -> glyph_choice_manager(false, aetherC)->
        {charTag(SecondCharacter, "neutral")}:                  ...
                                                                Davvero?
                                                                La cosa più bella per te è un posto dove devi dormire seduto?    

        + \ {charTag(PG, "neutral")}:                           Un posto dove dormire?//troppo vicino alla meditazione
                -> glyph_choice_manager(false, earthC)->
        {charTag(SecondCharacter, "neutral")}:                  Tu e {charNameOne} siete uguali.
            {
            - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:               Non c'è vergogna nell'ammettere la propria stanchezza, piccoletto!
            }           
        {charTag(SecondCharacter, "neutral")}:                  No, è un posto interessante.
        {charTag(SecondCharacter, "energy")}:                   Ma c'è anche una poltrona!
            
        + \ {charTag(PG, "neutral")}:                           Una camera con tutti i tuoi amici?
                -> glyph_choice_manager(false, waterC)->
        {charTag(SecondCharacter, "melanchonic")}:              Sarebbe vuota.
        {charTag(SecondCharacter, "angry")}:                    No.
        -
    {charTag(SecondCharacter, "energy")}:                       {player_name}: ho trovato una <b>biblioteca!</b>     
                                                                Ed è bellissima!  
        {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "neutral")}:                   Tu sei un bambino davvero strano.
            {charTag(FirstCharacter, "affectionate")}:              Adorabilmente strano.
        } 
    {charTag(SecondCharacter, "neutral")}:                      Ci sono anche i librogame, credo.
                                                                E ho già letto due racconti.
                                                                Ora voglio vedere se ci sono delle matite così lascio anche le mie storie!
        {
            - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "neutral")}:               Mi raccomando, non macchiare nulla!
        }
    {charTag(SecondCharacter, "energy")}:                       Ora sposto tutti quei legni così puoi andarci anche tu!
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "neutral")}:                   Guarda che ti aiuto, va!
        }
                                                                Chissà se ci sono anche i manga!

        -> second_char_closing_storylet ->
            ~ opening_places()
        ->->
        

=== a_story_of_rebellion
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

    {charTag(SecondCharacter, "energy")}:                       Ehi {player_name}!
                                                                Prima ho letto una storia strana.
    {charTag(SecondCharacter, "neutral")}:                      Non l'ho capita proprio tantissimo.
    {charTag(SecondCharacter, "emotional")}:                    Ma quello che ho capito mi piace.
    {charTag(SecondCharacter, "energy")}:                       C'è un sassolino.
                                                                E si ribella.
                                                                Fa le cose che non deve fare.
    {charTag(SecondCharacter, "neutral")}:                      E poi mica si ferma lì, ma aiuta altri sassolini.
    {charTag(SecondCharacter, "angry")}:                        E a una certa uno dice di tagliare la testa all'aragosta.
                                                                Che non ha senso perché se era una cosa fatta dall'aragosta allora sarebbe uscita lei dalla vasca, no?
        {
            - second_char_main_storylets.six.imparato:
            {charTag(SecondCharacter, "angry")}:                    È proprio come quando prima mi hai detto che i castighi non servono a niente!
        }                                                     
    {charTag(SecondCharacter, "neutral")}:                      Tu cosa fai se ti capita una cosa del genere?
        
        {
            - are_two_entities_together(FirstCharacter, PG): 
            {charTag(FirstCharacter, "annoyed")}:                   Non dire che mangi l'aragosta, non dire che mangi l'aragosta, non dire che mangi l'aragosta. 
                
        }

    //Qui può essere un buon posto per mostrare le cinque nature dei sigilli, e dividere tra "capire cosa pensano, cosa vogliono, cosa provano" etc.
        + \ {charTag(PG, "neutral")}:                           Vorrei sapere cosa pensano, come ragionano, come vedono le cose.
             -> glyph_choice_manager(false, airC)->
        {charTag(SecondCharacter, "hurry")}:                    Sììììììì!
                                                                Mi piace tantissimo questa cosa!
                                                                Lì nessuno sembra volerli conoscere!
                                                                E il primo è in prigione.
                                                                E se ci pensi proprio bene tutti i sassi sono in prigione, perché non si muovono da soli!

        + \ {charTag(PG, "neutral")}:                           Indicherei loro un paio di case da distruggere.
            -> glyph_choice_manager(false, fireC)->
            {
            - are_two_entities_together(ThirdCharacter, PG):
            {charTag(ThirdCharacter, "jester")}:                {player_name} ha scelto la violenza!
            }
        {charTag(SecondCharacter, "energy")}:                   Uuuh, questa è cattiva!
                                                                Ma mi piace.
                                                                Anche io ne ho un po'!
        {
            - are_two_entities_together(Mentor, PG): 
            {charTag(FifthCharacter, "hurry")}:                 {player_name}, non dovresti dire cose da persona più adulta?
        }
     
        + \ {charTag(PG, "neutral")}:                           Guarderei ciò che fanno, per capire di cosa hanno bisogno.
            -> glyph_choice_manager(false, aetherC)->
        {charTag(SecondCharacter, "neutral")}:                  Me le sono chiesto anche io, sai?
                                                                Non ho capito proprio quello di cui hanno bisogno.
                                                                A parte essere liberi.
                                                                Perché alla fine il primo è in prigione.
                                                                E se ci pensi proprio bene tutti i sassi sono in prigione, perché non si muovono da soli!

        + \ {charTag(PG, "neutral")}:                           Li porterei in braccio dove devono andare, così fanno meno fatica!
            -> glyph_choice_manager(false, earthC)->
        {charTag(SecondCharacter, "energy")}:                   Così poi hanno più energia per rompere le finestre!                          
            {
            - are_two_entities_together(Mentor, PG): 
            {charTag(FifthCharacter, "bored")}:                     {player_name}, non credo sia il caso di dare a {charNameTwo} altre idee bislacche.
            }
            
        + \ {charTag(PG, "neutral")}:                           Mi sarei pres{player_pronoun has him:o|{player_pronoun has her:a|ə}} cura dell'aragosta.
            -> glyph_choice_manager(false, waterC)->
        {charTag(SecondCharacter, "emotional")}:                Già.
                                                                Alla fine non ha mica fatto nulla lei.
        {charTag(SecondCharacter, "angry")}:                    Non capisco perché la vogliono sgozzare.
        -    
    {charTag(SecondCharacter, "neutral")}:                      A me mi ha fatto pensare tanto tanto alla scuola.
    {charTag(SecondCharacter, "angry")}:                        Perché alla fine vogliono che ce ne stiamo fermi.
                                                                E se facciamo qualcosa che non gli piace, allora qualcuno ci vuole sempre legare a terra, come i sassi al pavimento.
                                                                E c'è sempre qualcuno che vuole punirci.
    {charTag(SecondCharacter, "neutral")}:                      Ma perché secondo me i grandi non la vedono mica l'aragosta.
        {
        - are_two_entities_together(Franco, PG):
        {charTag(Franco, "neutral")}:                               Spesso non vedono neanche le rane.
                                                                    O i girini.
        {charTag(Franco, "question")}:                              O l'uomo lucertola.
        }
    {charTag(SecondCharacter, "melanchonic")}:                  I grandi non vedono mai certi problemi.
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "neutral")}:                   Ma perché c'abbiamo già i nostri casini, fratellino.
        }
    {charTag(SecondCharacter, "neutral")}:                      Mi sa che dopo mi leggo qualcosa di nuovo!
    
        -> second_char_closing_storylet ->
        ->->


=== dog_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    {charTag(SecondCharacter, "energy")}:                       {player_name} {player_name} {player_name} {player_name} {player_name} <b>{player_name}</b>!!!
    {charTag(SecondCharacter, "energy")}:                       C'è
                                                                In
                                                                Giro
                                                                Una
                                                                CAGNOLINAAAAAAAAAAAAAAAAAAAA!
    {
        - contentsTrainStop has PG:
            {
                - contentsTrainStop has DoggoNoLetters:
                                                                L'hai vista?!?! Lì alla fermata!
                
                - else:
                                                                Era lì, alla fermata!     
            }
        - else:
                                                                L'ho vista prima alla stazione ed è adorabileeeeeeeeeeee!
               
    }
                                                                L'hai vista?
    {charTag(SecondCharacter, "emotional")}:                    Uh, è tanto carina.
    {charTag(SecondCharacter, "melanchonic")}:                  Anche se mi ha abbaiato contro.
    {charTag(SecondCharacter, "emotional")}:                    Ma poi sono stato fermo e mi ha leccato la mano.
    {charTag(SecondCharacter, "energy")}:                       Poi si è messa a guardare una lucertola.
                                                                Ha provato a prenderla, ma ha sbattuto contro l'albero.
    {charTag(SecondCharacter, "emotional")}:                    E poi si è messa a fissarmi, offesa.
    {charTag(SecondCharacter, "energy")}:                       C'è un caneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee!

        -> second_char_closing_storylet ->
        ->-> 


===  second_char_third_char_departure_comment
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    {charTag(SecondCharacter, "melanchonic")}:                  È stato brutto sentire urlare così {charNameThree}.
                                                                Si sentiva ovunque.
                                                                Nessuno dovrebbe urlarti così {player_name}.

    {charTag(SecondCharacter, "angry")}:                        Se torna chiamo mio fratello e lo picchio!
    
        -> second_char_closing_storylet ->
        ->-> 