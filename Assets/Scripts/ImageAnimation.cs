using UnityEngine;

public class ImageAnimation : MonoBehaviour
{
    [SerializeField] string myAnimationName;

    public void OnAnimation(string animationName)
    {
        if ( animationName != myAnimationName ) return;
        
        GetComponent<Animator>().SetTrigger( "AnimationTrigger" );
    }
}
