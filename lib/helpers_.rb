include Nanoc::Helpers::Rendering
include Nanoc::Sprockets::Helper

Nanoc::Sprockets::Helper.configure do |config|
  config.environment = ::Sprockets::Environment.new(File.expand_path('.')) do |env|
    # load defaults paths
    Nanoc::Sprockets::Helper::DEFAULT_PATHS.each { |path| env.append_path path }
    # load extra paths
    env.append_path 'bower'
  end
end