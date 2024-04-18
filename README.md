# Drowsiness Detection System(webapp)

## Motivation: 

In Canada, drowsy driving is a serious concern, mirroring the situation in the United States. Each year, numerous accidents occur due to driver fatigue, resulting in fatalities and injuries. Efforts are underway to develop systems that can detect drowsiness and alert drivers in real-time, potentially saving lives. Given Canada's vast landscapes and long travel distances, addressing drowsy driving is crucial for road safety nationwide. Through technological advancements and collaborative initiatives, Canada is striving to mitigate the risks associated with drowsy driving and create safer roads for everyone.

## Installing and Configuring dlib:
Pip cannot install dlib directly; instead, we must construct an environment before installing it. Therefore, if you haven't installed Dlib before, use these commands to install it on your system. As we will be working in Anaconda Prompt, make sure you have Anaconda installed. 
### Step 1: Update conda 
```bash
conda update conda
```
### Step 2: Update anaconda 
```bash
conda update anaconda 
```
### Step 3: Create a virtual environment
```bash 
conda create -n env_dlib 
```
### Step 4: Activate the virtual environment 
```bash 
conda activate env_dlib
```
### Step 5: Install dlib 
```bash 
conda install -c conda-forge dlib 
```
If all these steps are completed successfully, then dlib will be installed in the virtual environment <b>env_dlib</b>. Make sure to use this environment to run the entire project. 

### Step to deactivate the virtual environment 
```bash 
conda deactivate 
```

## Working Details: 

The basic thing about drowsiness detection is pretty simple. We first detect a face using dlib's frontal face detector. Once the face is detected , we try to detect the facial landmarks in the face using the dlib's landmark predictor. The landmark predictor returns 68 (x, y) coordinates representing different regions of the face, namely - mouth, left eyebrow, right eyebrow, right eye, left eye, nose and jaw. Ofcourse, we don't need all the landmarks, here we need to extract only the eye and the mouth region. 

Now, after extraxting the landmarks we calculate the <b>Eye Aspect Ratio (EAR)</b> as: 

```python 
def eye_aspect_ratio(eye):
	# Vertical eye landmarks
	A = dist.euclidean(eye[1], eye[5])
	B = dist.euclidean(eye[2], eye[4])
	# Horizontal eye landmarks 
	C = dist.euclidean(eye[0], eye[3])

	# The EAR Equation 
	EAR = (A + B) / (2.0 * C)
	return EAR
```
The eye region is marked by 6 coordinates. These coordinates can be used to find whether the eye is open or closed if the value of EAR is checked with a certain threshold value.<br>
![blink_detection_plot](https://user-images.githubusercontent.com/35571958/87878670-62d41400-ca03-11ea-8b96-fc4344c61a21.jpg)

In the same way we have calculated the aspect ratio for the mouth to detect if a person is yawning. Although, there is no specific metric for calculating this, so we have taken for points, 2 each from the upper and lower lip and calculated the mean distance between them as: 
```python 
def mouth_aspect_ratio(mouth): 
	A = dist.euclidean(mouth[13], mouth[19])
	B = dist.euclidean(mouth[14], mouth[18])
	C = dist.euclidean(mouth[15], mouth[17])

	MAR = (A + B + C) / 3.0
	return MAR
```
<b>Note: Learn more about dlib</b> <a href = "http://dlib.net/">here.</a>

## Results: 
Basic HTML, CSS, and JavaScript were used to develop the GUI, and Flask was used to render the Python code onto the webpage. To make things easier, Tkinter has also been utilized. The buttons are labeled Run and Exit. The GUI appears as follows: 

The operating system's outputs for detecting tiredness are displayed as follows:

Additionally, we retained a separate folder where those frames are kept as an evidence of the moment the person was yawning or sleeping. <br>


## References: 
[1]Drowsiness Detection with OpenCV: https://www.pyimagesearch.com/2017/05/08/drowsiness-detection-opencv/ <br>
[2]Eye blink detection with OpenCV, Python, and dlib: https://www.pyimagesearch.com/2017/04/24/eye-blink-detection-opencv-python-dlib/ <br>
[3]Facial landmarks with dlib, OpenCV and Python: https://www.pyimagesearch.com/2017/04/03/facial-landmarks-dlib-opencv-python/ <br>
