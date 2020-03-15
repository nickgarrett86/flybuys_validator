# using this spec to smoke test integration

RSpec.describe Main do
  describe '#call' do
    let(:input) do
      %w[
        60141016700078611
        6014152705006141
        6014111100033006
        6014709045001234
        6014352700000140
        6014355526000020
        6014\ 3555\ 2900\ 0028
        6013111111111111
      ]
    end
    let(:expected_output) do
      %w[
        Fly\ Buys\ Black:\ 60141016700078611\ (valid)
        Fly\ Buys\ Black:\ 6014152705006141\ (invalid)
        Fly\ Buys\ Black:\ 6014111100033006\ (valid)
        Fly\ Buys\ Blue:\ 6014709045001234\ (valid)
        Fly\ Buys\ Red:\ 6014352700000140\ (valid)
        Fly\ Buys\ Green:\ 6014355526000020\ (valid)
        Fly\ Buys\ Green:\ 6014355529000028\ (invalid)
        Unknown:\ 6013111111111111\ (invalid)
      ].join("\n").concat("\n")
    end

    context 'when using a known set of inputs' do
      subject { Main.new.call }

      before do
        io = StringIO.new
        io.puts input.join("\n")
        io.rewind
        $stdin = io
      end

      after do
        $stdin = STDIN
      end

      it 'outputs the expected strings' do
        expect { subject }.to output(expected_output).to_stdout
      end
    end
  end
end
