class ItemTaxesController < ApplicationController
  before_action :set_item_tax, only: %i[ show edit update destroy ]

  # GET /item_taxes or /item_taxes.json
  def index
    @item_taxes = ItemTax.all
  end

  # GET /item_taxes/1 or /item_taxes/1.json
  def show
  end

  # GET /item_taxes/new
  def new
    @item_tax = ItemTax.new
  end

  # GET /item_taxes/1/edit
  def edit
  end

  # POST /item_taxes or /item_taxes.json
  def create
    @item_tax = ItemTax.new(item_tax_params)

    respond_to do |format|
      if @item_tax.save
        format.html { redirect_to @item_tax, notice: "Item tax was successfully created." }
        format.json { render :show, status: :created, location: @item_tax }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_taxes/1 or /item_taxes/1.json
  def update
    respond_to do |format|
      if @item_tax.update(item_tax_params)
        format.html { redirect_to @item_tax, notice: "Item tax was successfully updated." }
        format.json { render :show, status: :ok, location: @item_tax }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_taxes/1 or /item_taxes/1.json
  def destroy
    @item_tax.destroy
    respond_to do |format|
      format.html { redirect_to item_taxes_url, notice: "Item tax was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_tax
      @item_tax = ItemTax.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_tax_params
      params.require(:item_tax).permit(:tax_name, :tax_type, :tax, :item_id)
    end
end
