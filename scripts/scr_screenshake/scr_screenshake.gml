function screenshake(magnitude, frames){
	// @desc ScreenShake (magnitude, frames)
	// @arg magnitude sets the strength of the shake (distance range)
	// @arg frames sets the length of the shake  in frames (60 = 1 sec)

with (global.camera_instance) 
{
	if (magnitude > shake_remain) 
	{
		shake_magnitude = magnitude; 
		shake_remain = shake_magnitude; 
		shake_length = frames;
	}
}
}