#!/usr/bin/env ruby
# encoding: utf-8
require "gosu"
require "singleton"

require_relative "core/objects/road"
require_relative "core/objects/car"
require_relative "core/objects/taxi"
require_relative "core/objects/driver"
require_relative "core/objects/tree"
require_relative "core/objects/house"
require_relative "core/objects/passenger"
require_relative "core/objects/prize"
require_relative "core/world"
require_relative "core/board"
require_relative "core/window"

GameWindow.instance.show