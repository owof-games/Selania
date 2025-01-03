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

+ {doniTrovati has MuschioDelleAmanti} [Dono del muschio delle amanti]
    ~ doniTrovati -= MuschioDelleAmanti
    ~ doniDonati += MuschioDelleAmanti
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

+ {doniTrovati has BaccaDellaAddolorata} [Dono una bacca della Addolorata]
    ~ doniTrovati -= BaccaDellaAddolorata
    ~ doniDonati += BaccaDellaAddolorata
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

+ {doniTrovati has LaSpazzata} [Dono un frammento della Spezzata]
    ~ doniTrovati -= LaSpazzata
    ~ doniDonati += LaSpazzata
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno ++
        <i>Spettro uno apprezza il dono</i>
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
    
+ {doniTrovati has BrinaDellImpossibile} [Dono un frammento di Brina dell'Impossibile]
    ~ doniTrovati -= BrinaDellImpossibile
    ~ doniDonati += BrinaDellImpossibile
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno ++
        ~ statoInchiostroSpettroUno ++
        ~ statoInchiostroSpettroUno ++
        <i>Spettro uno si porta la Brina al petto, e ti guarda commosso</i>
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano</i>
        ~ donoSpettroUno = true
         ~ eventoSpecialeSpettroUno = true
        -> storia_uno.capitolo_uno

    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano</i>
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano</i>        
    }
   -> main    
    
    //Se la lista è vuota
    + {doniTrovati == ()} [Non ho nulla da donare]
    + [Ho bisogno di ragionarci ancora un poco]
        -> main 
    + ->
    - 
-> main
