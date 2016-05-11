defmodule Hello.FiveController do
  use Hello.Web, :controller

  alias Hello.Five

  plug :scrub_params, "five" when action in [:create, :update]

  def index(conn, _params) do
    fives = Repo.all(Five)
    render(conn, "index.html", fives: fives)
  end

  def new(conn, _params) do
    changeset = Five.changeset(%Five{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"five" => five_params}) do
    changeset = Five.changeset(%Five{}, five_params)

    case Repo.insert(changeset) do
      {:ok, _five} ->
        conn
        |> put_flash(:info, "Five created successfully.")
        |> redirect(to: five_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    five = Repo.get!(Five, id)
    render(conn, "show.html", five: five)
  end

  def edit(conn, %{"id" => id}) do
    five = Repo.get!(Five, id)
    changeset = Five.changeset(five)
    render(conn, "edit.html", five: five, changeset: changeset)
  end

  def update(conn, %{"id" => id, "five" => five_params}) do
    five = Repo.get!(Five, id)
    changeset = Five.changeset(five, five_params)

    case Repo.update(changeset) do
      {:ok, five} ->
        conn
        |> put_flash(:info, "Five updated successfully.")
        |> redirect(to: five_path(conn, :show, five))
      {:error, changeset} ->
        render(conn, "edit.html", five: five, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    five = Repo.get!(Five, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(five)

    conn
    |> put_flash(:info, "Five deleted successfully.")
    |> redirect(to: five_path(conn, :index))
  end
end
