local type = type
local a_Play = audio.play
local a_isChannelActive = audio.isChannelActive
local t_performWithDelay = timer.performWithDelay
local t_cancel = timer.cancel
audio.play = function(audioHandle, options)
	local callback
	if type(options) == "table" and options.onComplete then
		callback = options.onComplete
		options.onComplete = nil
	end
	local channel = a_Play(audioHandle, options)
	if channel > 0 and type(callback) == "function" then
		local duration = audio.getDuration(audioHandle)
		local startTime = system.getTimer()
		t_performWithDelay(16, function(e)
			if not a_isChannelActive(channel) then
				t_cancel(e.source)
				callback({name = "audio", channel = channel, handle = audioHandle, completed = e.time - startTime >= duration})
			end
		end, -1)
	end
	return channel
end
return false
