class MoonLine
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_like
    if @user.palm.moon_like then
      I18n.t('models.moon.like', uname: @user.uname)
    else
      nil
    end
  end

  def result_fatigue
    if @user.palm.moon_fatigue then
      I18n.t('models.moon.fatigue', uname: @user.uname)
    else
      nil
    end
  end
end
