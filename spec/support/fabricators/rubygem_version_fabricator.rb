Fabricator(:rubygem_version) do
  version  { sequence(:version, 111) }
  rubygem! { Fabricate(:rubygem) }
end
