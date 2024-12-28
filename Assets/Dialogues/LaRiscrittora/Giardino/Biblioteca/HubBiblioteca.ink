=== hub_biblioteca ===
#background: {tag_background()}
//Qui avremo qualche info generica e poi la possibilità di leggerci qualcosa
<i>Sei in biblioteca</i>
-> randomizzazione_dono_luoghi ->

    + [Leggo un libro]
        -> test_libri
    + [Mi guardo attorno]
    -
    
-> main
