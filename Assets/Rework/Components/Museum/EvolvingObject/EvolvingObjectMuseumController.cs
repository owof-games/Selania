using UnityEngine;

namespace Selania.Rework.Components.Museum.EvolvingObject
{
    public class EvolvingObjectMuseumController : MonoBehaviour
    {
        [SerializeField] private EvolvingObjectScope evolvingObjectScope = null!;

        private int _state;

        public void EnterRoomA()
        {
            evolvingObjectScope.EvolvingObjectStoryChangeRoomContentsNotifierInstance.EnterRoomA();
        }

        public void EnterRoomB()
        {
            evolvingObjectScope.EvolvingObjectStoryChangeRoomContentsNotifierInstance.EnterRoomB();
        }

        public void ChangeState()
        {
            _state = (_state + 1) % 3;
            evolvingObjectScope.EvolvingObjectStoryVariableValuesInstance.SetState(_state);
        }
    }
}