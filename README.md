# CGFinalExam
<br>
Wallpaper, Shell, and Fur textures originate from -> https://3dtextures.me/ <br>
<br>
Wood and Lava Textures are original. <br>
<br>
Flowchart made using Google Drawing. <br>
<br>
Toggles: 1,2 for Lava, F for Bloom. <br>
<br>
Note: The release size is quite large, apologies. It was the only way I could get it to work haha.
Scene Setup:<br>
Since I was an even number, I was tasked to recreate the office-esque scene. In doing so I created a player object and enemy object. I then added three walls and a floor to capture the 2D-style. I also manipulated the position of the camera to achieve this. Along the bottom of the scene I added the fire/lava. I also added 2 desk objects with lamp lights to add more to the background of the scene. The player and enemy objects can be seen rotating during the scene. <br>
<br>
Texturing: <br>
Normal maps contain information about the normal at that UV coordinate, and is then used by the fragment shader. I used normal mapping all throughout the scene. Normal mapping can be seen via the player, enemy, wall, desk, and lava objects. I chose to implement them as such to add more detail and make them more visually appealing, especially since I did not use any 3D models. In the player and lava objects normal mapping was an addition, and I will touch on them later. As for the standard normal mapping shader for the desk, enemy and wall, I built off of the lecture shader. I added a colour property and increased the bump amuount range, to experiment with different appearances for the objects. This way I could have more customization to be able to fine tune many different aspects. The additional colour property was implemented by multiplying it by the rgb value of the main texture. Below are images of the desk, wall and enemy. <br>
<br>
![NormalMap1](https://user-images.githubusercontent.com/94195667/233704830-fffa662e-4e5d-40cd-b099-d057407c6c0f.png)
![NormalMap2](https://user-images.githubusercontent.com/94195667/233704835-b63cc4c7-c496-4a2e-8d70-f925533b784f.png)
<br>
Water-Like: <br>
This water wave effect is created through making a sine-wave effect. Practically, taking the vertices of the plane(water/lava), and moving it along the x-axis, creating the wave effect. The water-like wave was implemented to create the lava effect, as mentioned above. I did so by building off of the lecture shader provided. Additionally, I added a scrolling texture, to add to the flowing-lava effect, and bump mapping for more detail. I added scrolling via creating ScrollX and Y properties to control the direction of the flow. I multiplied these properties by the Unity time function in the surf function. I then multiply the properties by the flow/foam texture itself. As for bumpmapping, I implemented it the same as above, unpacking the normals and adjusting them with the bump amount slider. Both of these additions made the lava effect more realistic, rather than a flat wave. <br>
![image](https://user-images.githubusercontent.com/94195667/233705587-204483e0-cf93-44b5-bbb5-4101449e447d.png) <br>
<br>
Bloom: <br>
Bloom is the process of blurring an image, applying it onto the original image, and then brightening it. The bloom shader was utilized to add vibrance to certain objects in the scene, mainly the lava. I found that experimenting with the bloom properties allowed for a more fiery lava effect, making it feel more realistic. Additionally, bloom helped enhance the brighter areas in the scene, such as the lamps. I felt that this made the scene more interesting, making it less dull. The bloom shader was built off of the lecture shader. Additionally, I added a colour property to experiment with. This created a colour-grade style effect, allowing me to manipulate the colour of the bloom. This was done by multiplying the sample texture in the 3rd pass by the colour property, and setting a variable equal to the proerty in the accompanying c# script. See above the lava without bloom, and below with bloom. <br>
![image](https://user-images.githubusercontent.com/94195667/233706774-b0ae5e73-379a-406c-b199-af933d930f48.png)
<br>
Bonus Shader: <br>
For this bonus shader I utilized Toon Shading along with normal mapping. Toon shading is the process of making a 3D object appear flat, by using a ramp texture to change colours at the extremes rather than a gradual linear transition/gradient. I elected to use this shader on the player object, to make it stand out with the rest of the scene. I also implemented this in hopes of creating a more realistic turtle shell style of effect. For this shader, I built off of the lecture shader, and added normal mapping calculations to it. I think its worth mentioning that the shader does also have rim lighting calculations, but were not utilized as I felt they did not fit in the scene. Below is a flowchart detailing the shader. <br>
![image](https://user-images.githubusercontent.com/94195667/233708657-2f1e70ae-d760-4223-9e23-a95fe1bb973e.png)
<br>



