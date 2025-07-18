=== library ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}


//Qui avremo qualche info generica e poi la possibilità di leggerci qualcosa
{debug: <i>La lista degli oggetti nella stanza è: {libraryContents}.}
{library == 1:<i>La biblioteca ti accoglie fremente.</i>|<i>{~ Storie non lette cercano occhi accoglienti.|La poltrona raccoglie i pensieri di infinit3 Riscrittor3.|Le vecchie mensole si raccontano antiche rivoluzioni.|Le ragnatele cantano le proprie rabbie.|La lampada illumina l'inaspettato.}</i>}#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
        -
    
-> main


=== reading_place
    + {are_two_entities_together(ReadingPlace, PG)} [ReadingPlace]
        -> book_test_intro