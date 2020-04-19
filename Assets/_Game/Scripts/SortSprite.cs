using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SortSprite : MonoBehaviour
{

 /*    // This function is just to understand it
    void ExplainedFunctionButDeleteThis()
    {
     
        //Long explained version like your code
        
        var posY = transform.position.y; //Similar to GetProperty
        var posYMultiplied = posY * 10; //Float multiply
        var posYReversed = 100 - posYMultiplied; //Float subtract (but can do it the other way around)

        //Note here you did a flot multiply by -1, but we don't have to since the subtract above works as intended

        var sortingOrder = Mathf.RoundToInt(posYReversed); //Convert float to int. 
        
        //Set the sorting order
        GetComponent<SpriteRenderer>().sortingOrder = sortingOrder; //Same as set propery
    } */

    void Update()
    {
        //Write all of it on one line instead
        GetComponent<SpriteRenderer>().sortingOrder = Mathf.RoundToInt(100 - transform.position.y * 10);
    }

    

}
