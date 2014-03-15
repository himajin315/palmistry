class PalmistryController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:result]

  def appraisal
  end

  def result
    @dest = { name: params['dest'] }
    @num = { name: params['num'] }
  end

  def profile
  end
end
