class PalmistryController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:result]

  def appraisal
  end

  def result
    render :text => "旅行先 = #{params[:dest]}, 人数 = #{params[:num]}人"
  end

  def profile
  end
end
