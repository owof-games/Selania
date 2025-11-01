using UnityEngine;

public class AudioAnimation : StateMachineBehaviour

{
    override public void OnStateEnter(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
    {
        animator.gameObject.GetComponent<AudioSource>().Play();
    }
   
}
