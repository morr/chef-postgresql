guard :rspec, cmd: "rspec --color", all_on_start: false do
  watch(%r{^spec\/(.+)_spec\.rb$})
  watch(%r{^providers\/(.+)\.rb$}) { |m| "spec/#{m[1]}_provider_spec.rb" }
  watch(%r{/^recipes\/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
  watch("spec/spec_helper.rb") { "spec" }
end

guard :rubocop, all_on_start: false, cli: ["--format", "clang", "-a"] do
  watch(/.+\.rb$/)
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end
