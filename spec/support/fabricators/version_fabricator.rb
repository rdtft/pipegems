Fabricator :version do
  name { sequence(:name) { |i| "v0.1.#{i}" } }
end
