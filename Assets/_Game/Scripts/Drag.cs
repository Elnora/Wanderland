using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Drag : MonoBehaviour
{
    private float mouseX;
    private float mouseY;
    public string tagName;
    private bool move;
    private GameObject hitObject;

    private void Update()
    {
        mouseX = Input.mousePosition.x;
        mouseY = Input.mousePosition.y;
        Vector3 mousePos = Camera.main.ScreenToWorldPoint(new Vector3(mouseX, mouseY, 10));

        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;

        if (Physics.Raycast(ray, out hit, 100))
        {
            if (Input.GetMouseButtonDown(0))
            {
                if (hit.transform.tag == tagName)
                {
                    print("hit object!");
                    hitObject = hit.transform.gameObject;
                    move = true;
                }
            }
        }

        if (move == true)
        {
            hitObject.transform.position = mousePos;
        }

        if (Input.GetMouseButtonUp(0))
        {
            move = false;
        }
    }
}