class LifeFlowLine
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_flow
    case @user.palm.life_flow
    when 0 then
      result_flow = @user.uname + " さんは家族からの支援がある人です。<br>
      困っている時や悩んでいる時は家族に相談することで解決することができるでしょう。<br>
      なので、家族を大切にしましょう。<br>"
    when 1 then
      result_flow = @user.uname + " さんは周りからの支援があるラッキーな人生です。<br>
      困っている時や悩んでいる時は周りに相談することで解決することができるでしょう。<br>"
    when 2 then
      result_flow = @user.uname + "さんは自分の道は自分で切り拓く人生を歩みます。<br>
      困っている時や悩んでいる時は可能な限り自分で決断するようにして下さい。<br>
      辛い時は周りに相談するとがあるかと思います。<br>
      相手の意見をそのまま取り入れるのではなく、自分の中で一度整理をし、決断をして下さい。<br>
      周りに流されないよう気をつけて下さい<br>"
    end
  end
end
