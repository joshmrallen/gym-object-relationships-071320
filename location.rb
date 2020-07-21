class Location
    attr_reader :city

    @@all = []

    def initialize(city)
        @city = city
        Location.all << self
    end

    def self.all
        @@all
    end

    def self.least_clients
        Location.all.min_by do |location|
            location.clients.count
        end
    end

    def client_locations
        ClientLocation.all.select do |client_location|
            client_location.location == self
        end
    end

    def clients
        client_locations.map do |location|
            location.client
        end
    end

end