# frozen_string_literal: true

# Creates a new Robot with a unique name
class Robot
  @@assigned_names = []

  attr_reader :name

  def initialize
    @name = assign_new_name
  end

  def reset
    @@assigned_names.delete(@name)
    @name = assign_new_name
  end

  private

  def assign_new_name
    name = generate_name until unique_name?(name)
    @@assigned_names << name
    name
  end

  def generate_name
    letters = ('A'..'Z').to_a.sample(2).join
    digits  = (0..9).to_a.sample(3).join
    letters + digits
  end

  def unique_name?(name)
    @@assigned_names.none?(name)
  end
end
