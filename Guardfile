guard 'bundler' do
  watch('Gemfile')
end

guard 'rack' do
  watch('Gemfile.lock')
  watch('config.ru')
  watch(%r{^(system|config)/.*})
  watch(%r{^lib/dfd/(contracts|entities|relations|repos|transactions)/.*})
  watch(%r{^lib/dfd/web/(?!.*(assets))})
end
