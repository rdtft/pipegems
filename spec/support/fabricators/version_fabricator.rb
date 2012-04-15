Fabricator :version do
  name { sequence(:name) { |i| "0.1.#{i}" } }
  version_files { |version| Fabricate :version_file, :parent => version }
end
