Monroe::Application.config.assets.paths.push Rails.root.join("vendor", "assets", "stylesheets", "default-theme").to_s
puts Monroe::Application.config.assets.paths
    