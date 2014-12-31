class MoonLine
  def initialize(uname,sex_human)
    @uname = uname
    @sex_human = sex_human
  end

  def result_like(number_list)
    result = nil
    if number_list.has_key?('0') then
      result = "さらに、" + @uname + " さんは好かれやすい人でもあります。<br>
      接客業や営業など人と接することが多い仕事に就くのもよいでしょう。<br>"
    end
  end

  def result_fatigue(number_list)
    result = nil
    if number_list.has_key?('1') then
      result = @uname + " さんは現在疲れがたまっているます。<br>
      休める時にはちゃんと休むようにして下さい。<br>"
    end
  end
end
