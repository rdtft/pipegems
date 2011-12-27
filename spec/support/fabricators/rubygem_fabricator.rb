Fabricator(:rubygem) do
  name  { sequence(:name) { |i| "gem#{i}" } }
  user! { Fabricate(:user) }
end
