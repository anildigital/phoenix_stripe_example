defmodule PhoenixStripeExampleWeb.ChargeControllerTest do
  use PhoenixStripeExampleWeb.ConnCase

  alias PhoenixStripeExample.Charges

  @create_attrs %{charge: "120.5"}
  @update_attrs %{charge: "456.7"}
  @invalid_attrs %{charge: nil}

  def fixture(:charge) do
    {:ok, charge} = Charges.create_charge(@create_attrs)
    charge
  end

  describe "index" do
    test "lists all charges", %{conn: conn} do
      conn = get conn, charge_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Charges"
    end
  end

  describe "new charge" do
    test "renders form", %{conn: conn} do
      conn = get conn, charge_path(conn, :new)
      assert html_response(conn, 200) =~ "New Charge"
    end
  end

  describe "create charge" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, charge_path(conn, :create), charge: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == charge_path(conn, :show, id)

      conn = get conn, charge_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Charge"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, charge_path(conn, :create), charge: @invalid_attrs
      assert html_response(conn, 200) =~ "New Charge"
    end
  end

  describe "edit charge" do
    setup [:create_charge]

    test "renders form for editing chosen charge", %{conn: conn, charge: charge} do
      conn = get conn, charge_path(conn, :edit, charge)
      assert html_response(conn, 200) =~ "Edit Charge"
    end
  end

  describe "update charge" do
    setup [:create_charge]

    test "redirects when data is valid", %{conn: conn, charge: charge} do
      conn = put conn, charge_path(conn, :update, charge), charge: @update_attrs
      assert redirected_to(conn) == charge_path(conn, :show, charge)

      conn = get conn, charge_path(conn, :show, charge)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, charge: charge} do
      conn = put conn, charge_path(conn, :update, charge), charge: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Charge"
    end
  end

  describe "delete charge" do
    setup [:create_charge]

    test "deletes chosen charge", %{conn: conn, charge: charge} do
      conn = delete conn, charge_path(conn, :delete, charge)
      assert redirected_to(conn) == charge_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, charge_path(conn, :show, charge)
      end
    end
  end

  defp create_charge(_) do
    charge = fixture(:charge)
    {:ok, charge: charge}
  end
end
