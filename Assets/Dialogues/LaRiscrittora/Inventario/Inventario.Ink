=== contenuti_inventario ===
+ [Controlli l'inventario]
    {doniTrovati != (): -> inventarietto|->vuoto}

    =inventarietto
    Hai con te {list_with_commas(doniTrovati)}
    -> main

    = vuoto
    L'inventario è vuoto
    -> main






=== gestione_inventario ===
TODO: settare valori oggetti creati
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
        ~ statoInchiostroSpettroUno ++
        ~ statoInchiostroSpettroUno ++
        ~ statoInchiostroSpettroUno ++
        Hai regalato a spettro uno la sua cosa preferita.
        //Questa occasione sblocca un pezzo speciale di storia
        ~ eventoSpecialeSpettroUno = true
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre --
        Spettro tre è disgustato dal tuo dono.
    }
    
   -> main

+ {doniTrovati has baccadellaaddolorata} Doni una bacca della Addolorata
    ~ doniTrovati -= baccadellaaddolorata
    ~ doniDonati += baccadellaaddolorata
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno --
        Spettro uno inizia a piangere
    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
   -> main    

+ {doniTrovati has mela} Doni una mela
    ~ doniTrovati -= mela
    ~ doniDonati += mela
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno --
        Spettro uno inizia a piangere
    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
   -> main

+ {doniTrovati has pera} Doni una pera
    ~ doniTrovati -= pera
    ~ doniDonati += pera
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno --
        Spettro uno inizia a piangere
    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
   -> main
    
+ {doniTrovati has fungo} Doni un fungo
    ~ doniTrovati -= fungo
    ~ doniDonati += fungo
    {
    - storiaUno == InCorso:
        ~ statoInchiostroSpettroUno --
        Spettro uno inizia a piangere
    - storiaDue == InCorso:
        Hai regalato a spettro due qualcosa che proprio non gli interessa
    - storiaTre == InCorso:
        ~ statoInchiostroSpettroTre ++
        Spettro tre apprezza mediamente il tuo dono.
    }
    -> main
    
    //Se la lista è vuota
    + {doniTrovati == ()} Non hai nulla da donare
    + Mmm, per ora passo -> main 
    + ->
    - 
-> main
