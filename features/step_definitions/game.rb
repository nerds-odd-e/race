Then(/^(\d+) \+ (\d+) should be (\d+)$/) do |arg1, arg2, arg3|
  expect(arg1.to_i + arg2.to_i).to eq arg3.to_i
end
