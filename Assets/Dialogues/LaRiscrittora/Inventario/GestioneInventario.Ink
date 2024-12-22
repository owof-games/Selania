/* ---------------------------------

   Elementi per gestire i contenuti delle liste

 ----------------------------------*/


    === function pop(ref _list) 
        ~ temp el = LIST_MIN(_list) 
        ~ _list -= el
        ~ return el 
    

    //Takes a list and prints it out, using commas. 
    //The fruit bowl contains {list_with_commas(fruitBowl)}.
    
    === function list_with_commas(list)
    	{ list:
    		{_list_with_commas(list, LIST_COUNT(list))}
    	}
    
    === function _list_with_commas(list, n)
    	{traduttoreIngredienti(pop(list))}{ n > 1:{n == 2: e |, }{_list_with_commas(list, n-1)}}
    
    === function oggettoOggetti(list)
    	{LIST_COUNT(list) == 1:oggetto|oggetti}
    	
/* ---------------------------------

   Lista ingredienti e relativa traduzione

 ----------------------------------*/

=== function traduttoreIngredienti(ingrediente)
{ingrediente:
- mela: 
    ~ return "una mela"
- fungo:
    ~ return "un fungo"
- banana: 
    ~ return "una banana"
- pera: 
    ~ return "una pera"    
- baccadellaaddolorata: 
    ~ return "una bacca della Addolorata"
- muschiodelleamanti:
    ~ return "del muschio delle amanti"

}
