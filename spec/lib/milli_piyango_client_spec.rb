require 'rails_helper'

RSpec.describe MilliPiyangoClient do
  %w(sayisal superloto).each do |game_type|
    let(:client) { MilliPiyangoClient.new(game_type) }

    describe 'push_results' do
      it 'return if d_day in future' do
        tomorrow = Chronic.parse('tomorrow')
        Timecop.freeze(tomorrow) do
          expect(client.push_results).to eq(false)
        end
      end

      it 'No results if 404' do
        last_tuesday = Chronic.parse('last tuesday')
        Timecop.freeze(last_tuesday) do
          expect(client.push_results).to eq(false)
        end
      end

      it 'Push results if all green' do
        lottery_day = Chronic.parse("last weeks #{client.day}")
        Timecop.freeze(lottery_day) do
          expect(client.push_results).to eq(true)
        end
      end
    end
  end
end
