class MercuryLine
  def initialize(uname,sex_human)
    @uname = uname
    @sex_human = sex_human
  end

  def result_money(select_num)
    case select_num
    when '0' then
      result = @uname + " さんは現在お金に困っています。<br>
      現在の収入に満足していません。<br>"
    when '1' then
      result = @uname + " さんはお金は入ってきますが、すぐに出て行く状態です。<br>
      貯金がしにくい状態のようです。<br>"
    when '2' then
      result = @uname + " さんはお金には困らない生活をしています。<br>
      特にお金に困るようなこともなく、お金に縛られない生活ができています。<br>"
    end
  end
end
