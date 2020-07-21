require 'pry'
require_relative './client'
require_relative './client_location'
require_relative './client_trainer'
require_relative './location'
require_relative './trainer'


la = Location.new("Las Angeles")
nyc = Location.new("New York City")
miami = Location.new("Miami")
lv = Location.new("Las Vegas")
paris = Location.new("Paris")
uk = Location.new("London")

def create_clients
    random = Random.new
    clients = random.rand(50...500)
    index = 0
    while index < clients
        Client.new("Client#{index + 1}")
        index += 1
    end
    Client.all
end

def create_trainers
    random = Random.new
    trainers = random.rand(10...50)
    index = 0
    while index < trainers
        Trainer.new("Trainer#{index + 1}")
        index += 1
    end
    Trainer.all
end

def seed
    trainers = create_trainers
    create_clients.each do |client|
        t = Random.new
        trainer = t.rand(0..trainers.length)
        client.assign_trainer(Trainer.all[trainer])

        r = Random.new
        location = r.rand(0..5)
        client.choose_location(Location.all[location])
        # binding.pry
    end
end

seed

puts "The location with the least clients is #{Location.least_clients.city} with only #{Location.least_clients.clients.count} clients."

puts "The trainer with the most clients is #{Trainer.most_clients.name} with a total number of #{Trainer.most_clients.clients.count} clients."

