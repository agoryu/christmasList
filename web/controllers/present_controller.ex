defmodule ChristmasList.PresentController do
  use ChristmasList.Web, :controller

  alias ChristmasList.User

  def index(conn, _params) when :current_user != nil do
    user = User |> Repo.get(getUsetId(conn) ) |> Repo.preload([:presents])
    render(conn, "index.html", user: user)
  end

  defp getUsetId(conn) do
    Map.get(get_session(conn, :current_user), :id)
  end

end
