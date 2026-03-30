
// === altraPaginaGrimorio
// @comandGrimoirioSigilliSecondoLivello
// + [AirWater]
//   -> grimoireSigilThirdLevel(Air, Water, Air, Earth)



// === grimoireSigilThirdLevel(leftGlyph1, leftGlyph2, rightGlyph1, rightGlyph2)


// + [Strappo #position:left2 #glyph3:Fire #firstLine: #secondLine:seconda #thirdLine:]

// + [Vaso #bookmark:previous]
 
// + [Increspatura #bookmark:next]
// - 



=== grimoire_sigils_thirdLevelOne (leftGlyph1, leftGlyph2, rightGlyph1, rightGlyph2)
    ~ temp leftSigilName = "{leftGlyph1}{leftGlyph2}"
    ~ temp rightSigilName = "{rightGlyph1}{rightGlyph2}"

@grimoireSigilPages #leftPageTitle{grimoire_sigilSigilName(leftSigilName)} #leftPageDescription{grimoire_sigilsDescription(leftSigilName)} #leftPageGlyph1:{leftGlyph1} #leftPageGlyph2:{leftGlyph2} #rightPageTitle{grimoire_sigilSigilName(rightSigilName)} #rightPageDescription{grimoire_sigilsDescription(rightSigilName)} #rightPageGlyph1:{rightGlyph1} #rightPageGlyph2:{rightGlyph2}

    //left
    + {glyph_discoveredSigils has FireAirWater}[{sigils_translator(FireAirWater)} #position:left1 #glyph3:{grimoire_sigilGlyph3(FireAirWater)} #firstLine:{grimoire_textFireAirWaterOne} #secondLine:{grimoire_textFireAirWaterTwo} #thirdLine:{grimoire_textFireAirWaterThree} #status:{grimoire_statusThirdSigils(FireAirWater)}]
    + {glyph_discoveredSigils has FireAirEarth}[{sigils_translator(FireAirEarth)} #position:left2 #glyph3:{grimoire_sigilGlyph3(FireAirEarth)} #firstLine:{grimoire_textFireAirEarthOne} #secondLine:{grimoire_textFireAirEarthTwo} #thirdLine:{grimoire_textFireAirEarthThree} #status:{grimoire_statusThirdSigils(FireAirEarth)}]
    + {glyph_discoveredSigils has FireAirAether}[{sigils_translator(FireAirAether)} #position:left3 #glyph3:{grimoire_sigilGlyph3(FireAirAether)} #firstLine:{grimoire_textFireAirAetherOne} #secondLine:{grimoire_textFireAirAetherTwo} #thirdLine:{grimoire_textFireAirAetherThree} #status:{grimoire_statusThirdSigils(FireAirAether)}]

    //right
    + {glyph_discoveredSigils has FireWaterEarth}[{sigils_translator(FireWaterEarth)} #position:right1 #glyph3:{grimoire_sigilGlyph3(WaterAetherAir)} #firstLine:{grimoire_textFireWaterEarthOne} #secondLine:{grimoire_textFireWaterEarthTwo} #thirdLine:{grimoire_textFireWaterEarthThree} #status:{grimoire_statusThirdSigils(FireWaterEarth)}]
    + {glyph_discoveredSigils has FireWaterAether}[{sigils_translator(FireWaterAether)} #position:right2 #glyph3:{grimoire_sigilGlyph3(FireWaterAether)} #firstLine:{grimoire_textFireWaterAetherOne} #secondLine:{grimoire_textFireWaterAetherTwo} #thirdLine:{grimoire_textFireWaterAetherThree} #status:{grimoire_statusThirdSigils(FireWaterAether)}]
    + {glyph_discoveredSigils has FireWaterAir}[{sigils_translator(FireWaterAir)} #position:right3 #glyph3:{grimoire_sigilGlyph3(FireWaterAir)} #firstLine:{grimoire_textFireWaterAirOne} #secondLine:{grimoire_textFireWaterAirTwo} #thirdLine:{grimoire_textFireWaterAirThree} #status:{grimoire_statusThirdSigils(FireWaterAir)}]
    -

+ [Index #bookmark:index]
    -> grimoire
+ [Sigilli #bookmark:secondLevel]
    -> grimoire_sigils