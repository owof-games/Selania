=== bedroom ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
TODO: la stanza non è per forza un luogo d'uscita, lo è il letto. Per cui qui possiamo avere dei descrittori, sempre con la voce del fungo, anche per aiutarci a capire dove ci troviamo e, eventualmente, cosa possiamo fare. Per esempio potremmo avere solo oggetti interagibili all'avvio: uscita dal gioco, ingresso nel bosco, accesso alle impostazioni (una mensola con degli oggetti ad hoc?). Questo forse mi salva anche dal grande terrore dell'extradiegetico.
    
    <i>A presto!</i> #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
         + [chiudi]
        
        -> main
