/*
ACCESSO AD ELEMENTI RICORRENTI (MENTORE, LISTA OGGETTI, ANIME)
Accade solo negli hub, non nelle scene singole, che sono private (credo)



AREE DEL GIARDINO
    Si aprono in modo strutturato, ragionando per tier.
    Es:
        -> Tier uno: tutorial. Si apre il giardino con funghi e fiori + il BusStop. Trovo tre oggetti utili per la prima storia: uno dal mentore, uno nel giardino stesso (se osservo il mondo dalla panchina), l'altro collaborando con un fungo o un fiore o che.
        -> Tier due: si apre lo spazio delle falene e il labirinto
        -> Tier tre: si apre il resto: tisane, biblioteca, canzoni
    
    Nell'ottica di una maggiore economia, i tier non sono variabili, ma sono dettati dallo stato delle storie degli spettri.
        -> Tier uno: quello iniziale
        -> Tier due: si sblocca quando storiaUno == Conclusa
        -> Tier tre: si sblocca quando storiaDue, Tre e Quattro sono Concluse
    Per comodità ora nel prototipo i tier saranno uno per Spettro

TOMBE
    Si aprono in tre blocchi, definendo di conseguenza anche i Tier delle aree del giardino.
    
        -> Tier uno: quello iniziale.
        -> Tier due: si sblocca quando storiaUno == Conclusa
        -> Tier tre: si sblocca quando storiaDue, Tre e Quattro sono Concluse
    
    Le sette tombe saranno sempre e comunque visibili e accessibili. Se non sono sbloccate, ci diranno solo l'epitaffio.    
        
    LOOP per la relazione con gli spettri:
        -> decido quale tra le storie disponibili voglio avviare
        -> ascolto la storia (una scena significativa che mi dà potenziali spunti per dei doni)
        -> cerco i doni
        -> se parlo prima di dare il dono, ricevo una frase che riassume un po' il rimpianto dello spettro
        -> quando offro il dono, viene rimpolpato l'inchiostro (con o senza dichiarazione dei dati, della quantità)
        -> a quel punto posso fare delle domande
        -> A domande finite, propongo una rilettura della storia del personaggio, consumando più o meno inchiostro (questo quindi ci fa anche capire che tendenzialmente un punto chiave è più sul fondo della storia)
        -> questa rilettura farà sì che sarà il personaggio stesso a darsi una nuova etichetta.
   
        
ANIME
    Ci troviamo in uno spazio di rielaborazione e rilettura di ciò che è accaduto nel nostro passato.
    Le anime che incontriamo ci vengono presentate dal mentore come persone che stanno facendo il nostro stesso lavoro, ma mi piacerebbe che fossero un mix di persone della nostra vita attuale, e alcune di quelle che incontriamo nelle nostre elaborazioni.
    Il tempo può creare anche un contrasto, es: madre presentata da uno spettro giovane, e qui incontriamo una donna anziana.
    Con questa logica cercherei di dividerle tra poche (POCHE!!!) ricorrenti (tre, quattro) e comparse.
    Le ricorrenti hanno comunque una storyline lineare: piccoli storylet con scelte che non hanno conseguenze effettive (al massimo dei doni), che compaiono consequenzialmente ogni volta che le incontriamo, plausibilmente con un massimo di incontri previsti.
    
    Strutturalmente (un po' come col mentore) avrò quindi bisogno che ogni volta che entro in un luogo ci sia:
        -> un tiro di dado per decidere se sarà o meno presente una determinata anima
        -> se è prevista, una pescata tra le anime, che faccia in modo che non si ripresentino anime già incontrate, e che rendano la comparsa di quelle ricorrenti più dilazionata.

    */