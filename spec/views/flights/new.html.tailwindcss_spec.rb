require 'rails_helper'

RSpec.describe "flights/new", type: :view do
  before(:each) do
    assign(:flight, Flight.new(
      departure_airport_id: 1,
      arrival_airport_id: 1,
      duration: "MyString"
    ))
  end

  it "renders new flight form" do
    render

    assert_select "form[action=?][method=?]", flights_path, "post" do

      assert_select "input[name=?]", "flight[departure_airport_id]"

      assert_select "input[name=?]", "flight[arrival_airport_id]"

      assert_select "input[name=?]", "flight[duration]"
    end
  end
end
