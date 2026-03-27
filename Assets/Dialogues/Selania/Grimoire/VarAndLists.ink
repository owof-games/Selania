// Con poche eccezioni, una pagina del grimorio può passare da lucchettata a disponibile per motivazioni diverse.
// Prendiamo Appendici: non so quale delle sei sottosezioni si aprirà prima, e ogni sottosezione può avere più parti di testo collegate a storylets il cui ordine di accesso è imprevedibile.
// L'idea quindi è di fare una lista VAR che parte vuota, e si riempie man mano che viene raggiunta una condizione.
// Se la lista VAR è vuota, il bottone di primo livello è disattivato.
// Se ha almeno un elemento invece il bottone si attiva.
// I bottoni di secondo livello invece vanno a vedere cosa c'è nella lista, così come i testi del terzo livello.

LIST grimoire_allElements = 
//Appendici
    grimChoicesMentor, grimChoicesWitch, grimGreenhouseMentor, grimKitchenChitarra, grimRewritingMentor, grimSigilsBoccale, grimSigilsMentor, grimSigilsWitch



VAR grimoire_Appendices = ()