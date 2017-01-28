require 'rails_helper'

RSpec.describe MilliPiyangoClient do
  %w(sayisal superloto).each do |game_type|
    let!(:client) { MilliPiyangoClient.new(game_type) }

    describe 'push_results' do
      it 'return if d_day in future' do
        date = Date.parse('31-12-2999')
        expect(client.push_results(date)).to eq(nil)
      end

      xit 'No results if 404' do
        date = Date.parse('27-01-2017')
        expect(client.push_results(date)).to eq(false)
      end

      xit 'Push results if all green' do
        date = Date.parse('21-01-2017')
        expect(client.push_results(date)).to eq(true)
      end
    end
  end
end
