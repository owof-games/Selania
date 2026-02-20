using System.Collections.Generic;
using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.EventSystems;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components
{
    /// <summary>
    ///     A component that makes a sprite interactable like a button.
    /// </summary>
    [RequireComponent(typeof(SpriteRenderer))]
    public class SpriteInteractable : MonoBehaviour, IInteractable, IPointerClickHandler, IPointerEnterHandler,
        IPointerExitHandler, IAutomaticEditorInject
    {
        /// <summary>
        ///     Shared list used to update the polygon collider.
        /// </summary>
        private static readonly List<Vector2> PhysicsShapePath = new();

        /// <summary>
        /// The subject used to implement <see cref="interactionObservable"/>.
        /// </summary>
        private Subject<IInteractable>? _interactionSubject;

        private SpriteRenderer? _spriteRenderer;

        /// <summary>
        ///     The logger used for this object.
        /// </summary>
        [Inject] internal ILogger<SpriteInteractable> Logger = null!;

        private void Start()
        {
            // extract sprite renderer
            _spriteRenderer = GetComponent<SpriteRenderer>();

            _interactionSubject = new Subject<IInteractable>().AddTo(this);

            CopySpritePhysicsShapeToPolygonCollider2DShape();
        }

        public Observable<IInteractable> interactionObservable => _interactionSubject!.AsObservable();

        public void OnPointerClick(PointerEventData eventData)
        {
            _interactionSubject!.OnNext(this);
        }

        public void OnPointerEnter(PointerEventData eventData)
        {
            if (_spriteRenderer == null)
            {
                Debug.LogWarning("Mouse entered an uninitialized SpriteInteractable", this);
                return;
            }

            _spriteRenderer.color = Color.gray;
        }

        public void OnPointerExit(PointerEventData eventData)
        {
            if (_spriteRenderer == null)
            {
                Debug.LogWarning("Mouse entered an uninitialized SpriteInteractable", this);
                return;
            }

            _spriteRenderer.color = Color.white;
        }

        private void CopySpritePhysicsShapeToPolygonCollider2DShape()
        {
            // from https://discussions.unity.com/t/how-to-update-polygoncollider2d-at-runtime/1557909/2
            // Fetch the components.
            var sprite = _spriteRenderer!.sprite;
            var polygonCollider = GetComponent<PolygonCollider2D>();

            // A sprite can have multiple physics shape paths (for holes etc...).
            var shapeCount = sprite.GetPhysicsShapeCount();
            polygonCollider.pathCount = shapeCount;

            // Fetch each path and set the polygon collider.
            var numVertices = 0;
            for (var i = 0; i < shapeCount; ++i)
            {
                numVertices += sprite.GetPhysicsShape(i, PhysicsShapePath);
                polygonCollider.SetPath(i, PhysicsShapePath);
            }

            Logger.ZLogTrace(
                $"Copied {shapeCount} shapes for a total of {numVertices} vertices to produce the polygon collider for the interactable '{name}'.");
        }
    }
}