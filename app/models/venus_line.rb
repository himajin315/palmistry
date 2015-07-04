class VenusLine
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_virtuous
    if @user.palm.venus_virtuous then
      I18n.t('models.venus.virtuous', uname: @user.uname)
    else
      nil
    end
  end

  def result_kind_heart
    if @user.palm.venus_kind_heart then
      I18n.t('models.venus.kind_heart', uname: @user.uname, sex_human: @sex_human)
    else
      nil
    end
  end
end
