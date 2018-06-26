require "factory_bot"
users = FactoryBot.create_list(:client, 5)
users.each { |user| FactoryBot.create_list(:lot, 5, user: user) }
Lot.all.each do |lot|
  users.each do |user|
    if user.id != lot.user.id
      FactoryBot.create(:bid, user: user, lot: lot)
    end
  end
end
Lot.all.each do |lot|
  if lot.id.even?
    bid = FactoryBot.create(:bid, proposed_price: lot.estimated_price + 100, lot: lot)
    FactoryBot.create(:order, bid: bid)
  end
end