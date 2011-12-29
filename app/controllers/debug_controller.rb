require 'geocoder'

class DebugController < ApplicationController
    def index
    end

    def jquery_ui_test
    end

    def geocoder
        if params[:q].nil?
            @text = ""
        else
            @text = Geocoder.search(params[:q])
        end
    end
end
