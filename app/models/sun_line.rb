class SunLine
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_skill
    case @user.palm.sun_skill
    when 0 then
      I18n.t('models.sun.skill.steady', uname: @user.uname)
    when 1 then
      I18n.t('models.sun.skill.ability', uname: @user.uname)
    end
  end

  def result_skill_until
    if @user.palm.sun_skill_until then
      I18n.t('models.sun.skill_until', uname: @user.uname)
    else
      nil
    end
  end

  def result_charm
    if @user.palm.sun_charm then
      I18n.t('models.sun.charm', uname: @user.uname)
    else
      nil
    end
  end
end
