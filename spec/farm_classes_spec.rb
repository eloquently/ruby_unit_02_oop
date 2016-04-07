require 'farm_classes'

# We're building a simple representation of a farm. To start, let's make a farm
# class with two instance variables. First, we'll need an instance variable
# called cash to keep track of how much cash the farm has. Second, we'll need
# an instance variable called items that will keep track of which items the farm
# has purchased.

# Read the tests below to figure out the default values of these instance
# variables and create a Farm class in farm_classes.rb to make the tests pass.

describe 'Farm' do
    let(:farm) { Farm.new }

    context 'cash' do
        it 'is 1000 to start' do
            expect(farm.cash).to eq(1000)
        end
    end

    context 'items' do
        it 'is array' do
            expect(farm.items).to be_a(Array)
        end
        it 'is empty to start' do
            expect(farm.items.count).to eq(0)
        end
    end
end

# Now let's make a Rock class. A rock has a color, and that's about it.

describe 'Rock' do
    context 'gray rock' do
        let(:rock)  { Rock.new('gray') }

        it 'is gray' do
            expect(rock.color).to eq('gray')
        end
    end

    context 'brown rock' do
        let(:rock)  { Rock.new('brown') }

        it 'is brown' do
            expect(rock.color).to eq('brown')
        end
    end

    context 'default rock' do
        let(:rock)  { Rock.new }

        it 'is black' do
            expect(rock.color).to eq('black')
        end
    end
end

# Let's make a cow class. A cow has a price and a sound (moo). It also has
# a method called speak, which returns the cow's sound and an exclamation point.

describe 'Cow' do
    let(:cow) { Cow.new }

    it 'costs $100' do
        expect(cow.price).to eq(100)
    end

    it 'says "moo"' do
        expect(cow.speak).to eq('moo!')
    end
end

# Pigs are similar to cows. They have a price, a sound, and a speak method.

describe 'Pig' do
    let(:pig) { Pig.new }

    it 'costs $50' do
        expect(pig.price).to eq(50)
    end

    it 'says "oink"' do
        expect(pig.speak).to eq('oink!')
    end
end

# Look! You've repeated a whole section of your code! Let's solve that by
# creating a superclass 'Animal' that both the Cow class and the Pig class
# inherit certain methods from.

# Here's a hint. Your Cow class should look like this:
# class Cow < Animal
#    def initialize(price=100, sound='moo')
#        super(price, sound)
#    end
# end

describe 'Pig' do
    it 'inherits from Animal' do
        expect(Pig.new).to be_kind_of(Animal)
    end
end

describe 'Rock' do
    it 'does not inherit from Animal' do
        expect(Rock.new).to_not be_kind_of(Animal)
    end
end


# In ruby, we don't explicitly check the type of objects. Instead, we care about
# what methods and attributes they have. This is called duck typing. We need to
# write a method for our farm that allows it to purchase animals. The method will
# take one argument: the animal the farm is buying. Instead of checking to see
# if the argument is an animal, however, all we really care about is if it has
# a price.

# To see if an object has a certain method, use the respond_to? method with
# the name of the method you are interested in as a symbol.
# For example: [0, 1, 2].respond_to?(:count) => true

describe 'Farm' do
    let(:farm) { Farm.new }

    context 'buying cow' do
        let(:cow) { Cow.new }

        it 'charges money' do
            expect { farm.buy(cow) }.to change { farm.cash }.by(-cow.price)
        end

        it 'adds cow to items array' do
            farm.buy(cow)
            expect(farm.items.last).to eq(cow)
        end

        it 'returns true' do
            expect(farm.buy(cow)).to eq(true)
        end
    end

    context 'buying rock' do
        let(:rock) { Rock.new }

        it 'does not charge any money' do
            expect { farm.buy(rock) }.to change { farm.cash }.by(0)
        end

        it 'does not change items array' do
            expect { farm.buy(rock) }.to change { farm.items.count }.by(0)
        end

        it 'returns false' do
            expect(farm.buy(rock)).to eq(false)
        end
    end
end

# Now it's time to write some tests on your own

describe 'Farm' do
    context 'buying pig' do
        it 'charges money'
        it 'adds pig to items array'
        it 'returns true'
    end
end

# We want our farm to be able to sell animals.
# Animals have fixed prices based on their type.
# The farm class will have a method #sell_item(i), which will sell the i-th
# item in the items array. Hint: Use the built in delete_at method of the
# Array class (http://ruby-doc.org/core-2.2.0/Array.html#method-i-delete_at)

describe 'Farm' do
    context '#sell_item' do
        it 'increases cash by correct amount'
        it 'removes item'
    end
end

# Wait! There's a bug in our program. If we buy too many animals, our farm can
# have negative money.
# Let's fix this problem. First, we need to write some tests that fail while the
# bug is present. Then we need to change the buy method to eliminate this bug

describe 'Farm' do
    describe '#buy' do
        context 'without enough cash' do
            let(:farm) { Farm.new }
            let(:cow) { Cow.new }

            it 'does not charge any money'
            it 'does not change items array'
            it 'returns false'
        end
    end
end

# We want our farm to be able to sell all its items with one method, #sell_all
describe 'Farm' do
    describe '#sell_all' do
        let(:farm) { Farm.new(1000, [cow1, cow2, pig1]) }
        let(:cow1) { Cow.new }
        let(:cow2) { Cow.new }
        let(:pig1) { Pig.new }

        it 'empties items array'
        it 'increases cash by correct amount'
    end
end
