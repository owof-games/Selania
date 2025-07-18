                    /* ---------------------------------
                    
                       ELEMENTI DI GESTIONE DEL GIOCO
                    
                     ----------------------------------*/
    
    INCLUDE main.ink

//File con gli appunti di gestione del progetto, la formattazione etc.
    INCLUDE Notes\FileManagement.ink
    INCLUDE Notes\Contents.ink
    INCLUDE Notes\ToDo.ink

//File dedicati alla gestione complessiva del progetto
    INCLUDE Code\Debug.ink
    INCLUDE Code\ObjectAndCharList.ink
    INCLUDE Code\PGManagement.ink
    INCLUDE Code\ChangePlaces.ink
    INCLUDE Code\PlacesContentsAndFunctions.ink
    INCLUDE Code\BackgroundsAndSounds.ink
    INCLUDE Code\BigDialogue.ink
    INCLUDE Code\SpeakerTagManagers.ink


//File dedicati alla gestione delle personagge
    INCLUDE Characters\Functions\CommonFunctions.ink
    INCLUDE Characters\Functions\Movements.ink
    INCLUDE Characters\Functions\Ink.ink
    
    INCLUDE Characters\Functions\FirstCharacterManagement.ink
    INCLUDE Characters\Functions\SecondCharacterManagement.ink
    INCLUDE Characters\Functions\ThirdCharacterManagement.ink
    INCLUDE Characters\Functions\FourthCharacterManagement.ink
    INCLUDE Characters\Functions\FifthCharacterManagement.ink

                    /* ---------------------------------
                    
                                CONTENUTI
                    
                     ----------------------------------*/

//Personagge

    INCLUDE Characters\Mentor\HelpfulMentor.ink
    INCLUDE Characters\Mentor\StoryletsManagement.ink
    INCLUDE Characters\Mentor\StoryletsContent.ink
    
    INCLUDE Characters\Stories\FirstCharacter.ink
    INCLUDE Characters\Stories\SecondCharacter.ink
    INCLUDE Characters\Stories\ThirdCharacter.ink
    INCLUDE Characters\Stories\FourthCharacter.ink
    INCLUDE Characters\Stories\FifthCharacter.ink
    
    INCLUDE Characters\Stories\CommonStorylets.ink

//Gestione dell'inventario
    INCLUDE Inventory\Inventory.ink
    INCLUDE Inventory\InventoryManagement.ink

//Gestione del libro
    INCLUDE Book\MainBook.ink
    INCLUDE Book\BookFunctions.ink

//Bedroom
    INCLUDE Bedroom\Bedroom.ink

//Bus Stop
    INCLUDE TrainStop\TrainStop.ink

//Forest
    INCLUDE Forest\Forest.ink
    INCLUDE Forest\Fungus.ink

//Greenhouse
    INCLUDE Greenhouse\Greenhouse.ink
    INCLUDE Greenhouse\Cultivable.ink
    INCLUDE Greenhouse\CultivableManagement.ink
    INCLUDE Greenhouse\GreenhouseMiddlePath.ink

//Nest
    INCLUDE Nest\Nest.ink

//Laboratory
    INCLUDE Laboratory\Laboratory.ink

//Library
    INCLUDE Library\Library.ink
    INCLUDE Library\FirstStory.ink
    INCLUDE Library\SecondStory.ink
    INCLUDE Library\ThirdStory.ink
    INCLUDE Library\FourthStory.ink
    INCLUDE Library\LibaryManagement.ink
    INCLUDE Library\StoryNotes.ink





















//Starting point
    -> main











