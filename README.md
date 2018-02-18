# README

### Purpose of the Web Application

**The Vinyl Countdown** is a vinyl record management system, inspired by Discogs.com. Users can browse vinyls and add them to their collections, of which they can have multiple. Users can also rate or add comments to the vinyl records in their collections. Users can also add add vinyls and artists that don't yet exist in the web application database. For simplicity's sake, this web app assumes that there can be only one release for any album name + artist combination, though of course in reality there may be many different versions and releases of the same record by the same artist.

### Getting Started

1. Download a ZIP of this repository.  Unzip the contents.
2. In your Terminal or Command Prompt, `cd` to the application's root directory.
3. `bundle install`
4. `rails db:migrate db:seed` 
6. `rails server`.  Puma should start up on port 3000.
7. Browse to `localhost:3000`.

### Models
* User
* Vinyl
* Artist
* Collection
* CollectionRecord (join table of Collection and Vinyl)
* Rating