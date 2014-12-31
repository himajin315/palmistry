class JupiterLine
  def initialize(uname,sex_human)
    @uname = uname
    @sex_human = sex_human
  end

  def result_social(number_list)
    result = nil
    if number_list.has_key?('0') then
      result = "さらに" + @uname + " さんは社会的に成功したいと思っている人です。<br>
      仕事に対して真面目で、一生懸命に頑張ることができます。<br>"
    end
  end

  def result_reader(number_list)
    result = nil
    if number_list.has_key?('1') then
      result = "さらに" + @uname + " さんはリーダータイプでもあります。<br>
      誰かに指示されて動くよりも、自分から周りを引っ張っていく方が良いでしょう。<br>"
    end
  end
end
