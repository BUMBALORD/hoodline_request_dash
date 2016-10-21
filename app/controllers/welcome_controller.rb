class WelcomeController < ApplicationController
  def index
    @requests = Request.all

    # file = File.open("#{Rails.root}/db/seed/resources.txt", 'r')
    # content = file.read
    # addresses = content.scan(/\d+\.\d+\.\d+\.\d+/)
    # dates = content.scan(/\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/)
    # matched = Hash[addresses.zip(dates)]

    # matched.each do |address, date|
    #   if Request.exists?(ip_address: address)
    #     Request.where(ip_address: address).each do |request|
    #       request[:dates] << date rescue nil
    #     end
    #   else
    #     Request.create(
    #       ip_address: address,
    #       dates: date
    #     )
    #     end
    #   end
  end

  private

    def request_params
      params.require(:request).permit(:ip_address, dates: [])
    end
end
