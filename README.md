

## Getting started

L'application est host sur heroku à : https://fathomless-falls-26337.herokuapp.com/

C'est une application produite lors de la mise à niveau en Ruby on Rails.
Quelques liens sont brisés et le bootstrap est élémentaire, mais c'est plus pour le back-end que c'est intéressant.

Le développement s'est fait avec une pensée Test Driven Dev, ce qui permet d'assurer une qualité même lorsqu'on change le code.
Cette application accepte la création/destruction de compte.
Les mot de passes sont hashed, les utilisateurs peuvent un/follow.
Le systéme de confirmation, reset par email utilise sendgrid.

Pour les images c'est un bucket AWS qui permet de soutenir le upload des images des utilisateurs.
La solution peut monter pour quelques centaines voir mille utilisateur sans optimisation réelle.


# Ruby on Rails Tutorial sample application

This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial](http://railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.
