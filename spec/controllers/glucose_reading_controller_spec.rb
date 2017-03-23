require 'rails_helper'

RSpec.describe GlucoseReadingController, :type => :controller do

    let(:user) { FactoryGirl.create(:user, id:1) }

	before :each do
		controller.class.skip_before_filter :auth_user
		sign_in user
	end


	describe "GET show_readings" do

		it "fetches all the readings for the specified date" do
			params = {"observation_date"=>"2017/03/23", "format" => "js"}
			xhr :get, :show_readings, params
			expect(response.status).to eq(200)
			expect(response).to render_template(:show_readings)
		end
	end

	describe "POST add_entry" do

		it "adds reading for a day" do
			
			params = {"reading"=>{"observation_date"=>"2017/07/01", "glucose_level"=>"1"}, "format" => "js"}
			post :add_entry, params
			expect(response.status).to eq(200)
			expect(response).to render_template(:show_readings)

		end

	end

end