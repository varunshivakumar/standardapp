defmodule StandardAppWeb.PageController do
  use StandardAppWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
