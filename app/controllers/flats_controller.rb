class FlatsController < ApplicationController
    def index
        @flats = Flat.all
      end

      def show
        @flat = Flat.find(params[:id])
      end

      def new #render the form
        @flat = Flat.new
      end

      def create #save the form data
        #@article = Article.new(title: "...", body: "...")
        @flat = Flat.new(flat_params) #more secure than above with a hash

        if @flat.save
          redirect_to @flat
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit
        @flat = Flat.find(params[:id])
      end

      def update
        @flat = Flat.find(params[:id])

        if @flat.update(flat_params)
          redirect_to @flat
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @flat = Flat.find(params[:id])
        @flat.destroy

        redirect_to root_path, status: :see_other
      end

      private
        def flat_params
          params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
        end
end
