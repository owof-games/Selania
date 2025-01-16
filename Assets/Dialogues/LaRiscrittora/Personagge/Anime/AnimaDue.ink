// === anima_due
// + {are_two_entities_together(AnimaDue, PG)} [AnimaDue]
//     ~ counterLuoghi = 0
//     -> parlareConAnima

// = parlareConAnima
// {
//     - not stitch_uno:
//     -> stitch_uno
//     - not stitch_due:
//     -> stitch_due
//     - not stitch_tre:
//     -> stitch_tre
//     - else: storie finite seconda anima ->->
// }

//     = stitch_uno
//         AnimaDue: StitchUno: Avrò una storia da raccontarti con il secondo prototipo, per ora sono qui perché <i>dev</i> deve capire se la frequenza di comparsa è sensata.
//             + [Ok, alla prossima.]
//                 ~ move_entity(AnimaDue, CasettaAnime) 
//                 -> main

//     = stitch_due
//         AnimaDue: Stitch Due: Avrò una storia da raccontarti con il secondo prototipo, per ora sono qui perché <i>dev</i> deve capire se la frequenza di comparsa è sensata.
//             + [Ok, alla prossima.]
//                 ~ move_entity(AnimaDue, CasettaAnime)
//                 -> main
    
//     = stitch_tre
//         AnimaDue: Stitch Tre: Avrò una storia da raccontarti con il secondo prototipo, per ora sono qui perché <i>dev</i> deve capire se la frequenza di comparsa è sensata.
//             + [Ok, alla prossima.]
//                 ~ move_entity(AnimaDue, CasettaAnime)
//                 -> main