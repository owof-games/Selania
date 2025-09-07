using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SaturationManager : MonoBehaviour
{
    private const string saturationVar = "saturationVar";

    [SerializeField] private DialogueManagerSingleInk dialogueManagerSingleInk;

    [SerializeField, Tooltip("Minimo livello di saturazione")] private float minSaturation = 0f;
    [SerializeField, Tooltip("Massimo livello di saturazione")] private float maxSaturation = 1f;

    [SerializeField, Tooltip("Massima valore della variabile \"saturationVar\" su Ink")] private int maxSaturationInk = 5;

    [SerializeField, Tooltip("Shader con saturazione abilitata")] Shader targetShader;

    [SerializeField, Tooltip("Nome usato nel tag ink per la stanza da letto")] string bedroomBackgroundName = "backBedroom";

    private int? saturationInk;
    private string backgroundName;

    void Start()
    {
        // Quando cambia la variabile di Ink, aggiorniamo la saturazione
        dialogueManagerSingleInk.RegisterVariableObserver(saturationVar, (_varName, newValue) =>
        {
            saturationInk = (int)newValue;
            OnSaturationChange();
        });

        // Inizializziamo la saturazione all'inizio
        saturationInk = (int)dialogueManagerSingleInk.GetVariableValue(saturationVar);
        OnSaturationChange();

        // registriamo il listener per il cambio di background
        //     dialogueManagerSingleInk.OnBackgroundChanged.AddListener((backgroundName) =>
        //     {
        //         // quando cambia il background, ricalcoliamo la saturazione
        //         var saturation = backgroundName == bedroomBackgroundName ?
        //             dialogueManagerSingleInk.GetVariableValue(saturationVar) :
        //             maxSaturationInk;
        //         OnSaturationChange((int)saturation);
        //     });
    }

    public void OnBackgroundChanged(string backgroundName)
    {
        // quando cambia il background, ricalcoliamo la saturazione
        this.backgroundName = backgroundName;
        OnSaturationChange();
    }

    private readonly HashSet<Image> processedImages = new();

    private void OnSaturationChange()
    {
        // Aspetta ad aggiornare la saturazione se non abbiamo ancora tutte le informazioni necessarie
        if (saturationInk == null || backgroundName == null)
            return;

        // Mappiamo il valore di saturazione da Ink (0..maxSaturationInk) a (minSaturation..maxSaturation)
        var mappedSaturation = Mathf.Lerp(
            minSaturation,
            maxSaturation,
            backgroundName == bedroomBackgroundName ? (float)saturationInk.Value / maxSaturationInk : 1f
            );

        // Applichiamo la saturazione a tutte le immagini che usano uno shader che la supporta
        foreach (var image in FindObjectsByType<Image>(FindObjectsInactive.Include, FindObjectsSortMode.None))
        {
            // Applichiamo il filtro solo se lo shader supporta la saturazione
            if (image.materialForRendering.shader != targetShader)
                continue;
            // vedi: https://discussions.unity.com/t/how-can-i-change-the-shader-parameters-for-an-ui-image/132797
#if UNITY_EDITOR
            if (!processedImages.Contains(image))
            {
                var newMat = Instantiate(image.material);
                image.material = newMat;
                processedImages.Add(image);
            }
            image.material.SetFloat("_Saturation", mappedSaturation);
#else
            image.materialForRendering.SetFloat("_Saturation", mappedSaturation);
#endif
        }
    }
}
