3.times do |i|
  Post.create(title: "Title #{i+1}")
end
puts "Seeding data completed"