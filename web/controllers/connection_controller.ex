defmodule ChristmasList.ConnectionController do
  use ChristmasList.Web, :controller

  alias ChristmasList.User

  def new(conn, _params) do
    render conn, "connection.html", changeset: User.changeset(%User{})
  end

  def create(conn, %{"user" => user_params}) do
    Repo.get_by(User, login: user_params["login"])
    |> sign_in(user_params["mdp"], conn)
  end

  defp sign_in(user, password, conn) when is_nil(user) do
    conn
    |> put_flash(:error, "Invalid username/password combination!")
    |> redirect(to: "/connection/new")
  end

  defp sign_in(user, password, conn) do
    if checkpw(password, user.mdp) do
      conn
      |> put_session(:current_user, user)
      |> redirect(to: menu_path(conn, :index))
    else
      conn
      |> put_session(:current_user, nil)
      |> put_flash(:error, "Invalid username/password combination!")
      |> redirect(to: "/connection/new")
    end
  end

  defp checkpw(pass1, pass2) do pass1 === pass2 end

end
