using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(SpriteRenderer))]
public class DragObject : MonoBehaviour
{
	bool dragging;
	Camera cam;
	Collider2D[] colliders;

	Vector3 offset;

	SpriteRenderer spriteRenderer;

	static int draggedSortingOrder = -1;
	static DragObject draggedObject;

    // Start is called before the first frame update
    void Start()
    {
		cam = Camera.main;

		colliders = GetComponentsInChildren<Collider2D>();
		spriteRenderer = GetComponent<SpriteRenderer>();
    }

	// Update is called once per frame
	void Update()
	{
		var mousePos = Input.mousePosition;
		Vector3 mouseWorldPos = Camera.main.ScreenToWorldPoint(new Vector3(mousePos.x, mousePos.y, 1));

		if (PositionInsideColliders(mouseWorldPos))
		{
			if (Input.GetMouseButtonDown(0) && draggedSortingOrder < spriteRenderer.sortingOrder)
			{
				if (draggedObject != null)
					draggedObject.dragging = false;

				draggedObject = this;
				draggedSortingOrder = spriteRenderer.sortingOrder;
				offset = transform.position - mouseWorldPos;
				dragging = true;
			}
		}

		if (dragging)
		{
			transform.position = mouseWorldPos + offset;

			if (Input.GetMouseButtonUp(0))
			{
				draggedSortingOrder = -1;
				dragging = false;
			}
		}
	}

	bool PositionInsideColliders(Vector3 pos)
	{
		foreach (var col in colliders)
		{
			if (col.OverlapPoint(pos))
				return true;
		}

		return false;
	}
}