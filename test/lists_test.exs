defmodule MyListTest do
  use ExUnit.Case
  doctest MyList

  test "prime" do
    assert(MyList.prime(10) == [2, 3, 5, 7])
    assert(MyList.prime(15) == [2, 3, 5, 7, 11, 13])
  end

  test "simple totals" do
    tax_rates = [ CA: 0.08, NC: 1.00 ]
    orders = [
      [ ship_to: :CA, net_amount: 100.00 ],
      [ ship_to: :NC, net_amount: 100.00 ] ]

    assert(MyList.totals(tax_rates, orders) == [
      [ total_amount: 108.00, ship_to: :CA, net_amount: 100.00 ],
      [ total_amount: 200.00, ship_to: :NC, net_amount: 100.00 ]
    ])
  end

  @tag :pending
  test "totals" do
    tax_rates = [ NC: 0.075, TX: 0.08 ]
    orders = [
      [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount:  35.50 ],
      [ id: 125, ship_to: :TX, net_amount:  24.00 ],
      [ id: 126, ship_to: :TX, net_amount:  44.80 ],
      [ id: 127, ship_to: :NC, net_amount:  25.00 ],
      [ id: 128, ship_to: :MA, net_amount:  10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 120, ship_to: :NC, net_amount:  50.00 ] ]

    assert(MyList.totals(tax_rates, orders) == [
      [ total_amount: 107.5, id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ total_amount: 35.50, id: 124, ship_to: :OK, net_amount:  35.50 ],
      [ total_amount: 25.92, id: 125, ship_to: :TX, net_amount:  24.00 ],
      [ total_amount: 48.384, id: 126, ship_to: :TX, net_amount:  44.80 ],
      [ total_amount: 26.00, id: 127, ship_to: :NC, net_amount:  25.00 ],
      [ total_amount: 10.00, id: 128, ship_to: :MA, net_amount:  10.00 ],
      [ total_amount: 102.00, id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ total_amount: 51.00, id: 120, ship_to: :NC, net_amount:  50.00 ]
    ])
  end
end
