class Trainer
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        Trainer.all << self
    end

    def self.all
        @@all
    end

    def self.most_clients
        Trainer.all.max_by do |trainer|
            trainer.clients.count
        end
    end

    def client_trainers
        ClientTrainer.all.select do |client_trainer|
            client_trainer.trainer == self
        end
    end

    def clients
        client_trainers.map do |trainer|
            trainer.client
        end
    end
end