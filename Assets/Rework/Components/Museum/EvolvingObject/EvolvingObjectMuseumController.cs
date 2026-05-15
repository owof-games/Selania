using UnityEngine;
using VContainer.Unity;

namespace Selania.Rework.Components.Museum.EvolvingObject
{
    public class EvolvingObjectMuseumController : MonoBehaviour
    {
        [SerializeField] private EvolvingObjectScope evolvingObjectScope = null!;

        [SerializeField] private GameObject rootObject = null!;

        [SerializeField] private GameObject evolvingObjectPrefab = null!;

        private GameObject? _evolvingObject;

        private int _state;

        public void EnterRoomA()
        {
            evolvingObjectScope.EvolvingObjectStoryChangeRoomContentsNotifierInstance.EnterRoomA();
            using (LifetimeScope.EnqueueParent(evolvingObjectScope))
            {
                _evolvingObject = Instantiate(evolvingObjectPrefab, rootObject.transform);
            }
        }

        public void EnterRoomB()
        {
            if (_evolvingObject != null) Destroy(_evolvingObject);

            evolvingObjectScope.EvolvingObjectStoryChangeRoomContentsNotifierInstance.EnterRoomB();
        }

        public void ChangeState()
        {
            _state = (_state + 1) % 3;
            evolvingObjectScope.EvolvingObjectStoryVariableValuesInstance.SetState(_state);
        }
    }
}