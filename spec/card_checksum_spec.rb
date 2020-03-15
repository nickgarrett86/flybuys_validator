RSpec.describe CardChecksum do
  describe '.for' do
    subject(:checksum) { described_class.for(card_number) }

    context 'when there are an odd number of digits in the card number' do
      context 'when the odd indexed digits have values' do
        let(:card_number) { '0101010' }

        it 'returns the sum of the digits doubled' do
          expected = card_number.split('').map(&:to_i).sum { |val| val * 2 }
          expect(checksum).to eq(expected)
        end
      end

      context 'when the even indexed digits have values' do
        let(:card_number) { '1010101' }

        it 'returns the sum of the digits' do
          expected = card_number.split('').map(&:to_i).sum
          expect(checksum).to eq(expected)
        end
      end

      context 'when all digits have values' do
        let(:card_number) { '1111111' }

        it 'returns the sum of the odd indexed digits doubled plus the even indexed digits' do
          expected = card_number.split('').map(&:to_i).map.with_index do |val, index|
            if index.odd?
              2 * val
            else
              val
            end
          end.sum
          expect(checksum).to eq(expected)
        end
      end
    end

    context 'when there are an even number of digits in the card number' do
      context 'when the even indexed digits have values' do
        let(:card_number) { '10101010' }

        it 'returns the sum of the digits doubled' do
          expected = card_number.split('').map(&:to_i).sum { |val| val * 2 }
          expect(checksum).to eq(expected)
        end
      end

      context 'when the odd indexed digits have values' do
        let(:card_number) { '01010101' }

        it 'returns the sum of the digits' do
          expected = card_number.split('').map(&:to_i).sum
          expect(checksum).to eq(expected)
        end
      end

      context 'when all digits have values' do
        let(:card_number) { '11111111' }

        it 'returns the sum of the even indexed digits doubled plus the odd indexed digits' do
          expected = card_number.split('').map(&:to_i).map.with_index do |val, index|
            if index.even?
              2 * val
            else
              val
            end
          end.sum
          expect(checksum).to eq(expected)
        end
      end
    end
  end
end
