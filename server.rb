# frozen_string_literal: true

require_relative 'bitwise_fun'
require 'sinatra'
require 'sinatra/reloader'

GAME = BitwiseFun.new

get '/' do
  play mode: :^
end

get '/and' do
  play mode: :&
end

get '/or' do
  play mode: :|
end

private

def play(mode:)
  unless params.empty?
    guess = params.values.join
    conduct_game(guess, mode)
  end

  erb :index, locals: { bytes: GAME.bytes, score: GAME.score }
end

def conduct_game(guess, mode)
  return unless GAME.correct?(guess, mode)

  GAME.score += 1
  GAME.redraw!
end

# post?
# asdf jkl... (keybindings, AJAX)
# ?           (how to page)
# <<, >>, ecc...
# screenshots, README, publish
