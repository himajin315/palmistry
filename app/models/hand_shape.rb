class HandShape
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_waste
    result = nil
    if @user.palm.hand_shape_waste then
      result = @user.uname + "ただ、" + @user.uname + " さんは浪費家です。<br>
      入った分だけ使ってしまうので、いくらお金があっても満足はしません。<br>"
    end
  end

  def result_report
    result = nil
    if @user.palm.hand_shape_report then
      result = "さらに、" + @user.uname + " さんは文章で伝える能力が高いです。<br>
自分の考えを伝える時は文章にまとめて伝える方が良いでしょう。<br>"
    end
  end
end
