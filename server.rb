# frozen_string_literal: true

require_relative 'bitwise_fun'
require 'sinatra'
require 'sinatra/reloader'

GAME = BitwiseFun.new 2
bytes = GAME.bytes

get '/' do
  guess = params['guess']

  unless guess.nil?
    if check(guess)
      GAME.redraw! 2
      bytes = GAME.bytes
    end
  end

  erb :index, locals: { bytes: bytes }
end

private

def check(guess)
  GAME.correct?(guess)
end
