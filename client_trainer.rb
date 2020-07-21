class ClientTrainer
    attr_reader :client, :trainer

    @@all = []

    def initialize(client, trainer)
        @client = client
        @trainer = trainer
        ClientTrainer.all << self
    end

    def self.all
        @@all
    end

end