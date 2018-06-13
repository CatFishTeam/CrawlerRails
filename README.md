# Admin
email: `admin@admin.com`

pss : `adminpass`

# Install

`bundle install`

`yarn install`

`rails db:drop db:create db:migrate db:seed`

`npm run dev`

# Flash Messages
Dans un controller :

      flash[:warning] = "Votre url n'est pas valide !"

Options possible : `info`, `warning`, `success`, `error`