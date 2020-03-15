RSpec.describe CardTypes do
  describe '.for' do
    subject(:card_type) { CardTypes.for(number) }
    let(:number) { double }

    before do
      stub_const('CardTypes::TYPES', types)
    end

    context 'when a type matches' do
      let(:matching_type) { double(:name => double, :match? => true) }
      let(:types) { [matching_type] }

      it 'returns its name' do
        expect(card_type).to eq(matching_type.name)
      end
    end

    context 'when no types match' do
      let(:non_matching_type) { double(:name => name, :match? => false) }
      let(:types) { [] }

      it 'returns unknown' do
        expect(card_type).to eq('Unknown')
      end
    end

    context 'when there are multiple matching types' do
      let(:matching_type_one) { double(:name => double, :match? => true) }
      let(:matching_type_two) { double(:name => double, :match? => true) }
      let(:types) { [matching_type_one, matching_type_two] }

      it 'returns the name of the first match' do
        expect(card_type).to eq(matching_type_one.name)
      end
    end
  end
end
