=== library ===
#background: {tag_background()}
//Qui avremo qualche info generica e poi la possibilità di leggerci qualcosa
<i>Sei nella biblioteca.</i>
    + [Mi guardo attorno]
    -
    
-> main


=== reading_place
    + {are_two_entities_together(ReadingPlace, PG)} [ReadingPlace]
        -> book_test_intro