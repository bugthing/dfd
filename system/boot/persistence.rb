Dfd::Application.boot(:persistence) do |app|
  start do
    config = app["db.config"]
    config.auto_registration(app.root + "lib/dfd")

    register("container", ROM.container(app["db.config"]))
  end
end
