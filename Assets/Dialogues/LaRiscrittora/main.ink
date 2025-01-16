=== main
~ temp my_location = entity_location(PG)
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
@interact 


//Dialoghi del mentore
<- mentore

// //Dialoghi delle anime
// <- anima_uno
// <- anima_due
// <- anima_tre

// //Dialoghi delle animelle
// <- animella_uno
// <- animella_due
// <- animella_tre

//Spostamenti
<- move_between_rooms(my_location)

//Inventario
<- contenuti_inventario

//Elementi del mausoleo
<-lapide_uno
<-lapide_due
<-lapide_tre
<-lapide_quattro
<-lapide_cinque
<-lapide_sei
<-lapide_sette

//Elementi della serra
<- call_test
// <- non_ti_scordar_di_te.step_tre
// <- bacca_della_addolorata.step_tre
// <- la_spazzata.step_tre
// <- canto_delle_compagne.step_tre
// <- muschio_delle_amanti.step_tre
// <- lichene_degli_abissi.step_tre
// <- brina_dell_impossibile.step_tre

//Elementi del giardino
<- panchina

//Elementi gestione interfaccia
<- save
<- load
<- quit

+ -> main
