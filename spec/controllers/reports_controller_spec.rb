require 'rails_helper'

RSpec.describe ReportsController, :type => :controller do

    let(:user) { FactoryGirl.create(:user, id:1) }

	before :each do
		controller.class.skip_before_filter :auth_user
		sign_in user
	end


	describe "GET show_readings" do

		it "fetches report of type daily for the specified date" do
			params = {"type"=>"daily_average", "observation_date"=>"01/03/2017"}
			xhr :get, :show_reports, params
			expect(response.status).to eq(200)
			expect(response).to render_template(:show_reports)
		end

		it "fetches report of type month_to_date_ the specified date" do
			params = {"type"=>"month_to_date_average", "observation_date"=>"01/03/2017"}
			xhr :get, :show_reports, params
			expect(response.status).to eq(200)
			expect(response).to render_template(:show_reports)
		end

		it "fetches areport of type last month for the specified date" do
			params = {"type"=>"last_month_average", "observation_date"=>"01/03/2017"}
			xhr :get, :show_reports, params
			expect(response.status).to eq(200)
			expect(response).to render_template(:show_reports)
		end

	end
 end
end