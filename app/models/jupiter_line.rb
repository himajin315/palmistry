class JupiterLine
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_social
    result = nil
    if @user.palm.jupiter_social then
      I18n.t('models.jupiter.social', uname: @user.uname)
    end
  end

  def result_reader
    if @user.palm.jupiter_reader then
      I18n.t('models.jupiter.reader', uname: @user.uname)
    else
      nil
    end
  end
end
