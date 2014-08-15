#!/usr/bin/env ruby

# Crude Metronome. Takes arguments in bpm
# converts to s/b and sleeps

bpm = ARGV[0].to_i

seconds_per_beat = 60.0/bpm

puts "play every #{seconds_per_beat}"

def beat(n)
    while File.read("/home/vicky/trigger.txt").chomp=="true"
	puts "beep"
	`paplay /usr/share/sounds/freedesktop/stereo/dialog-information.oga`
	`sleep #{n}`
    end
end

beat(seconds_per_beat)
