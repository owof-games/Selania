=== main
//Main è il punto da cui passiamo costantemente per caricare i thread di tutto ciò che genera testo in ogni area del gioco.
{debug and (library_shortStories + library_averageStories + library_longStories) != library_unreadStories:
    Errore nella biblioteca!
    -> DONE
} 

{
//disabilito missione rana con passaggio da libro riscrittora, così da non doverlo attivare durante testing stocastico
    - debug_stochastic && frog_availableCommonMissions has missionOne:
        ~ frog_availableCommonMissions -= missionOne
        {debug: rimuovo missionOne da frog_availableCommonMissions perché in debug stocastico. frog_availableCommonMissions == {frog_availableCommonMissions}.}
}

{
//disabilito missione rana con passaggio da biblioteca, visto che è bloccata
    - debug_stochastic && frog_availableCommonMissions has missionEight:
        ~ frog_availableCommonMissions -= missionEight
        {debug: rimuovo missionOne da frog_availableCommonMissions perché in debug stocastico. frog_availableCommonMissions == {frog_availableCommonMissions}.}
}


{
    - not gm_rm_activation:
    -> gm_rm_activation
}


~ temp my_location = entity_location(PG)
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}


//Notifiche
-> notification_system ->
//Passaggio per debug per aprire tutte le aree che si aprirebbero solo più avanti nel gioco
-> debug_places_open ->
//Avvio degli storylets comuni
-> automatic_storylets ->

~ set_up_glyphs()

@interact 
//Spostamenti
<- move_between_rooms(my_location)

//Personagge
<- mentor_character
<- first_character
<- second_character
<- third_character
<- fourth_character
<- fifth_character
<- talking_Carla

//Elementi della fermata del bus
<- starting_note
<- first_character_notes
<- second_character_notes
<- third_character_notes
<- fourth_character_notes
<- fifth_character_notes
<- doggo_no_notes

// //Elementi della foresta
<- docDump_document
<- docKitchen_document
<- docGreenhouse_document
<- docNest_document
<- docLibrary_document

//Elementi della discarica
<- the_witch

//Elementi dello stagno
<- welcoming_frog

//Elementi della serra

//Elementi della cucina
<- cooking_alone

//Elementi della libreria
<- reading_place

//Elementi del nido
<- nest_fireGlyph_button
<- nest_airGlyph_button
<- nest_earthGlyph_button
<- nest_waterGlyph_button
<- nest_aetherGlyph_button
    //bottoni per la missione di Franco
        <- nest_Franco_fireGlyph_button
        <- nest_Franco_airGlyph_button
        <- nest_Franco_earthGlyph_button
        <- nest_Franco_waterGlyph_button
        <- nest_Franco_aetherGlyph_button
        <- franco_inTheNest


//Impostazioni
<- settings_management


+ -> main
