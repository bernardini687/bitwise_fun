# frozen_string_literal: true

require_relative 'bitwise_fun'
require 'sinatra'
require 'sinatra/reloader'

GAME = BitwiseFun.new 2
bytes = GAME.bytes

get '/' do
  erb :index, locals: { bytes: bytes }
end
