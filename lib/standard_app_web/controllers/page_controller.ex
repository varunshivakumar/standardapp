defmodule StandardAppWeb.PageController do
  use StandardAppWeb, :controller

  alias StandardApp.Splash

  def home(conn, _params) do
    images = Splash.get_images()

    render(conn, :home, layout: false, images: images)
  end

  def about(conn, _params) do
    render(conn, :about, layout: {StandardAppWeb.Layouts, :app_static})
  end
end
