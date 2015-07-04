class LifeFlowLine
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_flow
    case @user.palm.life_flow
    when 0 then
      I18n.t('models.life_flow.family', uname: @user.uname)
    when 1 then
      I18n.t('models.life_flow.other', uname: @user.uname)
    when 2 then
      I18n.t('models.life_flow.myself', uname: @user.uname)
    end
  end
end
