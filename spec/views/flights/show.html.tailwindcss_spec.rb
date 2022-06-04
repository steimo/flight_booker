require 'rails_helper'

RSpec.describe "flights/show", type: :view do
  before(:each) do
    @flight = assign(:flight, Flight.create!(
      departure_airport_id: 2,
      arrival_airport_id: 3,
      duration: "Duration"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Duration/)
  end
end
