using UnityEngine;
using UnityEngine.Video;

// questo script si occupa di:
// - lanciare in automatico il video
// - sganciare il file video dal player se siamo in una build webgl, e usare invece un video in streaming; questo perché le build webgl
//   possono solo mostrare video se sono in streaming, e non se sono parte della build del gioco stesso
public class VideoPlayerWebGLSupport : MonoBehaviour
{
    [SerializeField] private VideoPlayer videoPlayer;
    [SerializeField, InspectorName("WebGL URL")] private string webGlURL;

    private void Awake()
    {
#if UNITY_WEBGL
        videoPlayer.url = webGlURL;
        videoPlayer.clip = null;
#endif
        videoPlayer.Play();
    }
}
