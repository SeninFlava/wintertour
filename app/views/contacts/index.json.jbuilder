json.array!(@contacts) do |contact|
  
  json.extract! contact, :id, :row_num, :name_en, :name_ru, :description_en, :description_ru, :phone, :email, :avatar_url

  json.url contact_url(contact, format: :json)
end
