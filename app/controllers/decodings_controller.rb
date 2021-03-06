class DecodingsController < ApplicationController
  before_action :set_decoding, only: [:destroy]

  # GET /decodings
  # GET /decodings.json
  def index
    @decodings = Decoding.all
  end

  # POST /decodings
  # POST /decodings.json
  def create
    @decoding = Decoding.new(decoding_params)
    respond_to do |format|
      if @decoding.save
        format.json { render json: @decoding }
      else
        format.json { render json: @decoding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decodings/1
  # DELETE /decodings/1.json
  def destroy
    @decoding.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decoding
      @decoding = Decoding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def decoding_params
      params.require(:decoding).permit(:plain, :encoded)
    end
end
