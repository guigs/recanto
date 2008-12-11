require 'test_helper'

class VendasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create venda" do
    assert_difference('Venda.count') do
      post :create, :venda => { }
    end

    assert_redirected_to venda_path(assigns(:venda))
  end

  test "should show venda" do
    get :show, :id => vendas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => vendas(:one).id
    assert_response :success
  end

  test "should update venda" do
    put :update, :id => vendas(:one).id, :venda => { }
    assert_redirected_to venda_path(assigns(:venda))
  end

  test "should destroy venda" do
    assert_difference('Venda.count', -1) do
      delete :destroy, :id => vendas(:one).id
    end

    assert_redirected_to vendas_path
  end
end
