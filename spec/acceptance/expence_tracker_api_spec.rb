require 'rack/test'
require 'json'
require '/home/michael/code/MichaelPetrov1990/Expense_Tracker_Rspec_Book/app/api.rb'

module ExpenseTracker
  RSpec.describe 'Expence Tracker API' do
    include Rack::Test::Methods
    def app
      ExpenseTracker::API.new
    end
    it 'records submitted expences' do
      coffee = {
        'payee' => 'Starbucks',
        'amount' => 5.75,
        'date' => '2017-06-10'
      }
      post '/expenses', JSON.generate(coffee)
      expect(last_response.status).to eq(200)
      parsed = JSON.parse(last_response.body)
      expect(parsed).to include('expense_id' => a_kind_of(Integer))
    end
  end  
end