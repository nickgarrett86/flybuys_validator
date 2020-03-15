RSpec.describe ConsoleInterface do
  describe '.card_numbers' do
    subject(:card_numbers) { described_class.card_numbers }

    before do
      io = StringIO.new
      io.puts input
      io.rewind
      $stdin = io
    end

    after do
      $stdin = STDIN
    end

    context 'when nothing is passed to STDIN' do
      let(:input) { nil }

      it 'returns an empty array' do
        expect(card_numbers).to eq []
      end
    end

    context 'when multiple lines are passed in to STDIN' do
      let(:line_1) { '123' }
      let(:line_2) { '456' }
      let(:lines) { [line_1, line_2] }
      let(:input) { lines.join("\n") }

      it 'returns each line as an element in an array' do
        expect(card_numbers).to eq lines
      end
    end
  end

  describe '.card_details' do
    subject(:card_details) { described_class.card_details(details) }
    let(:details) { double(:type => double, :card_number => double, :valid? => valid) }

    context 'when the card is valid' do
      let(:valid) { true }
      let(:expected_output) { "#{details.type}: #{details.card_number} (valid)\n" }

      it 'displays the card type, number, and validity' do
        expect { card_details }.to output(expected_output).to_stdout
      end
    end

    context 'when the card is not valid' do
      let(:valid) { false }
      let(:expected_output) { "#{details.type}: #{details.card_number} (invalid)\n" }

      it 'displays the card type, number, and validity' do
        expect { card_details }.to output(expected_output).to_stdout
      end
    end
  end
end
