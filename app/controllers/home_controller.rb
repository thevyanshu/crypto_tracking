require 'json'
class HomeController < ApplicationController
    before_action :set_coins
    def index
        coins = @coins
        respond_to do |format|
            format.html
            format.json {render json: @coins, status: :ok}
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_coins
            url = "https://api.wazirx.com/api/v2/tickers"
            response = RestClient.get(url)
            value = JSON.parse(response.body).with_indifferent_access
            keys = value.keys
            count = keys.length
            @coins = []
            keys.each do |key|
                @coins.push({label: key, name: value[key]["name"], last: value[key]["last"], low: value[key]["low"], high: value[key]["high"], buy: value[key]["buy"], sell: value[key]["sell"], volume: value[key]["volume"]})   
            end
        end
end
