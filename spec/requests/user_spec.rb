# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe "Show User", type: :request do

  let(:current_user) { create(:user) }

  it "GET #show" do
    login_as(current_user)
    get "/users/#{current_user.id}"
    expect(response).to have_http_status(200)
    expect(response.body).to include("User")
    
  end
  
  
end

