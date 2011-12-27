Fabricator(:rubygem_file) do
  file 'foobar'
  rubygem_version! { Fabricate(:rubygem_version) }
end
