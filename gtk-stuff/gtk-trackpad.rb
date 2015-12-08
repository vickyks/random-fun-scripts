#!/usr/bin/env ruby
#
# GTK window that returns position of click
# Useful to act as a touchpad for remote control
# of gui over ssh.
#
# to run:
# gtk-trackpad.rb x_size y_size
#
# pseudocode/instructions:
#
# take coords of target screen as argument
# generate gtk window of 1/4 size ??
# gtk: # win, x, y, state = widget.window.get_device_position(event.device)

require 'gtk3'

class TrackPad < Gtk::Window

  # Todo: Refactor this into seperate file (trackpad.rb)
  # then require it here.

  # def initialize(coords)
  def initialize
    super

    set_title "Trackpad"

    signal_connect "destroy" do
      Gtk.main_quit
    end

    signal_connect "delete_event" do |widget, event|
      quit
    end

    # x, y = coords
    set_default_size 480, 270
    set_default_size @x, @y

    show
  end

  def size(x=480, y=270)
    @x = x
    @y = y
  end


  def quit
    destroy
    true
  end

end

x_size = ARGV[0]
y_size = ARGV[1]

puts x_size
puts y_size

# trackpad = TrackPad.new([x_size, y_size])
trackpad = TrackPad.new()
trackpad.size(x_size, y_size)
Gtk.main
