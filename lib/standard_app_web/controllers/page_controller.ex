defmodule StandardAppWeb.PageController do
  use StandardAppWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end

  def about(conn, _params) do
    render(conn, :about, layout: {StandardAppWeb.Layouts, :app_static})
  end
end
