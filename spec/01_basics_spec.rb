require '01_basics'

describe 'Farm' do
    let(:farm) { Farm.new }

    it 'has $1000 to start' do
        expect(farm.cash).to eq(1000)
    end

    context 'items' do
        it 'is array' do
            expect(farm.items).to be_a(Array)
        end
        it 'empty to start' do
            expect(farm.items.count).to eq(0)
        end
    end
end

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

describe 'Cow' do
    let(:cow) { Cow.new }

    it 'costs $100' do
        expect(cow.price).to eq(100)
    end

    it 'says "moo"' do
        expect(cow.speak).to eq('moo')
    end
end

describe 'Pig' do
    let(:pig) { Pig.new }

    it 'costs $50' do
        expect(pig.price).to eq(50)
    end

    it 'says "oink"' do
        expect(pig.speak).to eq('oink')
    end
end

# Look! You've repeated a whole section of your code! Let's solve that by
# creating a superclass 'Animal' that both the Cow class and the Pig class
# inherit certain methods from.

# Here's a hint. Your Cow class should look like this:
# class Cow < Animal
#    def initialize
#        super(100, 'moo')
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
# item in the items array

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
        let(:farm) { Farm.new }
        let(:cow1) { Cow.new }
        let(:cow2) { Cow.new }
        let(:pig1) { Pig.new }

        before :each do
            farm.items = [cow1, cow2, pig1]
        end

        it 'empties items array'
        it 'increases cash by correct amount'
    end
end
