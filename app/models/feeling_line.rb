class FeelingLine
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_love
    case @user.palm.feeling_love
    when 0 then
      I18n.t('models.feeling_line.love.suddenly', uname: @user.uname)
    when 1 then
      I18n.t('models.feeling_line.love.calm', uname: @user.uname)
    when 2 then
      I18n.t('models.feeling_line.love.nagative', uname: @user.uname)
    when 3 then
      I18n.t('models.feeling_line.love.deep', uname: @user.uname)
    when 4 then
      I18n.t('models.feeling_line.love.kind', uname: @user.uname)
    when 5 then
      I18n.t('models.feeling_line.love.easier', uname: @user.uname, sex_human: @sex_human)
    end
  end

  def result_happy
    if @user.palm.feeling_happy then
      I18n.t('models.feeling_line.happy', uname: @user.uname)
    else
      nil
  	end
  end

  def result_many_love
    if @user.palm.feeling_many_love then
      I18n.t('models.feeling_line.many_love', uname: @user.uname)
    else
      nil
    end
  end

  def result_slow
    if @user.palm.feeling_slow then
      I18n.t('models.feeling_line.slow', uname: @user.uname)
    end
  end
end
