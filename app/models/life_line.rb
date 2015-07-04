class LifeLine
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_power
    case @user.palm.life_power
    when 0 then
      I18n.t('models.life.power.strong', uname: @user.uname)
    when 1 then
      I18n.t('models.life.power.not_week', uname: @user.uname)
    when 2 then
      I18n.t('models.life.power.week', uname: @user.uname)
    end
  end

  def result_live
    case @user.palm.life_live
    when 0 then
      I18n.t('models.life.live.distance', uname: @user.uname)
    when 1 then
      I18n.t('models.life.live.not_near', uname: @user.uname)
    when 2 then
      I18n.t('models.life.live.near', uname: @user.uname)
    end
  end
end
