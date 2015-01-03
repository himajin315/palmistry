class LifeLine
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_power
    case @user.palm.life_power
    when 0 then
      result = @user.uname + " さんは生命力が強い人です。<br>
      徹夜してもピンピンしているような人でしょう。<br>
      体力の続く限り頑張ることができる人です<br>"
    when 1 then
      result = @user.uname + " さんは生命力は弱くはありません。<br>
      体力には問題はありませんが、たまに病気になってしまします。<br>
      年に一度風邪を引いたりします。<br>
      ストレスからくる病気にも注意が必要です。<br>"
    when 2 then
      result = @user.uname + "さんは病気にも注意が必要です。<br>
      無理をすると体調を崩すことになります。<br>
      体調管理を優先的に行い、あまり無理のないようにして下さい。<br>
      疲れている時はちゃんと休むようにして下さい<br>"
    end
  end

  def result_live
    case @user.palm.life_live
    when 0 then
      result = @user.uname + " さんは実家から遠くに離れる人でしょう。<br>
      簡単には帰れない場所なので、海外など飛行機でしか行けないような場所に住むことになります。<br>
      海外の人と結婚する可能性があるでしょう。<br>"
    when 1 then
      result = @user.uname + " さんはいろいろなところに行く人です。<br>
      単身赴任や出張などが多く、いろいろな場所に飛び回るようなことになります。<br>
      また、別荘を持ってたり住む場所が複数あることもあるでしょう。<br>"
    when 2 then
      result = @user.uname + " さんは地元に残る人です。<br>
      地元が大好きで、実家から出ない可能性が高いです。<br>
      親と一緒に暮らすことになるため、家を継ぐ可能性があります。<br>"
    end
  end
end
