require 'rails_helper'

RSpec.describe "flights/edit", type: :view do
  before(:each) do
    @flight = assign(:flight, Flight.create!(
      departure_airport_id: 1,
      arrival_airport_id: 1,
      duration: "MyString"
    ))
  end

  it "renders the edit flight form" do
    render

    assert_select "form[action=?][method=?]", flight_path(@flight), "post" do

      assert_select "input[name=?]", "flight[departure_airport_id]"

      assert_select "input[name=?]", "flight[arrival_airport_id]"

      assert_select "input[name=?]", "flight[duration]"
    end
  end
end
