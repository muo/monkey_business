require "rails_helper"

RSpec.describe "User authentication", type: :request do
  it "returns data about user after successful login" do
    user = create(:user,
                  name: "James Brown",
                  email: "james.brown@example.com",
                  password: "pass1234")

    post new_user_session_path,
         params: { email: "james.brown@example.com", password: "pass1234" }
    expected_data = { "data" =>
      { "id" => user.id,
        "email" => "james.brown@example.com",
        "provider" => "email",
        "name" => "James Brown",
        "role" => "customer",
        "uid" => "james.brown@example.com" } }
    expect(JSON.parse(response.body)).to eq(expected_data)
  end

  it "returns ok status after successful login" do
    create(:user,
           name: "James Brown",
           email: "james.brown@example.com",
           password: "pass1234")

    post new_user_session_path,
         params: { email: "james.brown@example.com", password: "pass1234" }

    expect(response).to have_http_status(:ok)
  end

  it "returns unauthorized status after unsuccessful login" do
    create(:user,
           name: "James Brown",
           email: "james.brown@example.com",
           password: "pass1234")

    post new_user_session_path,
         params: { email: "james.brown@example.com", password: "XYZ0000" }

    expect(response).to have_http_status(:unauthorized)
  end

  it "returns error message after unsuccessful login" do
    create(:user,
           name: "James Brown",
           email: "james.brown@example.com",
           password: "pass1234")
    post new_user_session_path,
         params: { email: "james.brown@example.com", password: "XYZ0000" }
    expected_data = { "errors" => ["Invalid login credentials. Please try again."] }
    expect(JSON.parse(response.body)).to eq(expected_data)
  end
end
