puts "Seeding Plants...(cute pun)..."

#veggies
arugula = Plant.create(name: "Arugula", per_sq_ft: 16, days_to_harvest:"30-40",planting_dates:"Early Spring-Fall", category: "vegetable")

puts "Seeding Notes..."

Note.create(planting: "Space the plants 4\" apart, 1/4in\" deep to get 16 in each sqft. It tolerates most soils well, but it prefers rich soil with good moisture content.", growing:"Arugula is a rather tolerant leafy green that can handle moderate frost and can be grown outdoors most months out of the year. Heat makes the flavor of the leaves stronger. Flea beetles love it, so keep an eye for holes munched through the leaves.",harvesting:"Harvest young leaves from the plant as it grows. Flowers of arugula are edible, but their production can make the leaves rather bitter.", plant: arugula)
