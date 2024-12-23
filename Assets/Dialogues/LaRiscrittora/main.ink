=== main
~ temp my_location = entity_location(PG)
#background: {tag_background()}
@interact 


//Dialoghi del mentore
<- mentore

//Dialoghi delle anime
<- anima_uno
<- anima_due
<- anima_tre

//Dialoghi delle animelle
<- animella_uno
<- animella_due
<- animella_tre

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

//Elementi del giardino
<- panchina

+ -> main
