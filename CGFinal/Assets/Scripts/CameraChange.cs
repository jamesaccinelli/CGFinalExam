using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraChange : MonoBehaviour
{

    [SerializeField] GameObject camera1;
    [SerializeField] GameObject camera2;
    [SerializeField] GameObject camera3;


    // Start is called before the first frame update
    void Start()
    {
        camera1.gameObject.SetActive(true);
        camera2.gameObject.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        if (camera1.activeInHierarchy)
        {
            if (Input.GetKeyDown(KeyCode.F))
            {
                camera1.gameObject.SetActive(false);
                camera2.gameObject.SetActive(true);
                camera3.gameObject.SetActive(false);
            }
        }
        else if (camera2.activeInHierarchy)
        {
            if (Input.GetKeyDown(KeyCode.F))
            {
                camera1.gameObject.SetActive(true);
                camera2.gameObject.SetActive(false);
            }
        }
        else if (camera3.activeInHierarchy)
        {
            if (Input.GetKeyDown(KeyCode.F))
            {
                camera1.gameObject.SetActive(true);
                camera2.gameObject.SetActive(false);

            }
        }
    }
}
