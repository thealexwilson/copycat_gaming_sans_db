class CharacterBuilderController < ApplicationController
  def index
    @attacks = Weapon::Base.descendants.each_with_object({}) do |weapon, hash|
      hash[weapon.name.demodulize] = weapon
    end
  end

  def create
    redirect_to calculated_character_builder_index_path(permitted_params)
  end

  def calculated
  end

  private

  def permitted_params
    params.permit(:char_level, :weap_type)
        .merge(params.fetch(:damage, {})
                   .permit(Cleave: [:dps, :max_dmg, :min_dmg],
                           Punch: [:dps, :max_dmg, :min_dmg],
                           Smite: [:dps, :max_dmg, :min_dmg]))
  end
end