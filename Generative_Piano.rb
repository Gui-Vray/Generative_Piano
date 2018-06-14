# Coded by Guillaume Auvray
#
# This code is a very basic auto-generating piano tones with some effects as.
# a slicer, echo, reverb and a highpass filter.
# The code has to be improved and is still under development, at some point, I will
# add some interactivity through OSC Messages as scaled /accxyz lists.
#
#
# Code v2018.06.14-1551
# Sonic Pi v3.1.0


use_bpm 55

in_thread(name: :piano) do
  with_fx :hpf, cutoff: 45, amp: 3 do
    with_fx :slicer, mix: 0.3, probability: 0.1 do
      with_fx :reverb do
        with_fx :slicer, mix: 0.7, probability: 0.2 do
          loop do
            with_fx :echo, phase: 3, phase_slide: rrand(5, 9) do |e|
              with_fx :reverb, amp: 9, room: 1 do
                t = rrand(0, 1)
                sample :ambi_piano, rate: rrand(0.25, 1.25)
                control e, phase: 0.5
                sleep rrand(8, 10)
              end
            end
          end
        end
      end
    end
  end
end

