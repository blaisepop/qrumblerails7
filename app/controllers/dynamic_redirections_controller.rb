class DynamicRedirectionsController < ApplicationController
  before_action :set_dynamic_redirection, only: [:show, :destroy, :edit, :redirect]
  skip_before_action :authenticate_user!, only: [ :index, :new, :show, :create, :edit, :update, :destroy, :redirect]

  def index
    @entries = DynamicRedirection.all
  end

  def new
    @dynamic_redirection = DynamicRedirection.new
  end

  def show
  end

  def create
    @dynamic_redirection = DynamicRedirection.new(dynamic_redirection_params)
      if @dynamic_redirection.save
        flash[:alert] = "QR code has been created successfully"
        redirect_to dynamic_redirections_path
      else
        flash[:alert] = "QR code rejected"
        render 'new'
      end
  end

  def edit
    @qr_code = RQRCode::QRCode.new(root_url + "dynamic_redirections/" + @dynamic_redirection.key_value)
    @qr_string = root_url + "dynamic_redirections/" + @dynamic_redirection.key_value
    @svg = @qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true
    )
  end

  def update
    @dynamic_redirection = DynamicRedirection.find_by(id: params[:key_value])
    @dynamic_redirection.update(dynamic_redirection_params)
    redirect_to dynamic_redirections_path
  end

  def destroy
    @dynamic_redirection.destroy
    redirect_to redirections_path
  end

  def redirect
    puts "Redirection in progress to " + @dynamic_redirection.destination
    redirect_to @dynamic_redirection.destination
  end
  
  def dynamic_redirection_params
    params.require(:dynamic_redirection).permit(:destination, :created_by, :qr_code, :key_value)
  end

  def set_dynamic_redirection
    @dynamic_redirection = DynamicRedirection.find_by(key_value: params[:key_value])
  end
end
