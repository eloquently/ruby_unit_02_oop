# Remember to install your bundle and run guard to automatically run tests when
# you save the file

# bundle install
# bundle exec guard

# Look at the spec file to see where to start. The specs are written in the
# order you should implement them in.

class Farm
    attr_accessor :cash, :items

    def initialize
        self.cash = 1000
        self.items = []
    end

    def buy(item)
        if item.respond_to? :price
            self.cash -= item.price
            self.items << item
            return true
        else
            return false
        end
    end
end

class Rock
    attr_accessor :color

    def initialize(color='black')
        @color = color
    end
end

class Animal
    attr_accessor :price

    def initialize(price, sound)
        self.price = price
        @sound = sound
    end

    def speak
        return "#{@sound}!"
    end
end

class Cow < Animal
    def initialize
        super(100, 'moo')
    end
end

class Pig < Animal
    def initialize
        super(50, 'oink')
    end
end