class PalmistryController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:result]

  def appraisal
  end

  def result
    @love = params[:love]
    @love_etc = params[:love_etc]
    @life = params[:life]
    @life_etc = params[:life_etc]
    @brain = params[:brain]
  end

  def profile
  end
end
