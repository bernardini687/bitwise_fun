# frozen_string_literal: true

require_relative 'bitwise_fun'
require 'sinatra'
require 'sinatra/reloader'

GAME = BitwiseFun.new 2

get '/' do
  guess = params['guess']

  unless guess.nil?
    if check(guess)
      GAME.redraw! 2
    end
  end

  erb :index, locals: { bytes: GAME.bytes, score: GAME.score }
end

private

def check(guess)
  GAME.correct?(guess)
end
