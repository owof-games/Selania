=== main
~ temp my_location = entity_location(PG)
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
@interact 


//Dialoghi del mentore
<- mentore

//Spostamenti
<- move_between_rooms(my_location)

//Inventario
<- contenuti_inventario

//Personagge da aiutare
<-personaggia_uno
<-personaggia_due
<-personaggia_tre
<-personaggia_quattro
<-personaggia_cinque
<-personaggia_sei
<-personaggia_sette

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
<- bench
<- tree

//Elementi della fermata del bus
<- note_personaggia_uno
<- note_personaggia_due
<- note_personaggia_tre
<- note_personaggia_quattro
<- note_personaggia_cinque
<- note_personaggia_sei
<- note_personaggia_sette


//Elementi gestione interfaccia
<- save
<- load
<- quit

+ -> main
