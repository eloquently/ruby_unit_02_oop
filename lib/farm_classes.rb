# Remember to install your bundle and run guard to automatically run tests when
# you save the file

# bundle install
# bundle exec guard

# Look at the spec file to see where to start. The specs are written in the
# order you should implement them in.

class Farm
    attr_accessor :cash, :items

    def initialize(cash=1000, items=[])
        self.cash = cash
        self.items = items
    end

    def buy(item)
        if item.respond_to?(:price)
            if self.cash > item.price
                self.cash -= item.price
                self.items << item
                return true
            else
                return false
            end
        else
            return false
        end
    end

    def sell_item(i)
        sold = items.delete_at(i)
        self.cash += sold.price
    end

    def sell_all
        while items.count > 0
            self.sell_item(0)
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