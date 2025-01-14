class ProductsController < ApplicationController
  def index
    #@q = Product.ransack(params[:q]) # 検索条件を作成
    #@products = @q.result(distinct: true) || [] # 検索結果を取得
    #変更前のコード
    # @q = Product.ransack(params[:q])  # 検索条件を作成
    # @products = @q.result(distinct: true)  # 検索結果を取得
    #@products = [] if @products.nil?  # 結果がnilの場合、空の配列にする
    @products = Product.all
    #@products = @q.result(distinct: true) # 検索結果を取得
    #変更前のコード

  end

  def new
    @product = Product.new
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to root_path
  end

  def create
    @product = Product.new(product_params)

    # ファイルがアップロードされている場合に添付
    if params[:product][:file].present?
      custom_filename = "#{params[:product][:name].parameterize}.#{params[:product][:file].original_filename.split('.').last}"
      @product.file.attach(io: params[:product][:file].tempfile, filename: custom_filename)
    end

    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :explanation, :file)
  end

end

