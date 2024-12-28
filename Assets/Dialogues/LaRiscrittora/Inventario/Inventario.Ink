=== contenuti_inventario ===
+ [Inventario]
    {doniTrovati != (): -> inventarietto|->vuoto}

    =inventarietto
    <i>Hai con te {list_with_commas(doniTrovati)}</i>
    -> main

    = vuoto
    <i>L'inventario è vuoto</i>
    -> main






=== gestione_inventario ===
{debug: I doni trovati sono {doniTrovati}}

+ {doniTrovati has muschiodelleamanti} [Dono del muschio delle amanti]
    ~ doniTrovati -= muschiodelleamanti
    ~ doniDonati += muschiodelleamanti
    {
    - storiaUno == InCorso:
    <i>Lo spettro è confuso dal dono.</i>
    ~ donoSpettroUno = true
    -> storia_uno.capitolo_uno
    
    - storiaDue == InCorso:
        ~ statoInchiostroSpettroDue ++
        ~ statoInchiostroSpettroDue ++
        Spettro due ha apprezzato molto il tuo dono.
    

    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre --
        Spettro tre è disgustato dal tuo dono.
    }
    
   -> main

+ {doniTrovati has baccadellaaddolorata} [Dono una bacca della Addolorata]
    ~ doniTrovati -= baccadellaaddolorata
    ~ doniDonati += baccadellaaddolorata
    {
    - storiaUno == InCorso:
        <i>Lo spettro è confuso dal dono.</i>
        ~ donoSpettroUno = true
        -> storia_uno.capitolo_uno
    
    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
   -> main    

+ {doniTrovati has laspezzata} [Dono un frammento della Spezzata]
    ~ doniTrovati -= laspezzata
    ~ doniDonati += laspezzata
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno ++
        ~ statoInchiostroSpettroUno ++
        ~ statoInchiostroSpettroUno ++
        <i>Spettro uno ti guarda sorpreso, e si porta il frammento al petto.</i>
        ~ eventoSpecialeSpettroUno = true
        ~ donoSpettroUno = true
        -> storia_uno.capitolo_uno

    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
   -> main

+ {doniTrovati has coperta} [Dono una coperta]
    ~ doniTrovati -= coperta
    ~ doniDonati += coperta
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno ++
        ~ statoInchiostroSpettroUno ++
        <i>Lo spettro se la avvolge attorno al corpo.
        Sembra sollevato.</i>
        ~ donoSpettroUno = true
        -> storia_uno.capitolo_uno
    
    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
   -> main
    
+ {doniTrovati has vasovuoto} [Dono un vaso vuoto]
    ~ doniTrovati -= vasovuoto
    ~ doniDonati += vasovuoto
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno --
        <i>Lo spettro ti guarda con orrore, e lascia che il vaso cada a terra, frantumandosi.</i>
        ~ donoSpettroUno = true
        -> storia_uno.capitolo_uno
    
    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
    -> main
    
    //Se la lista è vuota
    + {doniTrovati == ()} [Non ho nulla da donare]
    + [Ho bisogno di ragionarci ancora un poco]
        -> main 
    + ->
    - 
-> main
