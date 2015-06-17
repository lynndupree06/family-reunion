require 'rails_helper'
include Devise::TestHelpers

describe HomeController do

    let(:user) { FactoryGirl.create(:user) }

    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end

    describe '#register' do

      it 'should register user for family reunion' do

        params = {
            :num_of_people => 4,
            :num_of_tshirts => 4,
            :tshirt_sizes => %w(S M L XL),
            :num_of_rooms => 2
        }

        post :register, params

        registration = Registration.first

        expect(response).to redirect_to :root
        expect(registration.num_of_people).to eq(4)
        expect(registration.num_of_tshirts).to eq(4)
        expect(registration.num_of_rooms).to eq(2)
      end

    end

end
