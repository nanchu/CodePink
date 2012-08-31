FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :location do
    city "City1"
    province "Province1"
    information "example info"
  end

  factory :drone_attack do
    incident_year "2001"
    al_qaida_min "1"
    al_qaida_max "2"
    taliban_min "3"
    taliban_max "3"
    civilians_min "1"
    civilians_max "1"
    forigeners_min "0"
    forigeners_max "2"
  end

  factory :location_group do
    name "name1"
    xcoordinate "1"
    ycoordinate "1"
  end

  factory :publisher do
    name "name1"
  end
end