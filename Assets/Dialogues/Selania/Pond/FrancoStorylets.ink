// /*******************************

//     Elementi vari di storia

// ******************************/ 
// === franco_intro
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
    

//     {charTag(Franco, "question")}:                  Ma dove avevo messo quel.
//     {charTag(Franco, "party")}:                     Eccola cra!
//     {charTag(Franco, "neutral")}:                   No.
//                                                     No no no questo è disgustoso.
//                                                     Eppure.
//     {charTag(Franco, "party")}:                     Ehi!
//                                                     Tu devi essere {player_name}!
//     {charTag(Franco, "neutral")}:                   Io sono Franco La Rana!
//                                                         ~ frog_nameDiscovered = true
//     {charTag(Franco, "party")}:                     {charNameTwo} mi ha parlato di te.
//                                                     Ha una bella testolina quel girino!
//     {
//         - are_two_entities_together(SecondCharacter, PG):
//                                                     {charTag(SecondCharacter, "energy")}:       Anche la tua mi piace, Franco!
//     }
//     {charTag(Franco, "neutral")}:                   Sei qui sicuramente qui per il dono.
//     {charTag(Franco, "party")}:                     Come si dice: chi dorme non piglia lombrichi.
//     {charTag(Franco, "neutral")}:                   Dovrei averlo qui.
//     {charTag(Franco, "question")}:                  No.
//                                                     Dove l'ho messo?
//                                                     L'avranno preso i gemelli?
//     {charTag(Franco, "neutral")}:                   Facciamo così: mentre lo cerco ti do qualcosa da fare.
//                                                     Ma non una cosa da fare qualsiasi.
//     {charTag(Franco, "party")}:                     Qualcosa di utile per chi vive questo posto.
//     {charTag(Franco, "neutral")}:                   Come dice zia Graaak: una zampa vale l'altra.
//     {charTag(Franco, "question")}:                  Non che zia Graaak sia particolarmente brava negli affari.
//                                                     Ma sempre meglio di mio cugino Braaak, che ha venduto una foglia di loto intera per una biscia.
//     {charTag(Franco, "neutral")}:                   Al funerale erano tutti molto molto imbarazzati.
//                                                     Tranne la biscia: quella aveva ancora fame.
//     {charTag(Franco, "party")}:                     Insomma: tu aiuti me, e io aiuto te.
//                                                     Ad esempio dandoti dei consigli sulle cose da donare a una persona.
//     {charTag(Franco, "neutral")}:                   O recuperando una pianta che hai già usato.
//         {
//             - are_two_entities_together(FirstCharacter, PG):
//                                                     {charTag(FirstCharacter, "affectionate")}:       Livello di confusione: sì.
//         }
//         {
//         - are_two_entities_together(ThirdCharacter, PG):
//         {charTag(ThirdCharacter, "jester")}:        Rana: mi sento ubriaco e non ho manco bevuto!
//         }

//     ~ grimoire_franco += grimFrancoFirst
    
//     -> welcoming_frog.top2


// === franco_open_kitchen
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
    

//     {charTag(Franco, "party")}:                     Girino!
//     {charTag(Franco, "neutral")}:                   Ora che {charNameOne} ti ha aperto la cucina, posso darti delle dritte anche su quale ingrediente aggiungere quando cucini con una persona!
//     {charTag(Franco, "party")}:                     Non è una cosa francosissima?!?
//                                                     Che è tipo bellissima, solo più bagnaticcia.


//     ->->

// === franco_open_library
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
    

//     {charTag(Franco, "party")}:                     Girino!
//     {charTag(Franco, "neutral")}:                   {charNameTwo} ti ha aperto la biblioteca, e io ora ti apro la possibilità di conoscere quale racconto amano le persone che vuoi aiutare!
//                                                     Così ne potete parlare.
//                                                     O gracchiare.
//     {charTag(Franco, "question")}:                  Qui gracchiano tutti molto poco.
//     {charTag(Franco, "party")}:                     Craack.

//     ->->

// === franco_open_nest
//     ~ temp charNameThree = translator(thirdChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
    

//     {charTag(Franco, "party")}:                     Girino!
//     {charTag(Franco, "neutral")}:                   Ho saputo che {charNameThree} ha aperto il nido.
//                                                     Qui non posso fare miracoli, perché quei sigilli sono un graaaack casino.
//     {charTag(Franco, "party")}:                     Ma posso recuperartene uno che hai utilizzato.
//     {charTag(Franco, "neutral")}:                   Uno ce la faccio.
//                                                     Poi sono troppo pesanti per le mie zampine.
      
//     ->->

// === franco_third_ingredient_failure
//     ~ temp charNameThree = translator(thirdChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)

//     {charTag(Franco, "question")}:                          Franco si fa delle domande, ma non trova delle risposte.
//     {charTag(Franco, "neutral")}:                           Ed è strano girino, perché Franco ha sempre delle risposte.
//                                                             Anche se non sono sempre giuste.
//     {
//     - frog_third_char_object_gift == thirdChar_giftedObject:
//                                                             Ho visto che hai dato a {charNameThree} il dono che ti ho consigliato, ma ha reagito male.

//     - frog_third_char_object_ingredient == universalIngredient:
//                                                             Ho visto che cucinando con {charNameThree} hai aggiunto la Zandelia, che dovrebbe piacere a tutti, ma lui ha reagito male.

