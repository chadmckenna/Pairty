require 'rubygems'
require 'bloops'
require 'yaml'

class Pairty
  def run(filename)
    load_song_controller(filename)
    play
  end
  
  def load_song_controller(filename)
    @b = Bloops.new
    
    @song = YAML.load_file(filename)
    parse_song
  end
  
  def parse_song
    @b.tempo = @song['tempo']['bpm']
    track_1 = load_type('track_1')
    track_2 = load_type('track_2')
    track_3 = load_type('track_3')
    load_track(track_1, 'track_1')
    load_track(track_2, 'track_2')
    load_track(track_3, 'track_3')
  end
  
  def load_track(track, track_name)
    track.volume    = @song[track_name]['volume']
    track.punch     = @song[track_name]['punch']
    track.sustain   = @song[track_name]['sustain']
    track.slide     = @song[track_name]['slide']
    track.dslide    = @song[track_name]['dslide']
    track.square    = @song[track_name]['square']
    track.sweep     = @song[track_name]['sweep']
    track.vibe      = @song[track_name]['vibe']
    track.vspeed    = @song[track_name]['vspeed']
    track.lpf       = @song[track_name]['lpf']
    track.resonance = @song[track_name]['resonance']
    track.hpf       = @song[track_name]['hpf']
    track.hsweep    = @song[track_name]['hsweep']
    track.arp       = @song[track_name]['arp']
    track.aspeed    = @song[track_name]['aspeed']
    track.phase     = @song[track_name]['phase']
    track.psweep    = @song[track_name]['psweep']
    track.repeat    = @song[track_name]['repeat']
    
    @b.tune track, @song[track_name]['notes']
  end
  
  def play
    @b.play
    sleep 1 while !@b.stopped?
  end
  
  def load_type(track_name)
    if @song[track_name]['type'].eql? 'square'
      return @b.sound Bloops::SQUARE
    elsif @song[track_name]['type'].eql? 'sawtooth'
      return @b.sound Bloops::SAWTOOTH
    elsif @song[track_name]['type'].eql? 'sine'
      return @b.sound Bloops::SINE
    elsif @song[track_name]['type'].eql? 'noise'
      return @b.sound Bloops::NOISE
    end
  end
end