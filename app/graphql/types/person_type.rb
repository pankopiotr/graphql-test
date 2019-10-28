module Types
  class Person
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :height, Integer
    field :weight, Integer
    field :hair_color, String
    field :eye_color, String
    field :iq, Integer
    field :phones, [Phone]
  end
end