//     - else:
//                                                             Ho visto che cucinando con {charNameThree} hai aggiunto l'ingrediente che ti ho consigliato, ma ha reagito male.                                                 
//     }                                                
//     {charTag(Franco, "neutral")}:                           Franco è triste per questa cosa, sai?
//                                                             Perché vuole davvero aiutare tutti.
//                                                             Ed è sicuro di aver dato a {player_name} il giusto consiglio.
//         {
//         - are_two_entities_together(ThirdCharacter, PG):
//         {charTag(ThirdCharacter, "jester")}:                Pensavi di avere davanti un libro aperto, vero Franchì?
//         }                                            
//         {
//         - are_two_entities_together(FirstCharacter, PG):
//         {charTag(FirstCharacter, "annoyed")}:               Franco, non ti crucciare: per sapere di cosa ha bisogno, {charNameThree} dovrebbe farsi delle domande.
//                                                             E non credo sia il suo forte.
//             {
//             - are_two_entities_together(ThirdCharacter, PG):
//             {charTag(ThirdCharacter, "bored")}:             Almeno non sono la regina delle paranoie.
//             }                                          
//         }                                            
//     {charTag(Franco, "question")}:                          Cosa è andato storto?
//     {charTag(Franco, "neutral")}:                           A parte il naso di zia Graaak.
//     {charTag(Franco, "reading")}:	                        Franco indagherà su questa cosa, promesso.
//     {charTag(Franco, "neutral")}:                           Non il naso di zia Graaak, ovvio, ma quell'altra cosa.
//                                                             Quella.
//     {charTag(Franco, "question")}:                          Quale?                                                              
//     {charTag(Franco, "party")}:                             Ma ciao girino!

//     ~ grimoire_franco += grimFrancoThirdIngredientFailure
// ->->


// === franco_feedback_mission_one_closed ===
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

//         {charTag(Franco, "party")}:                     Ehi girino, grazie ancora per prima.
//         {charTag(Franco, "neutral")}:                   Euforbo all'inizio era confuso, si è portato il sigillo in camera.
//                                                         Poi è venuto in soggiorno a fare le sue cose, e quando i suoi fratelli gli hanno dato noia <>

//         {
//             - glyph_earthFireSigils has nest_francoChosenSigil:
//                                                         all'inizio si è agitato, ma poi ha iniziato a nuotare veloce veloce e a scaricare la tensione.
//             - glyph_earthAirSigils has nest_francoChosenSigil:
//                                                         ha preso un grande respiro e poi si è messo a cucinare con Tullio, e si è rilassato.
//             - glyph_earthWaterSigils has nest_francoChosenSigil:
//                                                         li ha ignorati, si è messo le sue cuffie preferite e ha iniziato a disegnare, ed era tutto felice.
//             - glyph_earthAetherSigils has nest_francoChosenSigil:
//                                                         si è avvicinato a Giulio, e si è messo a leggere con lui.
//         }

//                                                         Per il resto della serata l'ho visto più sereno.
//         {charTag(Franco, "party")}:                     Ha anche riso a una mia battuta!
        
//     ~ grimoire_franco += grimFrancoSpecialMissionOneFeedback
//     -> welcoming_frog.top2


// === franco_allDocuments ===
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

//     {charTag(Franco, "party")}:                         Girino!
//                                                         Hai trovato tutti i documenti della vecchia congrega!
//     {charTag(Franco, "question")}:                      E tu mi dirai: "Come fai a saperlo, Franco?"
//     {charTag(Franco, "neutral")}:                       E io ti dirò: "Perché Franco sa tutto! Tranne nuotare."
//                                                         Soprattutto se è Franco a fare le cose.
//     {charTag(Franco, "question")}:                      Anche se non me le ricordo proprio tutte tutte.
//                                                         Tipo come quando apro il frigo e poi non ricordo perché l'ho aperto.
//                                                         E poi ci trovo dentro la tessera della palestra a cui non sono mai andato.
//                                                         E zia Graaak che si fa un pisolino.
//     {charTag(Franco, "neutral")}:                       Una volta ha dormito così tanto che quando si è svegliata aveva altri centoquindici nipotini!
//                                                         Mia sorella è molto pratica, e quindi li ha chiamati per numero.
//                                                         Uh, una lettera di Euforbo!
//     {charTag(Franco, "reading")}:	                    "Papà, devi dire a {player_name} che abbiamo messo in giro noi i documenti!"
//     {charTag(Franco, "party")}:                         Giusto!
//     {charTag(Franco, "neutral")}:                       Ero lì che mi dicevo: "Mmm, quando mi spiegano le cose tutte assieme mi distraggo, e a quel punto non capisco proprio nulla."
//                                                         Ma ho pensato fosse importante per te conoscere quella storia.
//     {charTag(Franco, "question")}:                      E a quel punto mi son detto: "Ok Franco, facciamo un gioco. Ogni volta che {player_name} fa certe cose, metti un nuovo documento sulla panchina."
//                                                         E ho fatto anche uno schema molto colorato che spiegava quando dovevo darti i documenti.
//     {charTag(Franco, "neutral")}:                       Ma poi me lo sono dimenticato.
//                                                         Fino a quando poco fa Euforbo non mi ha detto "Ehi papà, ho trovato una logica per dare quei vecchi appunti a {player_name}".
//                                                         E visto che sa che a volte mi distraggo, ha fatto tutto lui il lavoro.
//                                                         Devo ringraziarlo.
//     {charTag(Franco, "party")}:                         Magari gli compro il prossimo "Starview Galley".
                                
//         ~ grimoire_franco += grimFrancoAllDocuments
//     -> welcoming_frog.top2

