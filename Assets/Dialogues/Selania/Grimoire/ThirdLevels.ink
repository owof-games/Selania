=== grimoire_sigils_thirdLevel (leftGlyph1, leftGlyph2, rightGlyph1, rightGlyph2)
- (top)

    ~ temp leftSigilName = "{leftGlyph1}{leftGlyph2}"
    ~ temp rightSigilName = "{rightGlyph1}{rightGlyph2}"

@grimoireSigilPages #leftPageTitle:{grimoire_sigilSigilName(leftSigilName)} #leftPageDescription:{grimoire_sigilsDescription(leftSigilName)} #leftPageGlyph1:{leftGlyph1} #leftPageGlyph2:{leftGlyph2} #rightPageTitle:{grimoire_sigilSigilName(rightSigilName)} #rightPageDescription:{grimoire_sigilsDescription(rightSigilName)} #rightPageGlyph1:{rightGlyph1} #rightPageGlyph2:{rightGlyph2}

    //left
    + {glyph_discoveredSigils has AirWaterFire && leftSigilName == "AirWater"}[{sigils_translator(AirWaterFire)} #position:left1 #glyph3:{grimoire_sigilGlyph3(AirWaterFire)} #firstLine:{grimoire_textAirWaterFireOne} #secondLine:{grimoire_textAirWaterFireTwo} #thirdLine:{grimoire_textAirWaterFireThree} #status:{grimoire_statusThirdSigils(AirWaterFire)}]
        ~ glyph_actualActiveSigil += AirWaterFire
    + {glyph_discoveredSigils has AirWaterEarth && leftSigilName == "AirWater"}[{sigils_translator(AirWaterEarth)} #position:left2 #glyph3:{grimoire_sigilGlyph3(AirWaterEarth)} #firstLine:{grimoire_textAirWaterEarthOne} #secondLine:{grimoire_textAirWaterEarthTwo} #thirdLine:{grimoire_textAirWaterEarthThree} #status:{grimoire_statusThirdSigils(AirWaterEarth)}]
        ~ glyph_actualActiveSigil += AirWaterEarth
    + {glyph_discoveredSigils has AirWaterAether && leftSigilName == "AirWater"}[{sigils_translator(AirWaterAether)} #position:left3 #glyph3:{grimoire_sigilGlyph3(AirWaterAether)} #firstLine:{grimoire_textAirWaterAetherOne} #secondLine:{grimoire_textAirWaterAetherTwo} #thirdLine:{grimoire_textAirWaterAetherThree} #status:{grimoire_statusThirdSigils(AirWaterAether)}]
        ~ glyph_actualActiveSigil += AirWaterAether

    + {glyph_discoveredSigils has AirFireWater && leftSigilName == "AirFire"}[{sigils_translator(AirFireWater)} #position:left1 #glyph3:{grimoire_sigilGlyph3(AirFireWater)} #firstLine:{grimoire_textAirFireWaterOne} #secondLine:{grimoire_textAirFireWaterTwo} #thirdLine:{grimoire_textAirFireWaterThree} #status:{grimoire_statusThirdSigils(AirFireWater)}]
        ~ glyph_actualActiveSigil += AirFireWater
    + {glyph_discoveredSigils has AirFireEarth && leftSigilName == "AirFire"}[{sigils_translator(AirFireEarth)} #position:left2 #glyph3:{grimoire_sigilGlyph3(AirFireEarth)} #firstLine:{grimoire_textAirFireEarthOne} #secondLine:{grimoire_textAirFireEarthTwo} #thirdLine:{grimoire_textAirFireEarthThree} #status:{grimoire_statusThirdSigils(AirFireEarth)}]
        ~ glyph_actualActiveSigil += AirFireEarth
    + {glyph_discoveredSigils has AirFireAether && leftSigilName == "AirFire"}[{sigils_translator(AirFireAether)} #position:left3 #glyph3:{grimoire_sigilGlyph3(AirFireAether)} #firstLine:{grimoire_textAirFireAetherOne} #secondLine:{grimoire_textAirFireAetherTwo} #thirdLine:{grimoire_textAirFireAetherThree} #status:{grimoire_statusThirdSigils(AirFireAether)}]
        ~ glyph_actualActiveSigil += AirFireAether

    + {glyph_discoveredSigils has WaterAirAether && leftSigilName == "WaterAir"}[{sigils_translator(WaterAirAether)} #position:left1 #glyph3:{grimoire_sigilGlyph3(WaterAirAether)} #firstLine:{grimoire_textWaterAirAetherOne} #secondLine:{grimoire_textWaterAirAetherTwo} #thirdLine:{grimoire_textWaterAirAetherThree} #status:{grimoire_statusThirdSigils(WaterAirAether)}]
        ~ glyph_actualActiveSigil += WaterAirAether
    + {glyph_discoveredSigils has WaterAirFire && leftSigilName == "WaterAir"}[{sigils_translator(WaterAirFire)} #position:left2 #glyph3:{grimoire_sigilGlyph3(WaterAirFire)} #firstLine:{grimoire_textWaterAirFireOne} #secondLine:{grimoire_textWaterAirFireTwo} #thirdLine:{grimoire_textWaterAirFireThree} #status:{grimoire_statusThirdSigils(WaterAirFire)}]
        ~ glyph_actualActiveSigil += WaterAirFire
    + {glyph_discoveredSigils has WaterAirEarth && leftSigilName == "WaterAir"}[{sigils_translator(WaterAirEarth)} #position:left3 #glyph3:{grimoire_sigilGlyph3(WaterAirEarth)} #firstLine:{grimoire_textWaterAirEarthOne} #secondLine:{grimoire_textWaterAirEarthTwo} #thirdLine:{grimoire_textWaterAirEarthThree} #status:{grimoire_statusThirdSigils(WaterAirEarth)}]
        ~ glyph_actualActiveSigil += WaterAirEarth

    + {glyph_discoveredSigils has WaterFireAether && leftSigilName == "WaterFire"}[{sigils_translator(WaterFireAether)} #position:left1 #glyph3:{grimoire_sigilGlyph3(WaterFireAether)} #firstLine:{grimoire_textWaterFireAetherOne} #secondLine:{grimoire_textWaterFireAetherTwo} #thirdLine:{grimoire_textWaterFireAetherThree} #status:{grimoire_statusThirdSigils(WaterFireAether)}]
        ~ glyph_actualActiveSigil += WaterFireAether
    + {glyph_discoveredSigils has WaterFireEarth && leftSigilName == "WaterFire"}[{sigils_translator(WaterFireEarth)} #position:left2 #glyph3:{grimoire_sigilGlyph3(WaterFireEarth)} #firstLine:{grimoire_textWaterFireEarthOne} #secondLine:{grimoire_textWaterFireEarthTwo} #thirdLine:{grimoire_textWaterFireEarthThree} #status:{grimoire_statusThirdSigils(WaterFireEarth)}]
        ~ glyph_actualActiveSigil += WaterFireEarth
    + {glyph_discoveredSigils has WaterFireAir && leftSigilName == "WaterFire"}[{sigils_translator(WaterFireAir)} #position:left3 #glyph3:{grimoire_sigilGlyph3(WaterFireAir)} #firstLine:{grimoire_textWaterFireAirOne} #secondLine:{grimoire_textWaterFireAirTwo} #thirdLine:{grimoire_textWaterFireAirThree} #status:{grimoire_statusThirdSigils(WaterFireAir)}]
        ~ glyph_actualActiveSigil += WaterFireAir

    + {glyph_discoveredSigils has EarthAirWater && leftSigilName == "EarthAir"}[{sigils_translator(EarthAirWater)} #position:left1 #glyph3:{grimoire_sigilGlyph3(EarthAirWater)} #firstLine:{grimoire_textEarthAirWaterOne} #secondLine:{grimoire_textEarthAirWaterTwo} #thirdLine:{grimoire_textEarthAirWaterThree} #status:{grimoire_statusThirdSigils(EarthAirWater)}]
        ~ glyph_actualActiveSigil += EarthAirWater
    + {glyph_discoveredSigils has EarthAirFire && leftSigilName == "EarthAir"}[{sigils_translator(EarthAirFire)} #position:left2 #glyph3:{grimoire_sigilGlyph3(EarthAirFire)} #firstLine:{grimoire_textEarthAirFireOne} #secondLine:{grimoire_textEarthAirFireTwo} #thirdLine:{grimoire_textEarthAirFireThree} #status:{grimoire_statusThirdSigils(EarthAirFire)}]
        ~ glyph_actualActiveSigil += EarthAirFire
    + {glyph_discoveredSigils has EarthAirAether && leftSigilName == "EarthAir"}[{sigils_translator(EarthAirAether)} #position:left3 #glyph3:{grimoire_sigilGlyph3(EarthAirAether)} #firstLine:{grimoire_textEarthAirAetherOne} #secondLine:{grimoire_textEarthAirAetherTwo} #thirdLine:{grimoire_textEarthAirAetherThree} #status:{grimoire_statusThirdSigils(EarthAirAether)}]
        ~ glyph_actualActiveSigil += EarthAirAether

    + {glyph_discoveredSigils has EarthFireAether && leftSigilName == "EarthFire"}[{sigils_translator(EarthFireAether)} #position:left1 #glyph3:{grimoire_sigilGlyph3(EarthFireAether)} #firstLine:{grimoire_textEarthFireAetherOne} #secondLine:{grimoire_textEarthFireAetherTwo} #thirdLine:{grimoire_textEarthFireAetherThree} #status:{grimoire_statusThirdSigils(EarthFireAether)}]
        ~ glyph_actualActiveSigil += EarthFireAether
    + {glyph_discoveredSigils has EarthFireWater && leftSigilName == "EarthFire"}[{sigils_translator(EarthFireWater)} #position:left2 #glyph3:{grimoire_sigilGlyph3(EarthFireWater)} #firstLine:{grimoire_textEarthFireWaterOne} #secondLine:{grimoire_textEarthFireWaterTwo} #thirdLine:{grimoire_textEarthFireWaterThree} #status:{grimoire_statusThirdSigils(EarthFireWater)}]
        ~ glyph_actualActiveSigil += EarthFireWater
    + {glyph_discoveredSigils has EarthFireAir && leftSigilName == "EarthFire"}[{sigils_translator(EarthFireAir)} #position:left3 #glyph3:{grimoire_sigilGlyph3(EarthFireAir)} #firstLine:{grimoire_textEarthFireAirOne} #secondLine:{grimoire_textEarthFireAirTwo} #thirdLine:{grimoire_textEarthFireAirThree} #status:{grimoire_statusThirdSigils(EarthFireAir)}]
        ~ glyph_actualActiveSigil += EarthFireAir

    + {glyph_discoveredSigils has FireAirWater && leftSigilName == "FireAir"}[{sigils_translator(FireAirWater)} #position:left1 #glyph3:{grimoire_sigilGlyph3(FireAirWater)} #firstLine:{grimoire_textFireAirWaterOne} #secondLine:{grimoire_textFireAirWaterTwo} #thirdLine:{grimoire_textFireAirWaterThree} #status:{grimoire_statusThirdSigils(FireAirWater)}]
        ~ glyph_actualActiveSigil += FireAirWater
    + {glyph_discoveredSigils has FireAirEarth && leftSigilName == "FireAir"}[{sigils_translator(FireAirEarth)} #position:left2 #glyph3:{grimoire_sigilGlyph3(FireAirEarth)} #firstLine:{grimoire_textFireAirEarthOne} #secondLine:{grimoire_textFireAirEarthTwo} #thirdLine:{grimoire_textFireAirEarthThree} #status:{grimoire_statusThirdSigils(FireAirEarth)}]
        ~ glyph_actualActiveSigil += FireAirEarth
    + {glyph_discoveredSigils has FireAirAether && leftSigilName == "FireAir"}[{sigils_translator(FireAirAether)} #position:left3 #glyph3:{grimoire_sigilGlyph3(FireAirAether)} #firstLine:{grimoire_textFireAirAetherOne} #secondLine:{grimoire_textFireAirAetherTwo} #thirdLine:{grimoire_textFireAirAetherThree} #status:{grimoire_statusThirdSigils(FireAirAether)}]
        ~ glyph_actualActiveSigil += FireAirAether

    + {glyph_discoveredSigils has FireEarthWater && leftSigilName == "FireEarth"}[{sigils_translator(FireEarthWater)} #position:left1 #glyph3:{grimoire_sigilGlyph3(FireEarthWater)} #firstLine:{grimoire_textFireEarthWaterOne} #secondLine:{grimoire_textFireEarthWaterTwo} #thirdLine:{grimoire_textFireEarthWaterThree} #status:{grimoire_statusThirdSigils(FireEarthWater)}]
        ~ glyph_actualActiveSigil += FireEarthWater
    + {glyph_discoveredSigils has FireEarthAir && leftSigilName == "FireEarth"}[{sigils_translator(FireEarthAir)} #position:left2 #glyph3:{grimoire_sigilGlyph3(FireEarthAir)} #firstLine:{grimoire_textFireEarthAirOne} #secondLine:{grimoire_textFireEarthAirTwo} #thirdLine:{grimoire_textFireEarthAirThree} #status:{grimoire_statusThirdSigils(FireEarthAir)}]
        ~ glyph_actualActiveSigil += FireEarthAir
    + {glyph_discoveredSigils has FireEarthAether && leftSigilName == "FireEarth"}[{sigils_translator(FireEarthAether)} #position:left3 #glyph3:{grimoire_sigilGlyph3(FireEarthAether)} #firstLine:{grimoire_textFireEarthAetherOne} #secondLine:{grimoire_textFireEarthAetherTwo} #thirdLine:{grimoire_textFireEarthAetherThree} #status:{grimoire_statusThirdSigils(FireEarthAether)}]
        ~ glyph_actualActiveSigil += FireEarthAether

    + {glyph_discoveredSigils has AetherAirFire && leftSigilName == "AetherAir"}[{sigils_translator(AetherAirFire)} #position:left1 #glyph3:{grimoire_sigilGlyph3(AetherAirFire)} #firstLine:{grimoire_textAetherAirFireOne} #secondLine:{grimoire_textAetherAirFireTwo} #thirdLine:{grimoire_textAetherAirFireThree} #status:{grimoire_statusThirdSigils(AetherAirFire)}]
        ~ glyph_actualActiveSigil += AetherAirFire
    + {glyph_discoveredSigils has AetherAirEarth && leftSigilName == "AetherAir"}[{sigils_translator(AetherAirEarth)} #position:left2 #glyph3:{grimoire_sigilGlyph3(AetherAirEarth)} #firstLine:{grimoire_textAetherAirEarthOne} #secondLine:{grimoire_textAetherAirEarthTwo} #thirdLine:{grimoire_textAetherAirEarthThree} #status:{grimoire_statusThirdSigils(AetherAirEarth)}]
        ~ glyph_actualActiveSigil += AetherAirEarth
    + {glyph_discoveredSigils has AetherAirWater && leftSigilName == "AetherAir"}[{sigils_translator(AetherAirWater)} #position:left3 #glyph3:{grimoire_sigilGlyph3(AetherAirWater)} #firstLine:{grimoire_textAetherAirWaterOne} #secondLine:{grimoire_textAetherAirWaterTwo} #thirdLine:{grimoire_textAetherAirWaterThree} #status:{grimoire_statusThirdSigils(AetherAirWater)}]
        ~ glyph_actualActiveSigil += AetherAirWater


    + {glyph_discoveredSigils has AetherEarthWater && leftSigilName == "AetherEarth"}[{sigils_translator(AetherEarthWater)} #position:left1 #glyph3:{grimoire_sigilGlyph3(AetherEarthWater)} #firstLine:{grimoire_textAetherEarthWaterOne} #secondLine:{grimoire_textAetherEarthWaterTwo} #thirdLine:{grimoire_textAetherEarthWaterThree} #status:{grimoire_statusThirdSigils(AetherEarthWater)}]
        ~ glyph_actualActiveSigil += AetherEarthWater
    + {glyph_discoveredSigils has AetherEarthFire && leftSigilName == "AetherEarth"}[{sigils_translator(AetherEarthFire)} #position:left2 #glyph3:{grimoire_sigilGlyph3(AetherEarthFire)} #firstLine:{grimoire_textAetherEarthFireOne} #secondLine:{grimoire_textAetherEarthFireTwo} #thirdLine:{grimoire_textAetherEarthFireThree} #status:{grimoire_statusThirdSigils(AetherEarthFire)}]
        ~ glyph_actualActiveSigil += AetherEarthFire
    + {glyph_discoveredSigils has AetherEarthAir && leftSigilName == "AetherEarth"}[{sigils_translator(AetherEarthAir)} #position:left3 #glyph3:{grimoire_sigilGlyph3(AetherEarthAir)} #firstLine:{grimoire_textAetherEarthAirOne} #secondLine:{grimoire_textAetherEarthAirTwo} #thirdLine:{grimoire_textAetherEarthAirThree} #status:{grimoire_statusThirdSigils(AetherEarthAir)}]
        ~ glyph_actualActiveSigil += AetherEarthAir


    //right
    + {glyph_discoveredSigils has AirEarthFire && leftSigilName == "AirWater"}[{sigils_translator(AirEarthFire)} #position:right1 #glyph3:{grimoire_sigilGlyph3(AirEarthFire)} #firstLine:{grimoire_textAirEarthFireOne} #secondLine:{grimoire_textAirEarthFireTwo} #thirdLine:{grimoire_textAirEarthFireThree} #status:{grimoire_statusThirdSigils(AirEarthFire)}]
        ~ glyph_actualActiveSigil += AirEarthFire
    + {glyph_discoveredSigils has AirEarthWater && leftSigilName == "AirWater"}[{sigils_translator(AirEarthWater)} #position:right2 #glyph3:{grimoire_sigilGlyph3(AirEarthWater)} #firstLine:{grimoire_textAirEarthWaterOne} #secondLine:{grimoire_textAirEarthWaterTwo} #thirdLine:{grimoire_textAirEarthWaterThree} #status:{grimoire_statusThirdSigils(AirEarthWater)}]
        ~ glyph_actualActiveSigil += AirEarthWater
    + {glyph_discoveredSigils has AirEarthAether && leftSigilName == "AirWater"}[{sigils_translator(AirEarthAether)} #position:right3 #glyph3:{grimoire_sigilGlyph3(AirEarthAether)} #firstLine:{grimoire_textAirEarthAetherOne} #secondLine:{grimoire_textAirEarthAetherTwo} #thirdLine:{grimoire_textAirEarthAetherThree} #status:{grimoire_statusThirdSigils(AirEarthAether)}]
        ~ glyph_actualActiveSigil += AirEarthAether

    + {glyph_discoveredSigils has AirAetherFire && leftSigilName == "AirFire"}[{sigils_translator(AirAetherFire)} #position:right1 #glyph3:{grimoire_sigilGlyph3(AirAetherFire)} #firstLine:{grimoire_textAirAetherFireOne} #secondLine:{grimoire_textAirAetherFireTwo} #thirdLine:{grimoire_textAirAetherFireThree} #status:{grimoire_statusThirdSigils(AirAetherFire)}]
        ~ glyph_actualActiveSigil += AirAetherFire
    + {glyph_discoveredSigils has AirAetherEarth && leftSigilName == "AirFire"}[{sigils_translator(AirAetherEarth)} #position:right2 #glyph3:{grimoire_sigilGlyph3(AirAetherEarth)} #firstLine:{grimoire_textAirAetherEarthOne} #secondLine:{grimoire_textAirAetherEarthTwo} #thirdLine:{grimoire_textAirAetherEarthThree} #status:{grimoire_statusThirdSigils(AirAetherEarth)}]
        ~ glyph_actualActiveSigil += AirAetherEarth
    + {glyph_discoveredSigils has AirAetherWater && leftSigilName == "AirFire"}[{sigils_translator(AirAetherWater)} #position:right3 #glyph3:{grimoire_sigilGlyph3(AirAetherWater)} #firstLine:{grimoire_textAirAetherWaterOne} #secondLine:{grimoire_textAirAetherWaterTwo} #thirdLine:{grimoire_textAirAetherWaterThree} #status:{grimoire_statusThirdSigils(AirAetherWater)}]
        ~ glyph_actualActiveSigil += AirAetherWater

    + {glyph_discoveredSigils has WaterEarthAir && leftSigilName == "WaterAir"}[{sigils_translator(WaterEarthAir)} #position:right1 #glyph3:{grimoire_sigilGlyph3(WaterEarthAir)} #firstLine:{grimoire_textWaterEarthAirOne} #secondLine:{grimoire_textWaterEarthAirTwo} #thirdLine:{grimoire_textWaterEarthAirThree} #status:{grimoire_statusThirdSigils(WaterEarthAir)}]
        ~ glyph_actualActiveSigil += WaterEarthAir
    + {glyph_discoveredSigils has WaterEarthFire && leftSigilName == "WaterAir"}[{sigils_translator(WaterEarthFire)} #position:right2 #glyph3:{grimoire_sigilGlyph3(WaterEarthFire)} #firstLine:{grimoire_textWaterEarthFireOne} #secondLine:{grimoire_textWaterEarthFireTwo} #thirdLine:{grimoire_textWaterEarthFireThree} #status:{grimoire_statusThirdSigils(WaterEarthFire)}]
        ~ glyph_actualActiveSigil += WaterEarthFire
    + {glyph_discoveredSigils has WaterEarthAether && leftSigilName == "WaterAir"}[{sigils_translator(WaterEarthAether)} #position:right3 #glyph3:{grimoire_sigilGlyph3(WaterEarthAether)} #firstLine:{grimoire_textWaterEarthAetherOne} #secondLine:{grimoire_textWaterEarthAetherTwo} #thirdLine:{grimoire_textWaterEarthAetherThree} #status:{grimoire_statusThirdSigils(WaterEarthAether)}]
        ~ glyph_actualActiveSigil += WaterEarthAether

    + {glyph_discoveredSigils has WaterAetherAir && leftSigilName == "WaterFire"}[{sigils_translator(WaterAetherAir)} #position:right1 #glyph3:{grimoire_sigilGlyph3(WaterAetherAir)} #firstLine:{grimoire_textWaterAetherAirOne} #secondLine:{grimoire_textWaterAetherAirTwo} #thirdLine:{grimoire_textWaterAetherAirThree} #status:{grimoire_statusThirdSigils(WaterAetherAir)}]
        ~ glyph_actualActiveSigil += WaterAetherAir
    + {glyph_discoveredSigils has WaterAetherEarth && leftSigilName == "WaterFire"}[{sigils_translator(WaterAetherEarth)} #position:right2 #glyph3:{grimoire_sigilGlyph3(WaterAetherEarth)} #firstLine:{grimoire_textWaterAetherEarthOne} #secondLine:{grimoire_textWaterAetherEarthTwo} #thirdLine:{grimoire_textWaterAetherEarthThree} #status:{grimoire_statusThirdSigils(WaterAetherEarth)}]
        ~ glyph_actualActiveSigil += WaterAetherEarth
    + {glyph_discoveredSigils has WaterAetherFire && leftSigilName == "WaterFire"}[{sigils_translator(WaterAetherFire)} #position:right3 #glyph3:{grimoire_sigilGlyph3(WaterAetherFire)} #firstLine:{grimoire_textWaterAetherFireOne} #secondLine:{grimoire_textWaterAetherFireTwo} #thirdLine:{grimoire_textWaterAetherFireThree} #status:{grimoire_statusThirdSigils(WaterAetherFire)}]
        ~ glyph_actualActiveSigil += WaterAetherFire

    + {glyph_discoveredSigils has EarthWaterFire && leftSigilName == "EarthAir"}[{sigils_translator(EarthWaterFire)} #position:right1 #glyph3:{grimoire_sigilGlyph3(EarthWaterFire)} #firstLine:{grimoire_textEarthWaterFireOne} #secondLine:{grimoire_textEarthWaterFireTwo} #thirdLine:{grimoire_textEarthWaterFireThree} #status:{grimoire_statusThirdSigils(EarthWaterFire)}]
        ~ glyph_actualActiveSigil += EarthWaterFire
    + {glyph_discoveredSigils has EarthWaterAether && leftSigilName == "EarthAir"}[{sigils_translator(EarthWaterAether)} #position:right2 #glyph3:{grimoire_sigilGlyph3(EarthWaterAether)} #firstLine:{grimoire_textEarthWaterAetherOne} #secondLine:{grimoire_textEarthWaterAetherTwo} #thirdLine:{grimoire_textEarthWaterAetherThree} #status:{grimoire_statusThirdSigils(EarthWaterAether)}]
        ~ glyph_actualActiveSigil += EarthWaterAether
    + {glyph_discoveredSigils has EarthWaterAir && leftSigilName == "EarthAir"}[{sigils_translator(EarthWaterAir)} #position:right3 #glyph3:{grimoire_sigilGlyph3(EarthWaterAir)} #firstLine:{grimoire_textEarthWaterAirOne} #secondLine:{grimoire_textEarthWaterAirTwo} #thirdLine:{grimoire_textEarthWaterAirThree} #status:{grimoire_statusThirdSigils(EarthWaterAir)}]
        ~ glyph_actualActiveSigil += EarthWaterAir

    + {glyph_discoveredSigils has EarthAetherAir && leftSigilName == "EarthFire"}[{sigils_translator(EarthAetherAir)} #position:right1 #glyph3:{grimoire_sigilGlyph3(EarthAetherAir)} #firstLine:{grimoire_textEarthAetherAirOne} #secondLine:{grimoire_textEarthAetherAirTwo} #thirdLine:{grimoire_textEarthAetherAirThree} #status:{grimoire_statusThirdSigils(EarthAetherAir)}]
        ~ glyph_actualActiveSigil += EarthAetherAir
    + {glyph_discoveredSigils has EarthAetherFire && leftSigilName == "EarthFire"}[{sigils_translator(EarthAetherFire)} #position:right2 #glyph3:{grimoire_sigilGlyph3(EarthAetherFire)} #firstLine:{grimoire_textEarthAetherFireOne} #secondLine:{grimoire_textEarthAetherFireTwo} #thirdLine:{grimoire_textEarthAetherFireThree} #status:{grimoire_statusThirdSigils(EarthAetherFire)}]
        ~ glyph_actualActiveSigil += EarthAetherFire
    + {glyph_discoveredSigils has EarthAetherWater && leftSigilName == "EarthFire"}[{sigils_translator(EarthAetherWater)} #position:right3 #glyph3:{grimoire_sigilGlyph3(EarthAetherWater)} #firstLine:{grimoire_textEarthAetherWaterOne} #secondLine:{grimoire_textEarthAetherWaterTwo} #thirdLine:{grimoire_textEarthAetherWaterThree} #status:{grimoire_statusThirdSigils(EarthAetherWater)}]
        ~ glyph_actualActiveSigil += EarthAetherWater

    + {glyph_discoveredSigils has FireWaterEarth && leftSigilName == "FireAir"}[{sigils_translator(FireWaterEarth)} #position:right1 #glyph3:{grimoire_sigilGlyph3(FireWaterEarth)} #firstLine:{grimoire_textFireWaterEarthOne} #secondLine:{grimoire_textFireWaterEarthTwo} #thirdLine:{grimoire_textFireWaterEarthThree} #status:{grimoire_statusThirdSigils(FireWaterEarth)}]
        ~ glyph_actualActiveSigil += FireWaterEarth
    + {glyph_discoveredSigils has FireWaterAether && leftSigilName == "FireAir"}[{sigils_translator(FireWaterAether)} #position:right2 #glyph3:{grimoire_sigilGlyph3(FireWaterAether)} #firstLine:{grimoire_textFireWaterAetherOne} #secondLine:{grimoire_textFireWaterAetherTwo} #thirdLine:{grimoire_textFireWaterAetherThree} #status:{grimoire_statusThirdSigils(FireWaterAether)}]
        ~ glyph_actualActiveSigil += FireWaterAether
    + {glyph_discoveredSigils has FireWaterAir && leftSigilName == "FireAir"}[{sigils_translator(FireWaterAir)} #position:right3 #glyph3:{grimoire_sigilGlyph3(FireWaterAir)} #firstLine:{grimoire_textFireWaterAirOne} #secondLine:{grimoire_textFireWaterAirTwo} #thirdLine:{grimoire_textFireWaterAirThree} #status:{grimoire_statusThirdSigils(FireWaterAir)}]
        ~ glyph_actualActiveSigil += FireWaterAir

    + {glyph_discoveredSigils has FireAetherEarth && leftSigilName == "FireEarth"}[{sigils_translator(FireAetherEarth)} #position:right1 #glyph3:{grimoire_sigilGlyph3(FireAetherEarth)} #firstLine:{grimoire_textFireAetherEarthOne} #secondLine:{grimoire_textFireAetherEarthTwo} #thirdLine:{grimoire_textFireAetherEarthThree} #status:{grimoire_statusThirdSigils(FireAetherEarth)}]
        ~ glyph_actualActiveSigil += FireAetherEarth
    + {glyph_discoveredSigils has FireAetherWater && leftSigilName == "FireEarth"}[{sigils_translator(FireAetherWater)} #position:right2 #glyph3:{grimoire_sigilGlyph3(FireAetherWater)} #firstLine:{grimoire_textFireAetherWaterOne} #secondLine:{grimoire_textFireAetherWaterTwo} #thirdLine:{grimoire_textFireAetherWaterThree} #status:{grimoire_statusThirdSigils(FireAetherWater)}]
        ~ glyph_actualActiveSigil += FireAetherWater
    + {glyph_discoveredSigils has FireAetherAir && leftSigilName == "FireEarth"}[{sigils_translator(FireAetherAir)} #position:right3 #glyph3:{grimoire_sigilGlyph3(FireAetherAir)} #firstLine:{grimoire_textFireAetherAirOne} #secondLine:{grimoire_textFireAetherAirTwo} #thirdLine:{grimoire_textFireAetherAirThree} #status:{grimoire_statusThirdSigils(FireAetherAir)}]
        ~ glyph_actualActiveSigil += FireAetherAir
    
    + {glyph_discoveredSigils has AetherWaterAir && leftSigilName == "AetherAir"}[{sigils_translator(AetherWaterAir)} #position:right1 #glyph3:{grimoire_sigilGlyph3(AetherWaterAir)} #firstLine:{grimoire_textAetherWaterAirOne} #secondLine:{grimoire_textAetherWaterAirTwo} #thirdLine:{grimoire_textAetherWaterAirThree} #status:{grimoire_statusThirdSigils(AetherWaterAir)}]
        ~ glyph_actualActiveSigil += AetherWaterAir
    + {glyph_discoveredSigils has AetherWaterEarth && leftSigilName == "AetherAir"}[{sigils_translator(AetherWaterEarth)} #position:right2 #glyph3:{grimoire_sigilGlyph3(AetherWaterEarth)} #firstLine:{grimoire_textAetherWaterEarthOne} #secondLine:{grimoire_textAetherWaterEarthTwo} #thirdLine:{grimoire_textAetherWaterEarthThree} #status:{grimoire_statusThirdSigils(AetherWaterEarth)}]
        ~ glyph_actualActiveSigil += AetherWaterEarth
    + {glyph_discoveredSigils has AetherWaterFire && leftSigilName == "AetherAir"}[{sigils_translator(AetherWaterFire)} #position:right3 #glyph3:{grimoire_sigilGlyph3(AetherWaterFire)} #firstLine:{grimoire_textAetherWaterFireOne} #secondLine:{grimoire_textAetherWaterFireTwo} #thirdLine:{grimoire_textAetherWaterFireThree} #status:{grimoire_statusThirdSigils(AetherWaterFire)}]
        ~ glyph_actualActiveSigil += AetherWaterFire


    + {glyph_discoveredSigils has AetherFireWater && leftSigilName == "AetherEarth"}[{sigils_translator(AetherFireWater)} #position:right1 #glyph3:{grimoire_sigilGlyph3(AetherFireWater)} #firstLine:{grimoire_textAetherFireWaterOne} #secondLine:{grimoire_textAetherFireWaterTwo} #thirdLine:{grimoire_textAetherFireWaterThree} #status:{grimoire_statusThirdSigils(AetherFireWater)}]
        ~ glyph_actualActiveSigil += AetherFireWater
    + {glyph_discoveredSigils has AetherFireAir && leftSigilName == "AetherEarth"}[{sigils_translator(AetherFireAir)} #position:right2 #glyph3:{grimoire_sigilGlyph3(AetherFireAir)} #firstLine:{grimoire_textAetherFireAirOne} #secondLine:{grimoire_textAetherFireAirTwo} #thirdLine:{grimoire_textAetherFireAirThree} #status:{grimoire_statusThirdSigils(AetherFireAir)}]
        ~ glyph_actualActiveSigil += AetherFireAir
    + {glyph_discoveredSigils has AetherFireEarth && leftSigilName == "AetherEarth"}[{sigils_translator(AetherFireEarth)} #position:right3 #glyph3:{grimoire_sigilGlyph3(AetherFireEarth)} #firstLine:{grimoire_textAetherFireEarthOne} #secondLine:{grimoire_textAetherFireEarthTwo} #thirdLine:{grimoire_textAetherFireEarthThree} #status:{grimoire_statusThirdSigils(AetherFireEarth)}]
        ~ glyph_actualActiveSigil += AetherFireEarth



    //Tasti precedenti
    + {leftSigilName == "AirFire"} [{grimoire_sigilsLabelsName(AirEarth)}#bookmark:previous]
        -> grimoire_sigils_thirdLevel (Air, Water, Air, Earth)
    
    + {leftSigilName == "WaterAir"} [{grimoire_sigilsLabelsName(AirAether)}#bookmark:previous]
        -> grimoire_sigils_thirdLevel (Air, Fire, Air, Aether)
    
    + {leftSigilName == "WaterFire"} [{grimoire_sigilsLabelsName(WaterEarth)}#bookmark:previous]
        -> grimoire_sigils_thirdLevel (Water, Air, Water, Earth)
    
    + {leftSigilName == "EarthAir"} [{grimoire_sigilsLabelsName(WaterAether)}#bookmark:previous]
        -> grimoire_sigils_thirdLevel (Water, Fire, Water, Aether)
    
    + {leftSigilName == "EarthFire"} [{grimoire_sigilsLabelsName(EarthWater)}#bookmark:previous]
        -> grimoire_sigils_thirdLevel (Earth, Air, Earth, Water)
    
    + {leftSigilName == "FireAir"} [{grimoire_sigilsLabelsName(EarthAether)}#bookmark:previous]
        -> grimoire_sigils_thirdLevel (Earth, Fire, Earth, Aether)

    + {leftSigilName == "FireEarth"} [{grimoire_sigilsLabelsName(FireWater)}#bookmark:previous]
        -> grimoire_sigils_thirdLevel (Fire, Air, Fire, Water)

    + {leftSigilName == "AetherAir"} [{grimoire_sigilsLabelsName(FireAether)}#bookmark:previous]
        -> grimoire_sigils_thirdLevel (Fire, Earth, Fire, Aether)
    
    + {leftSigilName == "AetherEarth"} [{grimoire_sigilsLabelsName(AetherWater)}#bookmark:previous]
        -> grimoire_sigils_thirdLevel (Aether, Air, Aether, Water)

    //Tasti seguenti
    + {leftSigilName == "AirWater"} [{grimoire_sigilsLabelsName(AirFire)}#bookmark:next]
        -> grimoire_sigils_thirdLevel (Air, Fire, Air, Aether)

    + {leftSigilName == "AirFire"} [{grimoire_sigilsLabelsName(WaterAir)}#bookmark:next]
        -> grimoire_sigils_thirdLevel (Water, Air, Water, Earth)

    + {leftSigilName == "WaterAir"} [{grimoire_sigilsLabelsName(WaterFire)}#bookmark:next]
        -> grimoire_sigils_thirdLevel (Water, Fire, Water, Aether)

    + {leftSigilName == "WaterFire"} [{grimoire_sigilsLabelsName(EarthAir)}#bookmark:next]
        -> grimoire_sigils_thirdLevel (Earth, Air, Earth, Water)

    + {leftSigilName == "EarthAir"} [{grimoire_sigilsLabelsName(EarthFire)}#bookmark:next]
        -> grimoire_sigils_thirdLevel (Earth, Fire, Earth, Aether)

    + {leftSigilName == "EarthFire"} [{grimoire_sigilsLabelsName(FireAir)}#bookmark:next]
        -> grimoire_sigils_thirdLevel (Fire, Air, Fire, Water)

    + {leftSigilName == "FireAir"} [{grimoire_sigilsLabelsName(FireEarth)}#bookmark:next]
        -> grimoire_sigils_thirdLevel (Fire, Earth, Fire, Aether)

    + {leftSigilName == "FireEarth"} [{grimoire_sigilsLabelsName(AetherAir)}#bookmark:next]
        -> grimoire_sigils_thirdLevel (Aether, Air, Aether, Water)

    + {leftSigilName == "AetherAir"} [{grimoire_sigilsLabelsName(AetherEarth)}#bookmark:next]
        -> grimoire_sigils_thirdLevel (Aether, Earth, Aether, Fire)


    + [Index #bookmark:index]
        -> grimoire
    + [Sigilli #bookmark:secondLevel]
        -> grimoire_sigils
    - 
        -> top    