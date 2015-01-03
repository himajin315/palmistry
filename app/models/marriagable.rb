class Marriagable
  def initialize(user)
    @user = user
  end

  def result_marry_age
    result = ""
    if @user.marry_age then
      @user.marry_age.each_with_index do |select_num,i|
        result += select_num
        if @user.marry_age.length-1 != i then
          result += ", "
        end
      end
      result += "歳<br>この時期には結婚したいと思う人がいることでしょう。<br> "
    end
  end
end
