defmodule ChristmasList.PresentController do
  use ChristmasList.Web, :controller

  alias ChristmasList.User
  alias ChristmasList.Present

  def index(conn, _params) when :current_user != nil do
    user = User |> Repo.get(getUsetId(conn) ) |> Repo.preload([:presents])
    render(conn, "index.html", user: user)
  end

  def new(conn, _params) when :current_user != nil do
    changeset = Present.changeset(%Present{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"present" => present_params}) do
    changeset = Present.changeset(%Present{user_id: getUsetId(conn)}, present_params)

    case Repo.insert(changeset) do
      {:ok, _present} ->
        conn
        |> put_flash(:info, "Present created successfully.")
        |> redirect(to: present_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  defp getUsetId(conn) do
    Map.get(get_session(conn, :current_user), :id)
  end

end
