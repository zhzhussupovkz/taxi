#!/usr/bin/env ruby
# encoding: utf-8
require "gosu"

require_relative "core/car"
require_relative "core/taxi"
require_relative "core/window"

window = GameWindow.new
window.show