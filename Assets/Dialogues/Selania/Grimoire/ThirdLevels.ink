
// === altraPaginaGrimorio
// @comandGrimoirioSigilliSecondoLivello
// + [AirWater]
//   -> grimoireSigilThirdLevel(Air, Water, Air, Earth)



// === grimoireSigilThirdLevel(leftGlyph1, leftGlyph2, rightGlyph1, rightGlyph2)

// ~ temp leftSigilName = getTwoComponentsSigilName("{leftGlyph1}{leftGlyph2}")
// ~ temp rightSigilName = getTwoComponentsSigilName(rightGlyph1, rightGlyph2)

// @grimoireSigilPages #leftPageTitle:{leftSigilName} #leftPageDescription:descrizione #leftPageGlyph1:Air #leftPageGlyph2:Water #rightPageTitle:{rightSigilName} #rightPageDescription: #rightPageGlyph1:Air #rightPageGlyph2:Fire
// + [Strappo #position:left2 #glyph3:Fire #firstLine: #secondLine:seconda #thirdLine:]

// + [Vaso #bookmark:previous]
 
// + [Increspatura #bookmark:next]
// - 



=== grimoire_sigils_thirdLevelOne (leftGlyph1, leftGlyph2, rightGlyph1, rightGlyph2)
    ~ temp leftSigilName = "{leftGlyph1}{leftGlyph2}"
    ~ temp rightSigilName = "{rightGlyph1}{rightGlyph2}"

@grimoireSigilPages #leftPageTitle{sigils_translator(leftSigilName)} #leftPageDescription{grimoire_sigilsDescription(leftSigilName)} #leftPageGlyph1:{leftGlyph1} #leftPageGlyph2:{leftGlyph2} #rightPageTitle{sigils_translator(rightSigilName)} #rightPageDescription{grimoire_sigilsDescription(rightSigilName)} #rightPageGlyph1:{rightGlyph1} #rightPageGlyph2:{rightGlyph2}


+ [Index #bookmark:index]
    -> grimoire
+ [Sigilli #bookmark:secondLevel]
    -> grimoire_sigils