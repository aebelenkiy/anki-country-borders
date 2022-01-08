# Anki Country Borders

Anki deck for memorizing country borders. For the gold standard of geography flashcards, use [Ultimate Geography](https://github.com/anki-geo/ultimate-geography) instead.

For memorizing the actual location of countries, the standard [Ultimate Geography](https://github.com/anki-geo/ultimate-geography) (UG) deck has a "Map - Country" card type. It's possible to become completely fluent with naming a country when it's shown on a world map but still being unable to *visualize* the location of the country when a map is not available as a reference. 

For example, someone who has studied the UG deck would be able to see the map below and easily determine the highlighted country.

![Burkina Faso](Country_Borders\media\ug-map-burkina_faso.png)

One's process might look like this:
1. The country is landlocked.
1. Landlocked countries in that part of West Africa are Mali, Niger, and Burkina Faso.
1. Niger shares a border with Nigeria, which is coastal.
1. Mali is the one with the weird shape.
1. So the highlighted country is...Burkina Faso.

From there, one could figure out the not-yet-identified surrounding countries:
1. Benin looks like a key and Togo is the sliver right next to it. 
1. Ghana is sandwiched between Ivory Coast and Togo.
1. etc...

The same user could be asked to *imagine* Turkmenistan. Without a visual reference, it may be difficult to start piecing together the map. The Extended Edition of UG attempts to solve this problem by adding the "Country - Map" card type: the front of the card is the name of the country and the back of the card is used to confirm that it was visualized correctly. 

The problem is that "accurate visualization" is subjective in the absence of a photographic memory. This deck attempts to solve that problem by providing a concrete "correct answer" when presented with the country name. In the case of Turkmenistan, the user will go through the exercise of building a mental map by having to provide the following list: Kazakhstan, Uzbekistan, Afghanistan, Iran. The back of the card will show the list *and* map to build the association.

![Turkmenistan](Country_Borders\media\ug-map-turkmenistan.png)

The intention of this project to to allow the user to anchor to a repeatable fact when building a mental map.

## Data

The original data source was [geodatasource/country-borders](https://github.com/geodatasource/country-borders). I massaged the data in Postgres and created an array that I was displaying as a list using JS in the card template. I couldn't get the JS to work on Anki Desktop so I gave up. There's probably a reason the best Anki decks don't use JS. 

I switched to this [Geonames data](http://download.geonames.org/export/dump/countryInfo.txt) instead and am now displaying the border countries as a comma-separated string. I pulled in the UG [country list](https://github.com/anki-geo/ultimate-geography/blob/master/src/data/main.csv) so the names in the new data source can be standardized against the UG deck. I added an identity INT to the UG table which I added as a foreign key on the Geonames table to normalize the data.

## Future Work

This deck is now a viable product but I have some enhancements in mind.

The DB objects will be tracked in GitHub as soon as I figure out how to use Liquibase. Building a DB for this is entirely overengineering but I had never used Postgres before so I wanted to play around with it. I'll also build functions to generate the table that will be used in the CSV import on the fly. Because the data is dynamic, a change in a country name, for example, will be applied to every array where that country is a border country.

Not all UG countries existed in the Geonames data. I want to aggregate border info for each UG country record (e.g. England, Transnistria). In addition, I'll add oceans/seas from this [list of political and geographic borders](https://en.wikipedia.org/wiki/List_of_political_and_geographic_borders#Countries). This will allow the inclusion of islands into the deck. The marine borders will be a different note field than country borders.

Just like the UG deck has fields for additional information (e.g. flag similarities), I'll add a note field specific to borders. A note can indicate that only borders for Metropolitan France are listed despite Brazil, Suriname, etc. also technically being borders. Perhaps a separate note field for marine borders would also be useful.

I'm considering adding a sort order to the array of border countries. Instead of having the list in an arbitrary order, I think it would make sense to start in the north and go clockwise.

Lastly, I would eventually like to format this project as a seamless extension to the UG deck. 

