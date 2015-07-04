class MercuryLine
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_money
    case @user.palm.mercury_money
    when 0 then
      I18n.t('models.mercury.money.nothing', uname: @user.uname)
    when 1 then
      I18n.t('models.mercury.money.not_enough', uname: @user.uname)
    when 2 then
      I18n.t('models.mercury.money.enough', uname: @user.uname)
    end
  end
end
