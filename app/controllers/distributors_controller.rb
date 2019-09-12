class DistributorsController < ApplicationController

    def new
        @distributor = Distributor.new
    end

    def create
        @distributor = Distributor.new(distributor_params)
        if @distributor.save
            redirect_to distributor_path(@distributor)
        else
            render 'new'
        end
    end
end
