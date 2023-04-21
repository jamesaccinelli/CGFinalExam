using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovePlayer : MonoBehaviour
{

    [SerializeField] float moveSpeed;
    [SerializeField] GameObject target;

    // Update is called once per frame
    void Update()
    {
        //transform.Rotate(target.transform.position, moveSpeed);
        transform.Rotate(0f, moveSpeed * Time.deltaTime, 0f, Space.Self);
    }
}
