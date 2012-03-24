Fabricator :version do
  name { sequence(:name) { |i| "0.1.#{i}" } }
end
