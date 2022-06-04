require 'rails_helper'

RSpec.describe "flights/index", type: :view do
  before(:each) do
    assign(:flights, [
      Flight.create!(
        departure_airport_id: 2,
        arrival_airport_id: 3,
        duration: "Duration"
      ),
      Flight.create!(
        departure_airport_id: 2,
        arrival_airport_id: 3,
        duration: "Duration"
      )
    ])
  end

  it "renders a list of flights" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Duration".to_s, count: 2
  end
end
