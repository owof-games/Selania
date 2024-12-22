=== hub_labirinto ===
//Qui non compare né mentore né anime e animelle

//Forse la parte più introspettiva per la giocatrice, con domande diverse su come sta o simili, ma ancora non ne sono sicura.
//Lavorando anche su questioni di genere.
Sei nel labirinto

    + Inizi a camminare
    + {doniTrovati != ()} Controlla li lista di oggetti che hai con te
        -> contenuti_inventario
        //Per il labirinto, valutare se non andarci a mani vuote (nel senso: non controllo più)
    + Trovi lo specchio -> lo_specchio
    -
    
-> hub_labirinto