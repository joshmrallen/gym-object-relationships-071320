class Client
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        Client.all << self
    end

    def self.all
        @@all
    end

    def assign_trainer(trainer)
        ClientTrainer.new(self, trainer)
    end

    def choose_location(location)
        ClientLocation.new(self, location)
    end

end