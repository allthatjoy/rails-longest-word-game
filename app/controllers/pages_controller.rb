require 'json'
require 'open-uri'

class PagesController < ApplicationController

  helper_method :score, :new, :dictionary

  def new
    @letters = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z).shuffle
    @ten_letters = @letters.first(10)
  end

  def score
    @player_word = params[:word]
    @send_word = params[:sendword]
    @player_array = @player_word.split(//)
    @word_array = @send_word.split(',')

    if @word_array.any? { |i| @player_array.include? i }
      @result = "You entered #{@player_word}."
    else
      @result = "Sorry but #{@player_word}    cannot be built out of #{@send_word}"
    end
  end

  def dictionary
    url = "https://wagon-dictionary.herokuapp.com/#{@player_word}"
    word_check = open(url).read
    word = JSON.parse(word_check)
    @english_test = word['found']

    if @player_word == @english_test
      return @english_test
      else @english_test
    end

  end
end

# if @player_word == @english_test return true
