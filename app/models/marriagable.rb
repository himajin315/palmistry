class Marriagable
  def initialize(user)
    @user = user
  end

  def result_marry_age
    result = ""
    if @user.marry_age then
      @user.marry_age.each_with_index do |select_num,i|
        result += select_num.to_s
        if @user.marry_age.length-1 != i then
          result += ", "
        end
      end
      result +=  I18n.t('models.marriagable')
    end
  end
end
