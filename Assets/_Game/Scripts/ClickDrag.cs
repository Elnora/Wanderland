using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ClickDrag : MonoBehaviour
{
    void Update()
    {
        var mouseX = (Input.mousePosition.x); //make a new float called mouseX and tell it what it is
        var mouseY = (Input.mousePosition.y);
        var mousePosition = Camera.main.ScreenToWorldPoint(new Vector3 (mouseX, mouseY, 10)); //take the two floats and put it ino a vector3 called mousePosition

        {
        
            if (Input.GetMouseButton(0))
            {
                transform.position = mousePosition;
            }
        }
    }
}