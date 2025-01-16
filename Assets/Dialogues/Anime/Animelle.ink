// === animella_uno
// + {are_two_entities_together(AnimellaUno, PG)} [AnimellaUno] 
//     -> parlareConAnimella

// = parlareConAnimella
//     {
//     - alcolismo == false:
//         {
//         - debug: alcolismo attivo, salto storia, propongo altra
//         -> random_animelle
//         }
//     }
//     //Se alcolismo attivo come trigger, salto la storia
//         AnimellaUno: Avrò una storia da raccontarti con il secondo prototipo, per ora sono qui perché <i>dev</i> deve capire se la frequenza di comparsa è sensata.
//             + [Ok, alla prossima.]
//         //A conversazione finita con l'animella, torna nella casetta.
//                 ~ move_entity(AnimellaUno, CasettaAnime)            
//                 -> main    



// === animella_due
// + {are_two_entities_together(AnimellaDue, PG)} [AnimellaDue] 
//     -> parlareConAnimella
// = parlareConAnimella 
//         AnimellaDue: Avrò una storia da raccontarti con il secondo prototipo, per ora sono qui perché <i>dev</i> deve capire se la frequenza di comparsa è sensata.
//             + [Ok, alla prossima.]
//                 ~ move_entity(AnimellaDue, CasettaAnime)            
//                 -> main  


// === animella_tre
// + {are_two_entities_together(AnimellaTre, PG)} [AnimellaTre] 
//     -> parlareConAnimella

// = parlareConAnimella
//         AnimellaTre: Avrò una storia da raccontarti con il secondo prototipo, per ora sono qui perché <i>dev</i> deve capire se la frequenza di comparsa è sensata.
//             + [Ok, alla prossima.]
//                 ~ move_entity(AnimellaTre, CasettaAnime)            
//                 -> main  
