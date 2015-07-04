class HandShape
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_waste
    result = nil
    if @user.palm.hand_shape_waste then
      I18n.t('models.hand_shape.waste', uname: @user.uname)
    end
  end

  def result_report
    result = nil
    if @user.palm.hand_shape_report then
      I18n.t('models.hand_shape.report', uname: @user.uname)
    end
  end
end
