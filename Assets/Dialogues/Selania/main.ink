=== main
//Main è il punto da cui passiamo costantemente per caricare i thread di tutto ciò che genera testo in ogni area del gioco.

~ temp my_location = entity_location(PG)
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
@interact 



//Spostamenti
<- move_between_rooms(my_location)

//Inventario
<- inventory_contents

//Personagge
<- first_character
<- second_character
<- third_character
<- fourth_character
<- fifth_character

//Elementi della fermata del bus
<- starting_note
<- first_character_notes
<- second_character_notes
<- third_character_notes
<- fourth_character_notes
<- fifth_character_notes

//Elementi della foresta
<- bench
<- the_fungus

//Elementi dello stagno
<- the_frog

//Elementi della serra
<- call_test


//Elementi della libreria
<- reading_place

//Elementi del libro della riscrittora
<- book_exit_node

+ -> main
