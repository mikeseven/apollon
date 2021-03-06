# encoding: UTF-8

require 'pathname'

# require_relative 'cli/cli'

base = Pathname(__FILE__).dirname.expand_path

res = []

Dir.glob(base + '*.rb').each do |file|
  loaded_file = require file
  res << {
    file: file,
    loaded: loaded_file
  }
end

res
