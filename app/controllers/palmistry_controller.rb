class PalmistryController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:result]

  def appraisal
  end

  def result
    @uname = params[:uname]
    @sex = params[:sex]
    @sex_human = sex = 0 ? "お父さん":"お母さん"

    marriageable_age = params[:marriageable]
    @marriageable = ""
    if marriageable_age then
      marriageable_age.each_with_index do |select_num,i|
        @marriageable += select_num
        if marriageable_age.length-1 != i then
          @marriageable += ", "
        end
      end
    end
    @marriageable += "歳<br>この時期には結婚したいと思う人がいることでしょう。<br> "

    feeling_line = FeelingLine.new(@uname,@sex_human)
    @feeling_love = feeling_line.result_love(params[:feeling])
    feeling_other = params[:feeling_other]
    if feeling_other.present? then
      @feeling_happy = feeling_line.resulet_happy(feeling_other)
      @feeling_many_love = feeling_line.resulet_many_love(feeling_other)
      @feeling_slow = feeling_line.resulet_slow(feeling_other)
    end

    @life = params[:life]
    case params[:life]
    when '0' then
      @life = @uname + " さんは生命力が強い人です。<br>
      徹夜してもピンピンしているような人でしょう。<br>
      体力の続く限り頑張ることができる人です<br>"
    when '1' then
      @life = @uname + " さんは生命力は弱くはありません。<br>
      体力には問題はありませんが、たまに病気になってしまします。<br>
      年に一度風邪を引いたりします。<br>
      ストレスからくる病気にも注意が必要です。<br>"
    when '2' then
      @life = @uname + "さんは病気にも注意が必要です。<br>
      無理をすると体調を崩すことになります。<br>
      体調管理を優先的に行い、あまり無理のないようにして下さい。<br>
      疲れている時はちゃんと休むようにして下さい<br>"
    end

    case params[:life_other]
    when '0' then
      @life_other = @uname + " さんは実家から遠くに離れる人でしょう。<br>
      簡単には帰れない場所なので、海外など飛行機でしか行けないような場所に住むことになります。<br>
      海外の人と結婚する可能性があるでしょう。<br>"
    when '1' then
      @life_other = @uname + " さんはいろいろなところに行く人です。<br>
      単身赴任や出張などが多く、いろいろな場所に飛び回るようなことになります。<br>
      また、別荘を持ってたり住む場所が複数あることもあるでしょう。<br>"
    when '2' then
      @life_other = @uname + " さんは地元に残る人です。<br>
      地元が大好きで、実家から出ない可能性が高いです。<br>
      親と一緒に暮らすことになるため、家を継ぐ可能性があります。<br>"
    end

    case params[:brain]
    when '0' then
      @brain = @uname + " さんは論理的に考える左脳タイプの人です。<br>
      物事を順序立てて考えるのが得意で、計画を立てて実行すると良い結果が出ます。<br>
      また、物事を客観的に見ることができるため、なにが正しいか正しくないかを判断することができます。<br>
      現実主義者なので周りからは夢のない人だと思われがちです。<br>
      相手を説得する力に長けているので、営業などサービス業なども向いています。<br>"
    when '1' then
      @brain = @uname + " さんは感覚的に捉える右脳タイプの人です。<br>
      五感を使った仕事が向いています。<br>
      音楽や料理、マッサージ師、デザイナーなど人によって五感のどの部分が優れているかは異なりますが、五感を使った仕事が良いでしょう。<br>
      感覚的に捉えるのが得意なため、人の気持ちがよく分かる人でもあります。<br>
      なにか相手に伝えたい時は絵や音楽など視覚や聴覚などを使って伝えることが良いでしょう。<br>"
    when '2' then
      @brain = @uname + " さんはなんでも平均的にできる人です。<br>
      なんでもできるタイプなので、なにをやっても成功させることができます。<br>
      役所などの公務員みたいにいろいろな部署に配属され、いろいろなことが出来る必要がる仕事が向いています。<br>
      ただ、こういうタイプの人は全てが平均的にできるため、誰にも負けない特技のようなものを見つけるのに時間がかかります。<br>
      自分のやりたいこと、楽しいことを見つけ、自分にしかできないようなことを見つけることで出世していくことでしょう。<br>"
    when '3' then
      @brain = @uname + " さんは直感タイプの人です。<br>
      感じたままに行動すると成功しやすいです<br>
      スポーツ選手など瞬時に判断するよな仕事が向いています。<br>
      瞬時に答えを出すことができるため、本番に強いタイプです。<br>
      瞬発力が必要な仕事が向いていることでしょう。<br>"
    when '4' then
      @brain = @uname + " さんは変わり者です。<br>
      普通の人と考え方が違っていることが多いでしょう。<br>
      周りとは違った発想を持っているので、特殊な存在です。<br>
      これはとても良い特徴です。<br>
      周りとは違った視点から見ることができるので、新しい発想やアイデアが生まれます。<br>
      独創的な発想から生み出されるものが誰も真似できないものでしょう。<br>
      ただ、こういうタイプの人は公務員など事務業などは向いていません。<br>
      自分の向いている仕事を見つけることができれば、そこで才能を花開かせることができるでしょう。<br>"
    end

    case params[:brain_life]
    when '0' then
      @brain_life = @uname + " さんは常識がある人です。<br>
      周りの状況にあわせて行動することができます。<br>
      臨機応変に対応できる柔軟性の高い人です。<br>
      所謂、空気が読める人です。<br>"
    when '1' then
      @brain_life = @uname + " さんは慎重派の人です。<br>
      よく考えてから行動する石橋を叩いて渡るタイプの人です<br>
      失敗することはほとんどありませんが、慎重になりすぎてチャンスを逃すこともあります。<br>
      だからと言って、突発的な行動をすると後で必ず後悔する結果になります。<br>
      チャンスを逃さないようにするためには、突発的な行動も必要です。<br>
      後悔することも覚悟で行動することも時には大事になってくることでしょう。<br>"
    when '2' then
      @brain_life = @uname + " さんは行動派の人です。<br>
      思い立ったらすぐ行動することが良いでしょう。<br>
      ただ、失敗することも多いです。<br>
      しかし、行動せずに後で「あの時やってたら良かった」と思う方がよっぽど辛いです。<br>
      後悔しないためにもその行動力は大事にです。<br>"
    when '3' then
      @brain_life = @uname + " さんは疑心暗鬼になりやすい人です。<br>
      あまり人を信用することがないタイプの人です。<br>
      時間をかけてゆっくりと相手を信用するため、信用できる人が周りにあまりいないことが多いです。<br>"
    end

    brain_other = params[:brain_other]
    if brain_other then
      brain_other.keys.each do |select_num|
        case select_num
        when '0' then
          @brain_other_genius = "さらに、" + @uname + " さんは能力が高い人です。<br>
          人よりも物事の習得が早くすることができます。<br>
          ただ、能力が高いが故に怠け者でもあります。<br>
          周りよりも仕事を早く終わらせて、バレないように怠けいることでしょう。<br>
          こういう人は自分の好きなことを仕事にすると良いです。<br>
          夢中になれることを行うことで、怠けず能力を十分に発揮することでしょう。<br>"
        when '1' then
          @brain_other_hardworker = @uname + " さんは努力家の人です。<br>
          努力を努力と思っていないため、すごく頑張ることができる人です。<br>
          大きな目標があると、誰もできないようなこともできることができる人です。<br>
          辛いことも辛いと感じず、愚直に頑張ることができる人です。<br>"
        when '2' then
          @brain_other_manyskil = "また、" + @uname + " さんは多才なの人です。<br>
	  やろうと思えばなんでもできる素晴らしい才能の持ち主です。<br>
	  やりたいことはなんでもできるので、自信を持って自分のやりたいことをやるべきでしょう。<br>"
        when '3' then
          @brain_other_speedbrain = "さらに、" + @uname + " さんは頭の回転が早いの人です。<br>
	  他の人には持っていない特殊なことができる力があります。<br>
	  霊感があったり、周りには真似できない特技を持つことができるでしょう。<br>"
        when '4' then
          @brain_other_indecision = @uname + " さんは優柔不断な面があります。<br>
	  なかなか物事を決めることができないでしょう。<br>
	  一度決めたことも、次の日には変わっていたりします。<br>
	  誰かに決めてもらったほうが楽な時もありますが、大きな決断の時は迷ってもいいので、ちゃんと自分の意思で決断して下さい。<br>"
	  if params[:brain] = 3 then
            @brain_other_indecision = "しかし、" + @uname + " 優柔不断な面があります。<br>
	    なかなか決めることができないため、悩むことも多いでしょう。<br>" +
	    @uname + " さんはいい直感力を持っています。たまには自分の直感を信じてみてはどうでしょうか。<br>"
          end
        end
      end
    end

    brain_other = params[:brain_other]
    if brain_other then
      brain_other.keys.each do |select_num|
        case select_num
        when '0' then
          @brain_other_genius = @uname + " さんは能力が高い人です。<br>
          人よりも物事の習得が早くすることができます。<br>
          ただ、能力が高いが故に怠け者でもあります。<br>
          周りよりも仕事を早く終わらせて、バレないように怠けいることでしょう。<br>
          こういう人は自分の好きなことを仕事にすると良いです。<br>
          夢中になれることを行うことで、怠けず能力を十分に発揮することでしょう。<br>"
        when '1' then
          @brain_other_hardworker = @uname + " さんは努力家の人です。<br>
          努力を努力と思っていないため、すごく頑張ることができる人です。<br>
          大きな目標があると、誰もできないようなこともできることができる人です。<br>
          辛いことも辛いと感じず、愚直に頑張ることができる人です。<br>"
        end
      end
    end

    jupiter = params[:jupiter]
    if jupiter then
      jupiter.keys.each do |select_num|
        case select_num
        when '0' then
          @jupiter_social = "さらに" + @uname + " さんは社会的に成功したいと思っている人です。<br>
          仕事に対して真面目で、一生懸命に頑張ることができます。<br>"
        when '1' then
          @jupiter_reader = "さらに" + @uname + " さんはリーダータイプでもあります。<br>
          誰かに指示されて動くよりも、自分から周りを引っ張っていく方が良いでしょう。<br>"
        end
      end
    end

    case params[:sun]
    when '0' then
      @sun = @uname + " さんは地道な努力で出世するタイプです。<br>
      「継続は力なり」がピッタリな人です。<br>
      続けることで周りから認められる存在となります。<br>
      うまくいなかいからと言ってすぐに諦めるのではなく、根気よく続けていくことが大事になってきます。<br>
      そうすることで、地位や名声を得られることでしょう。<br>"
    when '1' then
      @sun = @uname + " さんは才能を活かして出世するタイプです。<br>
      自分の才能を活かせる場にいるかどうかで、出世ができるかどうかが決まってきます。<br>
      職業や場所がとても重要な要素でしょう。<br>
      自分のやりたいこととできることは違います。<br>
      やりたいことも大事ですが、才能にあった場所を見つけることも大事です。<br>
      " + @uname + " さんを必要としている場所に行くことでお金には困らない生活をすることでしょう。<br>"
    when '2' then
      @sun_not = "ただ、" + @uname + " さんは現在才能を活かしきれていません。<br>
      今やりたいことはありますか。<br>
      " + @uname + " さんの才能に合ったことがうまくできていません。<br>
      今やっていること辞めろってわけではありません。<br>
      今やっていることに" + @uname + " さんの才能を活かすことが必要になってきます。<br>"
    end

    sun_other = params[:sun_other]
    if sun_other then
      sun_other.keys.each do |select_num|
        case select_num
        when '0' then
          @sun_other_charm = @uname + " さんは魅力的な人でもあります。<br>
          異性から好かれやすいようです。<br>
          所謂、モテる人でしょう。<br>"
        end
      end
    end

    case params[:mercury]
    when '0' then
      @mercury = @uname + " さんは現在お金に困っています。<br>
      現在の収入に満足していません。<br>"
    when '1' then
      @mercury = @uname + " さんはお金は入ってきますが、すぐに出て行く状態です。<br>
      貯金がしにくい状態のようです。<br>"
    when '2' then
      @mercury = @uname + " さんはお金には困らない生活をしています。<br>
      特にお金に困るようなこともなく、お金に縛られない生活ができています。<br>"
    end

    venus = params[:venus]
    if venus then
      venus.keys.each do |select_num|
        case select_num
        when '0' then
          @venus_virtuous = "さらに、" + @uname + " さんは周りからの信頼も厚いです。<br>
          自分のことよりも周りへの貢献を優先させるような人です。<br>
          とても素晴らしい人でしょう。<br>"
        when '1' then
          @venus_kindheart =  @uname + " さんは結婚後は子供を大切にします。<br>
          家族のことを優先的に考え、家族を大切にする良い" + @sex_human +"になるタイプでしょう。<br>"
        end
      end
    end

    moon = params[:moon]
    if moon then
      moon.keys.each do |select_num|
        case select_num
        when '0' then
          @moon_like = "さらに、" + @uname + " さんは好かれやすい人でもあります。<br>
          接客業や営業など人と接することが多い仕事に就くのもよいでしょう。<br>"
        when '1' then
          @moon_fatigue =  @uname + " さんは現在疲れがたまっているます。<br>
          休める時にはちゃんと休むようにして下さい。<br>"
        end
      end
    end

    illness = params[:illness]
    if illness then
      illness.keys.each do |select_num|
        case select_num
        when '0' then
          @illness_breath = @uname + " さんは呼吸器系が弱っています。<br>
          部屋の空気を綺麗にし、住み良い環境を作るようにして下さい。<br>"
        when '1' then
          @illness_blood =  @uname + " さんは循環器系に負担をかけています。<br>
          脂っこい食事や塩分の摂り過ぎには注意してください。<br>"
        when '2' then
          @illness_head =  @uname + " さんは注意力が足りないため、事故に合いやすいです。<br>
          疲れがたまってる時の運転など、無理のないよう気をつけて下さい。<br>"
        when '3' then
          @illness_eyes =  @uname + " さんは目の疲れが溜まっています。<br>
          視力低下や目の病気になりやすいです。<br>
          目を酷使させすぎないよう休ませるようにして下さい。<br>"
        when '4' then
          @illness_stomach =  @uname + " さんは胃や小腸などの消化器官系に負担をかけています。<br>
          おかなを壊しやすい状態なので、食生活の改善が必要です。<br>"
        when '5' then
          @illness_liver =  @uname + " さんは腎臓・肝臓に負担をかけています。<br>
          お酒の飲み過ぎには注意してください。たまには休肝日を設けるとよいでしょう。<br>"
        end
      end
    end

    hand_shape = params[:hand_shape]
    if hand_shape then
      hand_shape.keys.each do |select_num|
        case select_num
        when '0' then
          if params[:mercury] == '0' then
            @hand_shape_waste = "ただ、" + @uname + " さんは浪費家です。<br>
            入った分だけ使ってしまうので、いくらお金があっても満足はしません。<br>"
          end
        when '1' then
          @hand_shape_report = "さらに、" + @uname + " さんは文章で伝える能力が高いです。<br>
          自分の考えを伝える時は文章にまとめて伝える方が良いでしょう。<br>"
        end
      end
    end

    @life_flow = params[:life_flow]
    p @life_flow
    case params[:life_flow]
    when '0' then
      @life_flow = @uname + " さんは家族からの支援がある人です。<br>
      困っている時や悩んでいる時は家族に相談することで解決することができるでしょう。<br>
      なので、家族を大切にしましょう。<br>"
    when '1' then
      @life_flow = @uname + " さんは周りからの支援があるラッキーな人生です。<br>
      困っている時や悩んでいる時は周りに相談することで解決することができるでしょう。<br>"
    when '2' then
      @life_flow = @uname + "さんは自分の道は自分で切り拓く人生を歩みます。<br>
      困っている時や悩んでいる時は可能な限り自分で決断するようにして下さい。<br>
      辛い時は周りに相談するとがあるかと思います。<br>
      相手の意見をそのまま取り入れるのではなく、自分の中で一度整理をし、決断をして下さい。<br>
      周りに流されないよう気をつけて下さい<br>"
    end
  end

  def profile
  end
end
