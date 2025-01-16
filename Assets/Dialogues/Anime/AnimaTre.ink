// === anima_tre
// + {are_two_entities_together(AnimaTre, PG)} [AnimaTre]
//     ~ counterLuoghi = 0
//     -> parlareConAnima

// = parlareConAnima
// {
//     - not stitch_uno:
//         -> stitch_uno
//     - not stitch_due:
//         -> stitch_due
//     - not stitch_tre:
//         -> stitch_tre
//     - else: storie finite terza anima ->->
// }

//     = stitch_uno
//         AnimaTre: StitchUno: Avrò una storia da raccontarti con il secondo prototipo, per ora sono qui perché <i>dev</i> deve capire se la frequenza di comparsa è sensata.
//             + [Ok, alla prossima.]
//                 ~ move_entity(AnimaTre, CasettaAnime)
//                 -> main
    
//     = stitch_due
//         AnimaTre: StitchDue: Avrò una storia da raccontarti con il secondo prototipo, per ora sono qui perché <i>dev</i> deve capire se la frequenza di comparsa è sensata.
//             + [Ok, alla prossima.]
//                 ~ move_entity(AnimaTre, CasettaAnime)
//                 -> main
    
//     = stitch_tre
//         AnimaTre: StitchTre:  Avrò una storia da raccontarti con il secondo prototipo, per ora sono qui perché <i>dev</i> deve capire se la frequenza di comparsa è sensata.
//             + [Ok, alla prossima.]
//                 ~ move_entity(AnimaTre, CasettaAnime)
//                 -> main
// ->->