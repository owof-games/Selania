=== main
@interact
~ temp my_location = entity_location(PG)

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


+ -> main
