defmodule ChristmasList.Router do
  use ChristmasList.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChristmasList do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/menu", MenuController, :index 
    resources "/connection", ConnectionController, only: [:new, :create]

    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChristmasList do
  #   pipe_through :api
  # end
end
