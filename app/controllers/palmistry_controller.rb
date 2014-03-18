class PalmistryController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:result]

  def appraisal
  end

  def result
    case params[:love]
    when '0' then
      @love = "あ"
    when '1' then
      @love = "い"
    when '2' then
      @love = "う"
    when '3' then
      @love = "え"
    when '4' then
      @love = "お"
    end

    params[:love_etc].keys.each do |select_num|
      case select_num
      when '0' then
        @love_etc_0 = "が"
      when '1' then
        @love_etc_1 = "ぎ"
      when '2' then
        @love_etc_2 = "ぐ"
      end
    end

    @life = params[:life]
    case params[:life]
    when '0' then
      @life = "か"
    when '1' then
      @life = "き"
    when '2' then
      @life = "く"
    end

    case params[:life_etc]
    when '0' then
      @life_etc = "さ"
    when '1' then
      @life_etc = "し"
    when '2' then
      @life_etc = "す"
    end

    case params[:brain]
    when '0' then
      @brain = "た"
    when '1' then
      @brain = "ち"
    when '2' then
      @brain = "つ"
    when '3' then
      @brain = "て"
    end
  end

  def profile
  end
end
