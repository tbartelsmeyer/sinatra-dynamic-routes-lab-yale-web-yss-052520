require_relative 'config/environment'
require 'pry'
class App < Sinatra::Base
  get '/reversename/:name' do
    params[:name].reverse
  end

  get '/square/:number' do
    (num = params[:number].to_i ** 2).to_s
  end

  get '/say/:number/:phrase' do
    output = ''
    params[:number].to_i.times do
      output += params[:phrase]
    end
    output
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{params.values.flatten.join(' ')}."
  end

  get '/:operation/:number1/:number2' do
    op = params[:operation]
    num1 = params[:number1].to_i
    num2 = params[:number2].to_i
    case op
      when 'add'
        out = num1 + num2
      when 'subtract'
        out = num1 - num2
      when 'multiply'
        out = num1 * num2
      when 'divide'
        out = num1 / num2
    end
    out.to_s
  end

end
