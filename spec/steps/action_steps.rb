step ':textに:textと入力する' do |field, text|
  fill_in field, with: text
end

step ':textをクリックする' do |text|
  click_on text
end

step ':textを選択する' do |text|
  label = all('label').detect{|l| l.text == text}
  label.click
end
