=== contenuti_inventario ===
+ [Inventario]
    {doniTrovati != (): -> inventarietto|->vuoto}

    =inventarietto
    Hai con te {list_with_commas(doniTrovati)}
    -> main

    = vuoto
    L'inventario è vuoto
    -> main






=== gestione_inventario ===
{debug: I doni trovati sono {doniTrovati}}

+ {doniTrovati has muschiodelleamanti} Doni del muschio delle amanti.
    ~ doniTrovati -= muschiodelleamanti
    ~ doniDonati += muschiodelleamanti
    {
    - storiaDue == InCorso:
        ~ statoInchiostroSpettroDue ++
        ~ statoInchiostroSpettroDue ++
        Spettro due ha apprezzato molto il tuo dono.
    - storiaUno == InCorso:
        Lo spettro è confuso dal tuo dono.
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre --
        Spettro tre è disgustato dal tuo dono.
    }
    
   -> main

+ {doniTrovati has baccadellaaddolorata} Doni una bacca della Addolorata.
    ~ doniTrovati -= baccadellaaddolorata
    ~ doniDonati += baccadellaaddolorata
    {
    - storiaUno == InCorso:
        Lo spettro è confuso dal tuo dono.
    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
   -> main    

+ {doniTrovati has laspezzata} Doni un frammento della spezzata.
    ~ doniTrovati -= laspezzata
    ~ doniDonati += laspezzata
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno ++
        ~ statoInchiostroSpettroUno ++
        ~ statoInchiostroSpettroUno ++
        Spettro uno ti guarda sorpreso, e si porta il frammento al petto.
        ~ eventoSpecialeSpettroUno = true

    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
   -> main

+ {doniTrovati has coperta} Doni una coperta.
    ~ doniTrovati -= coperta
    ~ doniDonati += coperta
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno ++
        ~ statoInchiostroSpettroUno ++
        Lo spettro se la avvolge attorno al corpo.
        Sembra sollevato.
    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
   -> main
    
+ {doniTrovati has vasovuoto} Doni un vaso vuoto.
    ~ doniTrovati -= vasovuoto
    ~ doniDonati += vasovuoto
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno --
        Lo spettro ti guarda con orrore, e lascia che il vaso cada a terra, frantumandosi.
    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
    -> main
    
    //Se la lista è vuota
    + {doniTrovati == ()} Non hai nulla da donare
    + Ho bisogno di ragionarci ancora un poco.
        -> main 
    + ->
    - 
-> main
