# frozen_string_literal: true

require_relative 'bitwise_fun'
require 'sinatra'
require 'sinatra/reloader'

GAME = BitwiseFun.new

get '/' do
  unless params.empty?
    guess = params.values.join
    conduct_game(guess)
  end

  erb :index, locals: { bytes: GAME.bytes, score: GAME.score }
end

private

def conduct_game(guess)
  return unless correct?(guess)

  GAME.score += 1
  GAME.redraw!
end

def correct?(guess)
  GAME.correct?(guess)
end

# refactor css
# post?
# asdf jkl... (keybindings)
# ?           (how to)
# &, |, <<, >>, ecc...
# screenshots, README, publish
