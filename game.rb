#!/usr/bin/env ruby
# encoding: utf-8
require "gosu"

require_relative "core/objects/car"
require_relative "core/objects/taxi"
require_relative "core/objects/tree"
require_relative "core/objects/house"
require_relative "core/world"
require_relative "core/board"
require_relative "core/window"

window = GameWindow.new
window.show