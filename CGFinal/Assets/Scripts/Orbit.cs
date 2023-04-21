using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Orbit : MonoBehaviour
{
    [SerializeField] GameObject target;
    [SerializeField] float degreesPerSecond;

    // Update is called once per frame
    void Update()
    {
        transform.Rotate(target.transform.position, degreesPerSecond);
        // transform.Rotate(0f, degreesPerSecond * Time.deltaTime, 0f, Space.Self);
    }
}
