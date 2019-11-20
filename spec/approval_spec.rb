# frozen_string_literal: true

describe '#approval_test' do
  it 'current output is the same as initial one' do
    golden_standard = File.open('./lib/approval/GoldenStandard.txt')
                          .readlines.map(&:chomp)
    current_version = File.open('./lib/approval/CurrentFile.txt')
                          .readlines.map(&:chomp)
    expect(golden_standard).to eq(current_version)
  end
end
