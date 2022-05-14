require 'spec_helper'

describe 'opendkim::private2public' do
  let(:privkey) do
    File.read(fixtures('dkim.key'))
  end
  let(:pubkey) do
    File.read(fixtures('dkim.pub'))
  end

  context 'with function signature validation' do
    it { is_expected.not_to eq(nil) }
    it { is_expected.to run.with_params.and_raise_error(ArgumentError) }
    it { is_expected.to run.with_params(0, 1).and_raise_error(ArgumentError) }
  end

  it { is_expected.to run.with_params(privkey).and_return(pubkey) }
end
