defmodule Hello.FiveControllerTest do
  use Hello.ConnCase

  alias Hello.Five
  @valid_attrs %{comment: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, five_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing fives"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, five_path(conn, :new)
    assert html_response(conn, 200) =~ "New five"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, five_path(conn, :create), five: @valid_attrs
    assert redirected_to(conn) == five_path(conn, :index)
    assert Repo.get_by(Five, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, five_path(conn, :create), five: @invalid_attrs
    assert html_response(conn, 200) =~ "New five"
  end

  test "shows chosen resource", %{conn: conn} do
    five = Repo.insert! %Five{}
    conn = get conn, five_path(conn, :show, five)
    assert html_response(conn, 200) =~ "Show five"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, five_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    five = Repo.insert! %Five{}
    conn = get conn, five_path(conn, :edit, five)
    assert html_response(conn, 200) =~ "Edit five"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    five = Repo.insert! %Five{}
    conn = put conn, five_path(conn, :update, five), five: @valid_attrs
    assert redirected_to(conn) == five_path(conn, :show, five)
    assert Repo.get_by(Five, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    five = Repo.insert! %Five{}
    conn = put conn, five_path(conn, :update, five), five: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit five"
  end

  test "deletes chosen resource", %{conn: conn} do
    five = Repo.insert! %Five{}
    conn = delete conn, five_path(conn, :delete, five)
    assert redirected_to(conn) == five_path(conn, :index)
    refute Repo.get(Five, five.id)
  end
end
