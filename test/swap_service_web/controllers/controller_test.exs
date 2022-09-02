defmodule SwapServiceWeb.ControllerTest do
  use SwapServiceWeb.ConnCase

  @create_attrs %{
    "user" => "octocat",
    "repository" => "Hello-World"
  }

  @invalid_attrs %{
    "user" => "",
    "repository" => ""
  }

  describe "create repository" do

    test "creates repository when data is valid", %{conn: conn} do
      conn = post(conn, Routes.swap_service_path(conn, :create), @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)
    end

    test "renders repository when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.swap_service_path(conn, :create), @invalid_attrs)
      assert json_response(conn, 404)
    end
  end
end
