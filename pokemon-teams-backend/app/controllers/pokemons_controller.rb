class PokemonsController < ApplicationController
    def index 
        pokemon = Pokemon.all 
        render json:pokemon, only: [:id, :nickname, :species, :trainer_id]
    end

    def show
        pokemon = Pokemon.find_by(id: params[:id])
        render json:pokemon, only: [:id, :nickname, :species, :trainer_id]
    end

    def create
        name = Faker::Name.first_name
        species = Faker::Games::Pokemon.name
        render json: Pokemon.create(nickname: name, species: species, trainer_id: params[:trainer_id])
    end

    def destroy 
        pokemon = Pokemon.find_by(id: params[:id])
        pokemon.destroy()
        render json: pokemon
    end
end
