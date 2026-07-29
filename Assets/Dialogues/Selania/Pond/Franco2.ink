=== franco_pond
{debug_frog: Entro in franco2}
+ {are_two_entities_together(Franco, PG) && entity_location(PG) == Pond} [Franco]

// check if Franco is tired
{ frog_tiredValue > 0:
    -> franco_is_tired
}

// check franco special storylets
-> franco_special_storylets ->

// end
-> main



= franco_is_tired

    {charTag(Franco, "party")}:                     Girino!
    {charTag(Franco, "neutral")}:                   Franco è stanchino ora.
                                                    Torna più tardi e provo a darti una zampa.
    {charTag(Franco, "question")}:                  Basta che poi me la restituisci, sennò non so come grattare la schiena di zio Gracco.
                                                    
                                                        ~ move_entity(Franco, Safekeeping)

    -> main




/*
 * SPECIAL STORYLETS
 */


= franco_special_storylets

    // compute special storylet for third char: there's been a problem with the gifted object, with the ingredient in the kitchen, or with the universal ingredient in the kitchen
    ~ temp thirdCharDiscrepancy = frog_third_char_object_gift == thirdChar_giftedObject && thirdChar_giftedObject != ()
    ~ thirdCharDiscrepancy = thirdCharDiscrepancy || frog_third_char_object_ingredient == kitchen_thirdCharExtraIngredient && frog_third_char_object_ingredient != ()
    ~ thirdCharDiscrepancy = thirdCharDiscrepancy || frog_third_char_object_ingredient == universalIngredient

    {   //Prima presentazione
        - grimoire_franco hasnt grimFrancoFirst:
            -> franco_special_storylets_intro ->

        - thirdCharDiscrepancy && grimoire_franco hasnt grimFrancoThirdIngredientFailure:
            -> franco_special_storylets_third_ingredient_failure ->

        - not franco_special_storylets_open_kitchen && player_accessiblePlaces has Kitchen:
            -> franco_special_storylets_open_kitchen ->

        - not franco_special_storylets_open_library && player_accessiblePlaces has Nest:
            -> franco_special_storylets_open_library ->

        - not franco_special_storylets_open_nest && player_accessiblePlaces has Library:
            -> franco_special_storylets_open_nest ->   
    }

->->


= franco_special_storylets_intro

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    

    {charTag(Franco, "question")}:                  Ma dove avevo messo quel.
    {charTag(Franco, "party")}:                     Eccola cra!
    {charTag(Franco, "neutral")}:                   No.
                                                    No no no questo è disgustoso.
                                                    Eppure.
    {charTag(Franco, "party")}:                     Ehi!
                                                    Tu devi essere {player_name}!
    {charTag(Franco, "neutral")}:                   Io sono Franco La Rana!
                                                        ~ frog_nameDiscovered = true
    {charTag(Franco, "party")}:                     {charNameTwo} mi ha parlato di te.
                                                    Ha una bella testolina quel girino!
    {
        - are_two_entities_together(SecondCharacter, PG):
                                                    {charTag(SecondCharacter, "energy")}:       Anche la tua mi piace, Franco!
    }
    {charTag(Franco, "neutral")}:                   Sei qui sicuramente qui per il dono.
    {charTag(Franco, "party")}:                     Come si dice: chi dorme non piglia lombrichi.
    {charTag(Franco, "neutral")}:                   Dovrei averlo qui.
    {charTag(Franco, "question")}:                  No.
                                                    Dove l'ho messo?
                                                    L'avranno preso i gemelli?
    {charTag(Franco, "neutral")}:                   Facciamo così: mentre lo cerco ti do qualcosa da fare.
                                                    Ma non una cosa da fare qualsiasi.
    {charTag(Franco, "party")}:                     Qualcosa di utile per chi vive questo posto.
    {charTag(Franco, "neutral")}:                   Come dice zia Graaak: una zampa vale l'altra.
    {charTag(Franco, "question")}:                  Non che zia Graaak sia particolarmente brava negli affari.
                                                    Ma sempre meglio di mio cugino Braaak, che ha venduto una foglia di loto intera per una biscia.
    {charTag(Franco, "neutral")}:                   Al funerale erano tutti molto molto imbarazzati.
                                                    Tranne la biscia: quella aveva ancora fame.
    {charTag(Franco, "party")}:                     Insomma: tu aiuti me, e io aiuto te.
                                                    Ad esempio dandoti dei consigli sulle cose da donare a una persona.
    {charTag(Franco, "neutral")}:                   O recuperando una pianta che hai già usato.
        {
            - are_two_entities_together(FirstCharacter, PG):
                                                    {charTag(FirstCharacter, "affectionate")}:       Livello di confusione: sì.
        }
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "jester")}:        Rana: mi sento ubriaco e non ho manco bevuto!
        }

    ~ grimoire_franco += grimFrancoFirst

