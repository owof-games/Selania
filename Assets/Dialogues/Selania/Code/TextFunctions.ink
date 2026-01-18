//Per cambiare il testo a seconda della provenienza
=== function came_from(-> x)
	~ return TURNS_SINCE(x) == 1
	
	
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
	
=== function generic_list_with_commas(generic_list, -> element_translator)
	{ generic_list:
		{_generic_list_with_commas(generic_list, LIST_COUNT(generic_list), element_translator)}
	}

=== function _generic_list_with_commas(generic_list, n, -> element_translator)
	{element_translator(pop(generic_list))}{ n > 1:{n == 2: e |, }{_generic_list_with_commas(generic_list, n-1, element_translator)}}
