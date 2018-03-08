# README

##[The Vinyl Countdown](https://the-vinyl-countdown.herokuapp.com)

### Purpose of the Web Application

**The Vinyl Countdown** is a vinyl record management system, inspired by [Discogs.com](discogs.com). Anyone can browse existing vinyls in the database, but users who register can add additional vinyls and artists to the database. Users can also create collections and add vinyls to them. For simplicity's sake, this web app assumes that there can be only one release for any album name + artist combination, though of course in reality there may be many different versions and releases of the same record by the same artist.

In the future, I hope to add a functionality for users to rate or add comments to the vinyl records in their collections.

### Getting Started

1. Download a ZIP of this repository.  Unzip the contents.
2. In your Terminal or Command Prompt, `cd` to the application's root directory.
3. `bundle install --without production`
4. `rails db:migrate db:seed` 
6. `rails server`.  Puma should start up on port 3000.
7. Browse to `localhost:3000`.

### Models Used by the Web Application
* User
* Session
* Vinyl
* Artist
* Collection
* CollectionRecord (join table of Collection and Vinyl)