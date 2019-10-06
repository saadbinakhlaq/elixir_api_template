defmodule ElixirApiTemplateWeb.Router do
  use ElixirApiTemplateWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixirApiTemplateWeb do
    pipe_through :api
  end
end
