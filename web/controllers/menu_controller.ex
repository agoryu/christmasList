defmodule ChristmasList.MenuController do
  use ChristmasList.Web, :controller

  def index(conn, _params) when :current_user != nil do
    render conn, "menu.html"
  end

  def index(conn, _params) do
    render conn, "connection.html"
  end
end
