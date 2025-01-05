=== contenuti_inventario ===
+ [Inventario]
    {doniTrovati != (): -> inventarietto|->vuoto}

    =inventarietto
    <i>Hai con te {list_with_commas(doniTrovati)}.</i>
    -> main

    = vuoto
    <i>L'inventario è vuoto.</i>
    -> main




=== gestione_inventario ===
{debug: I doni trovati sono {doniTrovati}}
Dono...
+ {doniTrovati has MuschioDelleAmanti} [Del muschio delle amanti.]
    ~ doniTrovati -= MuschioDelleAmanti
    ~ doniDonati += MuschioDelleAmanti
    {
    - storiaUno == InCorso:
    <i>{traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)} è confuso dal dono.</i>
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

+ {doniTrovati has BaccaDellaAddolorata} [Una bacca della Addolorata.]
    ~ doniTrovati -= BaccaDellaAddolorata
    ~ doniDonati += BaccaDellaAddolorata
    {
    - storiaUno == InCorso:
        <i>{traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)} è confuso dal dono.</i>
        ~ donoSpettroUno = true
        -> storia_uno.capitolo_uno
    
    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
   -> main    

+ {doniTrovati has LaSpazzata} [Un frammento della Spezzata.]
    ~ doniTrovati -= LaSpazzata
    ~ doniDonati += LaSpazzata
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno ++
        <i>{traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)} apprezza il dono</i>
        ~ donoSpettroUno = true
        -> storia_uno.capitolo_uno

    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
   -> main

+ {doniTrovati has coperta} [Una coperta.]
    ~ doniTrovati -= coperta
    ~ doniDonati += coperta
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno ++
        ~ statoInchiostroSpettroUno ++
        <i>{traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)} se la avvolge attorno al corpo.
        <i>Sembra sollevato.</i>
        ~ donoSpettroUno = true
        -> storia_uno.capitolo_uno
    
    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
   -> main
    
+ {doniTrovati has vasovuoto} [Un vaso vuoto.]
    ~ doniTrovati -= vasovuoto
    ~ doniDonati += vasovuoto
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno --
        <i>{traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)} ti guarda con orrore, e lascia che il vaso cada a terra, frantumandosi.</i>
        ~ donoSpettroUno = true
        -> storia_uno.capitolo_uno
    
    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
    -> main
    
+ {doniTrovati has BrinaDellImpossibile} [Un frammento di Brina dell'Impossibile.]
    ~ doniTrovati -= BrinaDellImpossibile
    ~ doniDonati += BrinaDellImpossibile
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno ++
        ~ statoInchiostroSpettroUno ++
        ~ statoInchiostroSpettroUno ++
        <i>{traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)} si porta la Brina al petto, e ti guarda commosso.</i>
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
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
    + {doniTrovati == ()} [Non ho nulla da donare.]
    + [Ho bisogno di ragionarci ancora un poco.]
        -> main 
    + ->
    - 
-> main
