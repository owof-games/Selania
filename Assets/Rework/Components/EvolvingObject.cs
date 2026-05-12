using System;
using System.Linq;
using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components
{
    public class EvolvingObject : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] [Tooltip("Ink variable name (number) that contains the state of the object")]
        private string inkVariableName = null!;

        [SerializeField] [Tooltip("Definition of the sprites to use for the various possible values of the variable")]
        private SpriteDefinition[] spriteDefinitions = Array.Empty<SpriteDefinition>();

        [Inject] internal ILogger<EvolvingObject> Logger = null!;

        [Inject] internal IStoryVariableValues StoryVariableValues = null!;

        private void Start()
        {
            // get the sprite renderer
            var spriteRenderer = GetComponent<SpriteRenderer>();

            // whenever the variable changes, look for the corresponding sprite
            StoryVariableValues
                .GetVariableObservable<int>(inkVariableName)
                .Subscribe(value =>
                {
                    var spriteDefinition = spriteDefinitions
                        .FirstOrDefault(spriteDefinition => spriteDefinition.value == value);
                    if (spriteDefinition == null)
                        Logger.ZLogWarning($"Cannot find sprite definition of {gameObject.name} for value {value}");

                    spriteRenderer.sprite = spriteDefinition?.sprite;
                })
                .AddTo(this);
        }

        [Serializable]
        public class SpriteDefinition
        {
            public int value;
            public Sprite? sprite;
        }
    }
}