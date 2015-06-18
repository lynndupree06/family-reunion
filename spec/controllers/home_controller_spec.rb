require 'rails_helper'
include Devise::TestHelpers

describe HomeController do

  let(:current_user) { FactoryGirl.create(:user) }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in current_user
  end

  describe '#register' do

    context 'with all new applicants' do
      before do
        params = {
            :applicants => [{:first_name => current_user.first_name, :last_name => current_user.last_name, :shirt_size => 'S'},
                            {:first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :shirt_size => 'M'},
                            {:first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :shirt_size => 'L'},
                            {:first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :shirt_size => 'XL'}],
            :num_of_rooms => 2
        }

        post :new_registration, params

      end

      it 'should create a new registration for family reunion' do
        registration = Registration.first
        expect(response).to redirect_to :root
        expect(registration.num_of_rooms).to eq(2)
      end

      it 'should register user for family reunion' do
        applicant = Applicant.where(:first_name => current_user.first_name, :last_name => current_user.last_name)
        expect(applicant.count).to be(1)
      end

      it 'should register additional applicants for family reunion' do
        registration = Registration.first
        expect(Applicant.where(:registration_id => registration.id).count).to eq(4)
      end

    end

    context 'with applicants who have accounts' do

      it 'should register additional applicants for family reunion who already have an account' do
        another_user = FactoryGirl.create(:user)
        params = {
            :applicants => [{:first_name => another_user.first_name,
                             :last_name => another_user.last_name,
                             :shirt_size => 'XL'}],
            :num_of_rooms => 1
        }

        post :new_registration, params

        applicantThatDoesNotExist = Applicant.where(:first_name => current_user.first_name, :last_name => current_user.last_name)
        applicantThatExists = Applicant.where(:first_name => another_user.first_name, :last_name => another_user.last_name)

        expect(applicantThatDoesNotExist.count).to be(0)
        expect(applicantThatExists.count).to be(1)
      end

    end

    it 'should navigate to registration page' do
      get :register
      expect(response).to render_template(:register)
    end

  end

end
