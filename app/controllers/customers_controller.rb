# frozen_string_literal: true
class CustomersController < ProtectedController
  before_action :set_customer, only: [:update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all

    render json: @customers
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    render json: Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = current_user.customers.build(customer_params)

    if @customer.save
      render json: @customer, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    if @customer.update(customer_params)
      head :no_content
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy

    head :no_content
  end

  def set_customer
    @customer = current_user.customers.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :phone)
  end

  private :set_customer, :customer_params
end
