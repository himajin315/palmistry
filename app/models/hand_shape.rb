class HandShape
  def initialize(uname,sex_human)
    @uname = uname
    @sex_human = sex_human
  end

  def result_waste(number_list)
    result = nil
    if number_list.has_key?('0') then
      result = @uname + "ただ、" + @uname + " さんは浪費家です。<br>
      入った分だけ使ってしまうので、いくらお金があっても満足はしません。<br>"
    end
  end

  def result_report(number_list)
    result = nil
    if number_list.has_key?('1') then
      result = "さらに、" + @uname + " さんは文章で伝える能力が高いです。<br>
自分の考えを伝える時は文章にまとめて伝える方が良いでしょう。<br>"
    end
  end
end
