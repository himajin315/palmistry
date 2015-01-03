class JupiterLine
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_social
    result = nil
    if @user.palm.jupiter_social then
      result = "さらに" + @user.uname + " さんは社会的に成功したいと思っている人です。<br>
      仕事に対して真面目で、一生懸命に頑張ることができます。<br>"
    end
  end

  def result_reader
    result = nil
    if @user.palm.jupiter_reader then
      result = "さらに" + @user.uname + " さんはリーダータイプでもあります。<br>
      誰かに指示されて動くよりも、自分から周りを引っ張っていく方が良いでしょう。<br>"
    end
  end
end
