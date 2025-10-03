#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *


= Web Usage Data - Recommendation Systems


== Recommendation Systems
#place(top + left, dx: -2.5em)[
  #subbar([Motivation])
]
#v(1em)

- Information overload
  - Many choices available
  - “The paradox of choice” (Jam experiment, choice overload)
- Recommender system
  - Provide aid
  - Set of items + user “context” $->$ selection of items (predicted to be “good” for the user)
- What recommender systems do you know?
- What recommender systems would you like to have?



== Recommendation Systems
#place(top + left, dx: -2.5em)[
  #subbar([The Paradox of Choice])
]
#v(1em)

#figure(
  image("images/paradox_choice.png", width: 70%),
  caption: [Fuente: _Your Marketing Rules_]
)


== Recommendation Systems
#place(top + left, dx: -2.5em)[
  #subbar([Examples of Applications])
]
#v(1em)

- Movies, online videos, music.
- Books
- Software (apps)
- Products in general
- People (dating, friends)
- Services (restaurants, accommodation, ...)
- Research articles
- Jokes



== Recommendation Systems
#place(top + left, dx: -2.5em)[
  #subbar([Examples of Applications - Amazon])
]
#v(1em)

It uses item-to-item collaborative filtering recommendations on most pages of their website and e-mail campaigns.

#figure(
  image("images/AmazonRECSYS.png", width: 45%)
)



== Recommendation Systems
#place(top + left, dx: -2.5em)[
  #subbar([Examples of Applications - Netflix])
]
#v(1em)

- A data-driven company that leverages recommendation systems to boost customer satisfaction.
- The 75% of Netflix viewing is due to recommendations.
- The Netflix Prize (2009): The most accurate movie recommendation algorithm wins a prize worth \$1,000,000.



== Recommendation Systems
#place(top + left, dx: -2.5em)[
  #subbar([Examples of Applications - Spotify])
]
#v(1em)

- _"Discover Weekly"_ which is a personalized list of 30 songs based on users unique music taste.
- _"AI Dj"_ a personalized lineup of music recommendations with generative AI.
- Collaborative filtering: Filtering songs by comparing users’ historical listening data with other users’ listening history.
- Natural language processing: Scraping the Web for information about specific artists and songs.
- Audio file analysis: To analyze the audio file’s characteristics (tempo, loudness, key and time signature) to prepare the recommendations.



== Recommendation Systems
#place(top + left, dx: -2.5em)[
  #subbar([Where's the value in recommendations?])
]
#v(1em)

- Netflix: 2/3 of the movies watched
- Amazon: 35% sales
- Google news: recommendations $->$ 38% more clickthrough



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([Definition])
]
#v(1em)

#dblock(title: [Definition])[
  A recommendation system (or recommender system) is a class of machine learning that uses data to help predict, narrow down, and find what people are looking for among an exponentially growing number of options (NVIDIA).
]



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([Types])
]
#v(1em)

- Collaborative filtering: Considers the information of the user and other similar users.
- Content-based: Uses information about the object and the users past experience.
- Knowledge-based: Uses knowledge about how an object meets a need.
- Community-based: Uses information associated with the users "friends".
- Hybrid approaches: A combination of the previously mentioned approaches.



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([Functions: Provider's point of view])
]
#v(1em)

- Sell more items.
- Sell more diverse items (long tail)
- Increase user satisfaction, fidelity.
- Better understand what users want.



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([Functions: User's point of view])
]
#v(1em)

- Looking for something:
  - Find some good items.
  - Find all good items (closer to information retrieval) recommend a sequence, a bundle.
- Just browsing.
- Side-effects (collaborative filtering systems):
  - Express self.
  - Help others.
  - Influence others.



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([The Usefulness of Recommendations])
]
#v(1em)

- Implementing recommendations is non-trivial.
- Is it worthwhile? It depends $dots$
  - Is there “large” number of items?
  - Do users know exactly what are they looking for?



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([RecSys and Information Retrieval])
]
#v(1em)

#dblock(title: [Information Retrieval])[
  Is the activity of obtaining information resources relevant to an information need from a collection of information resources (Wikipedia).
]

#dblock(title: [Recommender System])[
  The goal of a Recommender System is to generate meaningful recommendations to a collection of users for items or products that might interest them (Melville, Sindhwani).
]



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([RecSys and Information Retrieval])
]
#v(1em)

- RecSys and IR closely connected (many similar or analogical techniques)
- Different goals:
  - IR – “I know what I’m looking for”
  - RecSys – “I’m not sure what I’m looking for”



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([Serendipity])
]
#v(1em)

- Unsought finding: unexpected, but useful result.
- Do not recommend items the user already knows or would find anyway, try something more interesting
- Example – books:
  - I like books by Remarque, Potok, Skacel recommending
  - Another book by Remarque not very useful.
  - Recommending Munro = Serendipity.



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([Warning: Implementing Personalized Systems is Difficult])
]
#v(1em)

- (Sometimes) complex algorithms.
- (Always) difficult debugging, testing, evaluation.
  - Personalization $->$ different behaviour for each user
  - Hard to distinguish bugs and surprising results


