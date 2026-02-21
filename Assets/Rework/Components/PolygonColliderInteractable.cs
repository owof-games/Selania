using System.Collections.Generic;
using Alchemy.Inspector;
using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Interfaces;
using UnityEditor;
using UnityEngine;
using UnityEngine.EventSystems;
using VContainer;

namespace Selania.Rework.Components
{
    /// <summary>
    ///     An <see cref="IInteractable"/> component that uses a click on a polygon collider as the trigger for interaction.
    /// </summary>
    [RequireComponent(typeof(SpriteRenderer))]
    public class PolygonColliderInteractable : MonoBehaviour, IInteractable, IPointerClickHandler, IPointerEnterHandler,
        IPointerExitHandler, IAutomaticEditorInject
    {
        /// <summary>
        ///     Shared list used to update the polygon collider.
        /// </summary>
        private static readonly List<Vector2> PhysicsShapePath = new();

        /// <summary>
        ///     The subject used to implement <see cref="interactionObservable" />.
        /// </summary>
        private Subject<IInteractable>? _interactionSubject;

        // temporary, to render a color change
        private SpriteRenderer? _spriteRenderer;

        /// <summary>
        ///     The logger used for this object.
        /// </summary>
        [Inject] internal ILogger<PolygonColliderInteractable> Logger = null!;

        private void Start()
        {
            // extract sprite renderer
            _spriteRenderer = GetComponent<SpriteRenderer>();

            // create the interaction subject and register its cancellation
            _interactionSubject = new Subject<IInteractable>().AddTo(this);
        }

        /// <inheritdoc />
        public Observable<IInteractable> interactionObservable => _interactionSubject!.AsObservable();

        /// <inheritdoc />
        public void OnPointerClick(PointerEventData eventData)
        {
            _interactionSubject!.OnNext(this);
        }

        /// <inheritdoc />
        public void OnPointerEnter(PointerEventData eventData)
        {
            // temporary
            if (_spriteRenderer == null)
            {
                Debug.LogWarning("Mouse entered an uninitialized PolygonColliderInteractable", this);
                return;
            }

            _spriteRenderer.color = Color.gray;
        }

        /// <inheritdoc />
        public void OnPointerExit(PointerEventData eventData)
        {
            // temporary
            if (_spriteRenderer == null)
            {
                Debug.LogWarning("Mouse entered an uninitialized PolygonColliderInteractable", this);
                return;
            }

            _spriteRenderer.color = Color.white;
        }

        [Button]
        [LabelText("Adapt collider shape to sprite shape")]
        public void CopySpritePhysicsShapeToPolygonCollider2DShape()
        {
            // from https://discussions.unity.com/t/how-to-update-polygoncollider2d-at-runtime/1557909/2
            // Fetch the components.
            var sprite = GetComponent<SpriteRenderer>().sprite;
            var polygonCollider = GetComponent<PolygonCollider2D>();

            // add the "undo" entry for the menu
            Undo.RecordObject(polygonCollider, "Adapt collider shape to sprite shape");

            // A sprite can have multiple physics shape paths (for holes etc...).
            var shapeCount = sprite.GetPhysicsShapeCount();
            polygonCollider.pathCount = shapeCount;

            // Fetch each path and set the polygon collider's corresponding path.
            var numVertices = 0;
            for (var i = 0; i < shapeCount; ++i)
            {
                numVertices += sprite.GetPhysicsShape(i, PhysicsShapePath);
                polygonCollider.SetPath(i, PhysicsShapePath);
            }

            Debug.Log(
                $"Copied {shapeCount} shapes for a total of {numVertices} vertices to produce the polygon collider for the interactable '{name}'.");
        }
    }
}