defmodule PhoenixStripeExampleWeb.Router do
  use PhoenixStripeExampleWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :protected do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    # Add this
    plug(Coherence.Authentication.Session, protected: true)
  end

  scope "/" do
    pipe_through(:browser)
    coherence_routes()
  end

  scope "/" do
    pipe_through(:protected)
    coherence_routes(:protected)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", PhoenixStripeExampleWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    # Add public routes below
  end

  scope "/", PhoenixStripeExampleWeb do
    pipe_through(:protected)
    # Add protected routes below
  end

  resources("/charges", ChargeController)

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixStripeExampleWeb do
  #   pipe_through :api
  # end
end
