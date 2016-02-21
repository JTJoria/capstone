# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{name: 'Chicago' }, {name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

casual_male = CasualMale.create([{item: 'casual shirts/t-shirts'}, {item: 'casual pants/short'}, {item: 'pajamas'}, {item: 'sweaters/sweatshirts'}, {item: 'underwear'},  {item: 'socks'}, {item: 'casual shoes/sandals'}, {item: 'belt'}, {item: 'swimwear'}, {item: 'work out clothes/shoes'},])

casual_female = CasualFemale.create([{item: 'casual shirts/t-shirts'}, {item: 'casual pants/short'}, {item: 'pajamas'}, {item: 'sweaters/sweatshirts'}, {item: 'underwear'}, {item: 'bras'}, {item: 'socks'},  {item: 'casual shoes/sandals'}, {item: 'belt'}, {item: 'swimwear'},  {item: 'work out clothes/shoes'},{item: 'makeup'}])

formal_male = FormalMale.create([ {item: 'suit'}, {item: 'sport coat'}, {item: 'tie'}, {item: 'dress shirt'}, {item: 'dress pants'}, {item: 'dress shoes'},])

formal_female = FormalFemale.create([ {item: 'dress shoes'}, {item: 'skirts/dresses'}, {item: 'nylons'}, {item: 'makeup'}]) 

cold_weather = ColdWeather.create([ {item: 'Hats'}, {item: 'scarves'},  {item: 'gloves'}, {item: 'sweater/sweatshirts'}, {item: 'jacket/coat'}])

warm_weather = WarmWeather.create([{item: 'swimwear'}, {item: 'sandals'}, {item: 'sunscreen'}])

toiletries = Toiletries.create([{item: 'toothbrush'}, {item: 'toothpaste'}, {item: 'shampoo'}, {item: 'conditioner'}, {item: 'soap/body wash'}, {item: 'deodorant'}, {item: 'contacts/contact case/contact solution'}, {item: 'glasses'}, {item: 'q-tips'}, {item: 'cotton balls'}, {item: 'tissues'}, {item: 'tweezers'}, {item: 'nail clippers'}, {item: 'lotion'}, {item: 'lip balm'}, {item: 'razor'}, {item: 'shaving gel/cream'}])

optional_male = OptionalMale.create([{item: 'cologne'}, {item: 'aftershave'}])

optional_female = OptionalFemale.create([{item: 'curling iron/straightener'}, {item: 'blow dyer'}, {item: 'perfume'}, {item: 'jewelry'}])

medical = Medical.create([{item: 'prescriptions'}, {item: 'allergy medication'}, {item: 'First Aid Kit'}, {item: 'Vitamins'}, {item: 'Pain Medication'}])

misc = Misc.create([{item: 'umbrealla'}, {item: 'books/music/movies'}, {item: 'snacks'}, {item: 'cellphone and accessories'}, {item: 'laptop/tablet and accessories'}, {item: "Driver's license/Valid ID"}, {item: 'wallet/purse'}, {item: 'debit/credit card'}, {item: 'cash'}, {item: 'sunglasses'}, {item: 'headphones'}])