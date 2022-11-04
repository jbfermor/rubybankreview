# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe "Show User", type: :request do

  let(:user) { create(:user) }
  let(:account) { create(:account) }

  it "GET #show" do   
    sign_in(user)
    puts user.email
    get "/users/#{user.id}"
    expect(response).to have_http_status(200)
    expect(response.body).to include("Welcome")   
  end
  
  
end

