  class BrainLine
    def initialize(user)
      @user = user
      @sex_human = user.sex_human
    end

    def result_think
      case @user.palm.brain_think
      when 0 then
        I18n.t('models.brain_line.think.left', uname: @user.uname)
      when 1 then
        I18n.t('models.brain_line.think.right', uname: @user.uname)
      when 2 then
        I18n.t('models.brain_line.think.average', uname: @user.uname)
      when 3 then
        I18n.t('models.brain_line.think.intuition', uname: @user.uname)
      when 4 then
        I18n.t('models.brain_line.think.strange', uname: @user.uname)
      end
    end

    def result_life
      case @user.palm.brain_life
      when 0 then
        result = @user.uname + " さんは常識がある人です。<br>
        周りの状況にあわせて行動することができます。<br>
        臨機応変に対応できる柔軟性の高い人です。<br>
        所謂、空気が読める人です。<br>"
      when 1 then
        result = @user.uname + " さんは慎重派の人です。<br>
        よく考えてから行動する石橋を叩いて渡るタイプの人です<br>
        失敗することはほとんどありませんが、慎重になりすぎてチャンスを逃すこともあります。<br>
        だからと言って、突発的な行動をすると後で必ず後悔する結果になります。<br>
        チャンスを逃さないようにするためには、突発的な行動も必要です。<br>
        後悔することも覚悟で行動することも時には大事になってくることでしょう。<br>"
      when 2 then
        result = @user.uname + " さんは行動派の人です。<br>
        思い立ったらすぐ行動することが良いでしょう。<br>
        ただ、失敗することも多いです。<br>
        しかし、行動せずに後で「あの時やってたら良かった」と思う方がよっぽど辛いです。<br>
        後悔しないためにもその行動力は大事にです。<br>"
      when 3 then
        result = @user.uname + " さんは疑心暗鬼になりやすい人です。<br>
        あまり人を信用することがないタイプの人です。<br>
        時間をかけてゆっくりと相手を信用するため、信用できる人が周りにあまりいないことが多いです。<br>"
      end
    end

    def result_genius
      result = nil
      if @user.palm.brain_genius then
        result = "さらに、" + @user.uname + " さんは能力が高い人です。<br>
        人よりも物事の習得が早くすることができます。<br>
        ただ、能力が高いが故に怠け者でもあります。<br>
        周りよりも仕事を早く終わらせて、バレないように怠けいることでしょう。<br>
        こういう人は自分の好きなことを仕事にすると良いです。<br>
        夢中になれることを行うことで、怠けず能力を十分に発揮することでしょう。<br>"
      end
    end

    def result_hardworker
      result = nil
      if @user.palm.brain_hardworker then
        result = @user.uname + " さんは努力家の人です。<br>
        努力を努力と思っていないため、すごく頑張ることができる人です。<br>
        大きな目標があると、誰もできないようなこともできることができる人です。<br>
        辛いことも辛いと感じず、愚直に頑張ることができる人です。<br>"
      end
    end

    def result_many_skill
      result = nil
      if @user.palm.brain_many_skill then
        result = "また、" + @user.uname + " さんは多才なの人です。<br>
  やろうと思えばなんでもできる素晴らしい才能の持ち主です。<br>
  やりたいことはなんでもできるので、自信を持って自分のやりたいことをやるべきでしょう。<br>"
      end
    end

    def result_speed_think
      result = nil
      if @user.palm.brain_speed_think then
        result = "さらに、" + @user.uname + " さんは頭の回転が早いの人です。<br>
  他の人には持っていない特殊なことができる力があります。<br>
  霊感があったり、周りには真似できない特技を持つことができるでしょう。<br>"
      end
    end

    def result_indecision
      result = nil
      if @user.palm.brain_indecision then
        result = @user.uname + " さんは優柔不断な面があります。<br>
        なかなか物事を決めることができないでしょう。<br>
        一度決めたことも、次の日には変わっていたりします。<br>
        誰かに決めてもらったほうが楽な時もありますが、大きな決断の時は迷ってもいいので、ちゃんと自分の意思で決断して下さい。<br>"
      end
    end
  end
