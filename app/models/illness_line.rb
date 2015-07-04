class IllnessLine
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_breath
    if @user.palm.illness_breath then
      I18n.t('models.illness.breath', uname: @user.uname)
    else
      nil
    end
  end

  def result_blood
    if @user.palm.illness_blood then
      I18n.t('models.illness.blood', uname: @user.uname)
    else
      nil
    end
  end

  def result_head
    if @user.palm.illness_head then
      I18n.t('models.illness.head', uname: @user.uname)
    end
  end

  def result_eyes
    if @user.palm.illness_eyes then
      I18n.t('models.illness.eyes', uname: @user.uname)
    end
  end

  def result_stomach
    if @user.palm.illness_stomach then
      I18n.t('models.illness.stomach', uname: @user.uname)
    else
      nil
    end
  end

  def result_liver
    if @user.palm.illness_liver then
      I18n.t('models.illness.liver', uname: @user.uname)
    else
      nil
    end
  end
end
