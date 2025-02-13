=== main
~ temp my_location = entity_location(PG)
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
@interact 

//Dialoghi del mentore
<- mentor

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


//Elementi della serra
<- call_test


//Elementi del giardino
<- bench
<- the_fungus

//Elementi della fermata del bus
<- starting_note
<- first_character_notes
<- second_character_notes
<- third_character_notes
<- fourth_character_notes
<- fifth_character_notes



//Elementi gestione interfaccia
// <- save
// <- load
// <- quit

+ -> main