->->


= franco_special_storylets_third_ingredient_failure

    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)

    {charTag(Franco, "question")}:                          Franco si fa delle domande, ma non trova delle risposte.
    {charTag(Franco, "neutral")}:                           Ed è strano girino, perché Franco ha sempre delle risposte.
                                                            Anche se non sono sempre giuste.
    {
    - frog_third_char_object_gift == thirdChar_giftedObject:
                                                            Ho visto che hai dato a {charNameThree} il dono che ti ho consigliato, ma ha reagito male.

    - frog_third_char_object_ingredient == universalIngredient:
                                                            Ho visto che cucinando con {charNameThree} hai aggiunto la Zandelia, che dovrebbe piacere a tutti, ma lui ha reagito male.

    - else:
                                                            Ho visto che cucinando con {charNameThree} hai aggiunto l'ingrediente che ti ho consigliato, ma ha reagito male.                                                 
    }                                                
    {charTag(Franco, "neutral")}:                           Franco è triste per questa cosa, sai?
                                                            Perché vuole davvero aiutare tutti.
                                                            Ed è sicuro di aver dato a {player_name} il giusto consiglio.
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "jester")}:                Pensavi di avere davanti un libro aperto, vero Franchì?
        }                                            
        {
        - are_two_entities_together(FirstCharacter, PG):
        {charTag(FirstCharacter, "annoyed")}:               Franco, non ti crucciare: per sapere di cosa ha bisogno, {charNameThree} dovrebbe farsi delle domande.
                                                            E non credo sia il suo forte.
            {
            - are_two_entities_together(ThirdCharacter, PG):
            {charTag(ThirdCharacter, "bored")}:             Almeno non sono la regina delle paranoie.
            }                                          
        }                                            
    {charTag(Franco, "question")}:                          Cosa è andato storto?
    {charTag(Franco, "neutral")}:                           A parte il naso di zia Graaak.
    {charTag(Franco, "reading")}:	                        Franco indagherà su questa cosa, promesso.
    {charTag(Franco, "neutral")}:                           Non il naso di zia Graaak, ovvio, ma quell'altra cosa.
                                                            Quella.
    {charTag(Franco, "question")}:                          Quale?                                                              
    {charTag(Franco, "party")}:                             Ma ciao girino!

    ~ grimoire_franco += grimFrancoThirdIngredientFailure

->->


=== franco_special_storylets_open_kitchen
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    

    {charTag(Franco, "party")}:                     Girino!
    {charTag(Franco, "neutral")}:                   Ora che {charNameOne} ti ha aperto la cucina, posso darti delle dritte anche su quale ingrediente aggiungere quando cucini con una persona!
    {charTag(Franco, "party")}:                     Non è una cosa francosissima?!?
                                                    Che è tipo bellissima, solo più bagnaticcia.


->->

=== franco_special_storylets_open_library
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    

    {charTag(Franco, "party")}:                     Girino!
    {charTag(Franco, "neutral")}:                   {charNameTwo} ti ha aperto la biblioteca, e io ora ti apro la possibilità di conoscere quale racconto amano le persone che vuoi aiutare!
                                                    Così ne potete parlare.
                                                    O gracchiare.
    {charTag(Franco, "question")}:                  Qui gracchiano tutti molto poco.
    {charTag(Franco, "party")}:                     Craack.

->->

=== franco_special_storylets_open_nest
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    

    {charTag(Franco, "party")}:                     Girino!
    {charTag(Franco, "neutral")}:                   Ho saputo che {charNameThree} ha aperto il nido.
                                                    Qui non posso fare miracoli, perché quei sigilli sono un graaaack casino.
    {charTag(Franco, "party")}:                     Ma posso recuperartene uno che hai utilizzato.
    {charTag(Franco, "neutral")}:                   Uno ce la faccio.
                                                    Poi sono troppo pesanti per le mie zampine.
      
->->