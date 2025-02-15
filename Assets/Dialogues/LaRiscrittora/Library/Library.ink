=== library ===
#background: {tag_background()}
//Qui avremo qualche info generica e poi la possibilità di leggerci qualcosa
<i>Sei in Library</i>
    + {are_two_entities_together(ReadingPlace, PG)} [ReadingPlace]
        -> books_test
    + [Mi guardo attorno]
    -
    
-> main
