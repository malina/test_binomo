require 'fileutils'
require 'uglifier'

guard :haml, input: 'app/assets/templates', output: 'public/views', run_at_start: true do
  watch /^*+\/[^_]\w*(\.html\.haml)$/
end

guard :slim, input: 'app/assets/templates', output: 'public/views', run_at_start: true do
  watch /^*+\/[^_]\w*(\.html\.slim)$/
end
