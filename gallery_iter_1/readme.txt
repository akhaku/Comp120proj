Seeing a collection by artist, location, or donor

Url: localhost:3000/category/[type]/?value=[key]

Example:
http://localhost:3000/category/artist/?value=Friedlander,%20Lee

Not all pictures will appear (we do use the assumption that the files are all with the '.jpg' extension, but do not have those pictures in this project).

The artist name is a query parameter rather than part of the URL because the vast majority of artists, locations, and donors have spaces and other special characters.

The images are not included because a) they won't be in the final application, and b) there's a lot of them, and we all have access to them elsewhere. To get images working, dump them in /public/images in the rails app.