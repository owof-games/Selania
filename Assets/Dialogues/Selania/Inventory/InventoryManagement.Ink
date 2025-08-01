                    /* ---------------------------------
                    
                       Elementi per gestire i contenuti delle liste
                    
                     ----------------------------------*/
=== function pop(ref _list) 
    ~ temp el = LIST_MIN(_list) 
    ~ _list -= el
    ~ return el 

=== function list_with_commas(list)
	{ list:
		{_list_with_commas(list, LIST_COUNT(list))}
	}

=== function _list_with_commas(list, n)
	{ingredientTranslator(pop(list))}{ n > 1:{n == 2: e |, }{_list_with_commas(list, n-1)}}
    
=== function oggettoOggetti(list)
	{LIST_COUNT(list) == 1:oggetto|oggetti}
    	
            /* ---------------------------------
            
               Lista ingredienti e relativa traduzione
            
             ----------------------------------*/
//Lista dei doni che si possono trovare in gioco.
VAR findedGifts = ()


=== function ingredientTranslator(ingredient)
    {ingredient:
        - LaSpazzata: 
            ~ return "un residuo della Spezzata"
            
        - BaccaDellaAddolorata: 
            ~ return "una Bacca della Addolorata"
            
        - EderaDelleAmanti:
            ~ return "dell'Edera delle Amanti"
            
        - BrinaDellImpossibile:
            ~ return "della Brina dell'Impossibile"

        - CantoDelleCompagne: 
            ~ return "del Canto delle Compagne"
            
        - LicheneDegliAbissi:
            ~ return "del Lichene degli Abissi"
            
        - NonTiScordarDiTe:
            ~ return "del Non Ti Scordar di Te"     
    
    }
