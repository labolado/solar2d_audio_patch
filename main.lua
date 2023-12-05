require("audio_patch")
 
-- local function bombExplode( event )
--     print("bomb has exploded!")
   
-- end
 
-- local tickSound = audio.loadStream( "explode.mp3" )
-- audio.play( tickSound, { onComplete=bombExplode } )


mySound = audio.loadSound("explode.mp3")
        soundTesting = function()
end
function checkSound ()
	for j = 1, 30 do
		audio.play(mySound , { onComplete=soundTesting })
	end
end	
Runtime:addEventListener( "enterFrame", checkSound )
 