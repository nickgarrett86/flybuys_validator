#!/usr/bin/env ruby

require './lib/main'
require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir('./lib')
loader.setup

Main.new.call
