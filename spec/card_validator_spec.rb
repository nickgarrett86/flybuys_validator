RSpec.describe CardValidator do
  let(:validator) { described_class.new(card_number) }
  let(:card_number) { '123456' }

  describe '#valid?' do
    before do
      allow(CardChecksum)
        .to(
          receive(:for)
            .with(card_number)
            .and_return(checksum)
        )
    end

    context 'when the checksum value is divisible by 10' do
      let(:checksum) { 100 }

      it 'is valid' do
        expect(validator).to be_valid
      end
    end

    context 'when the checksum value is not divisible by 10' do
      let(:checksum) { 11 }

      it 'is not valid' do
        expect(validator).not_to be_valid
      end
    end
  end

  describe '#type' do
    it 'delegates to CardTypes.for' do
      expect(CardTypes).to receive(:for).with(card_number)
      validator.type
    end
  end
end
