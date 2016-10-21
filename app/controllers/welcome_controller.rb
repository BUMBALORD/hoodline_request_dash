class WelcomeController < ApplicationController
  def index
    @requests = Request.all
  end

  private

    def request_params
      params.require(:request).permit(:ip_address, dates: [])
    end
end
