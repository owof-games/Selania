=== main
//Main è il punto da cui passiamo costantemente per caricare i thread di tutto ciò che genera testo in ogni area del gioco.
{debug and (shortStories + averageStories + longStories) != library_unreadStories:
    Errore nella biblioteca!
    -> DONE
}

{
//disabilito missione rana con passaggio da libro riscrittora, così da non doverlo attivare durante testing stocastico
    - debug_stochastic && availableMissions has missionOne:
        ~ availableMissions -= missionOne
        {debug: rimuovo missionOne da availableMissions perché in debug stocastico. availableMissions == {availableMissions}.}
}


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
<- the_witch

//Elementi dello stagno
<- welcoming_frog

//Elementi della serra

//Elementi della cucina

//Elementi della libreria
<- reading_place

//Elementi del nido
<- nest_object

//Elementi del libro
<- first_character_recap
<- second_character_recap
<- third_character_recap
<- fourth_character_recap
<- fifth_character_recap
<- frog_character_recap
<- dog_character_recap
<- witch_character_recap
<- greenhouse_recap
<- kitchen_recap
<- nest_recap
<- rules_recap
<- book_exit_node

//Impostazioni
<- settings_management


+ -> main
