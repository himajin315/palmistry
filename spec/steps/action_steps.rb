step ':textに:textと入力する' do |field, text|
  fill_in field, with: text
end

step ':textをクリックする' do |text|
  click_on text
end
