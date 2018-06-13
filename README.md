# Install

`bundle install`

`yarn install`

`./bin/webpack-dev-server`

`bin/rails db:migrate`

# Flash Messages
Dans un controller :

      flash[:warning] = "Votre url n'est pas valide !"

Options possible : `info`, `warning`, `success`, `error`