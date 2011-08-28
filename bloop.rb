require 'rubygems'
require 'bloops'
require 'yaml'


while true

    # the bloops o' phone
      b = Bloops.new
      b.tempo = 160

    # melodious
      s1 = b.sound Bloops::SQUARE
      s1.punch = 0.5
      s1.sustain = 0.5
      s1.decay = 0.5
      s1.arp = 0.5
      s1.aspeed = 0.5
      s1.repeat = 0.5
      s1.phase = 0.5
      s1.psweep = 0.5

    # beats
      s2 = b.sound Bloops::NOISE
      s2.punch = 0.5
      s2.sustain = 0.5
      s2.decay = 0.5
      s2.slide = -0.5
      s2.phase = 0.5
      s2.psweep = 0.5
      
    # beats 2
      s3 = b.sound Bloops::SINE
      s3.punch = 0.5
      s3.sustain = 0.5
      s3.decay = 0.5
      s3.slide = 0.5
      s3.phase = 0.5
      s3.psweep = 0.5

    # the tracks
      #b.tune s1, "f#5 c6 e4 b6 g5 d6 4  f#5 e5 c5 b6 c6 d6 4 "
      b.tune s2, "8  c6 e9 g4 4  b5 4  4  e4 4   c6 4  b5 4  4  e4"
      #b.tune s3, "8  c#9 4  b8 4  4  e7 4   c9 4  b8 4  4  e7"

    # and away we go
      b.play
      sleep 1 while !b.stopped?
      
end