using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MaterialChange : MonoBehaviour
{
    [SerializeField] Material[] materials;

    private Renderer rend;

    void Start()
    {
        rend = GetComponent<Renderer>();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            rend.material = materials[0];
        }
        else if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            rend.material = materials[1];
        }

    }
}
