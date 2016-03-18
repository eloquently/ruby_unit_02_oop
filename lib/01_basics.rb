# Lecture covers:
# TDD Basics
# Goal in Ruby: Don't repeat yourself


# first things first:
# Let's install Bundler.
# Bundler allows us to keep track of all the external libraries (gems) we need
# Bundler makes it easy to update gems, install a bunch of new ones, and
# ensure that all the gems we have remain compatible as they get updated

# In your terminal, run:

# gem install bundler

# Bundler installs all gems listed in the file called Gemfile. Take a look at it

# To install all the gems in your Gemfile, run this in your terminal:

# bundle install

# For this exercise, we've provided a fully detailed spec file. Your goal is to
# make all the tests pass. The tests are written in the order you should
# complete them in.

# Instead of manually running your tests every time you make a change, we have
# set up the Guard gem to run your tests each time the code is saved.
# Run this in your terminal to start guard:

# bundle exec guard

class Farm
    attr_accessor :cash, :items

    def initialize
        @cash = 1000
        @items = []
    end

    def buy(item)
        if item.respond_to? :price
            @cash -= item.price
            @items << item
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
        @price = price
        @sound = sound
    end

    def speak
        return @sound
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