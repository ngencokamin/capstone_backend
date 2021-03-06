# It's Over, Isn't It? (Backend)
## Introduction
**It's Over, Isn't It?** is a web app that allows users to find shows similar to ones they’ve previously enjoyed. The site is built with a Ruby on Rails backend and VueJS frontend with OMDB api integration. Users can go to the page of a show they enjoyed and make suggestions, rated on both enjoyability and similarity to the original show. Suggestions will also include a brief description of what the users liked and didn’t like in the suggested show. Suggestions can then be voted down or up depending on if other users liked the suggestion. OMBD integration allows for new shows to be added to the database quickly and accurately as needed. 


## Backend Features
- Integration with OMDb API to provide show data
- User can update their profile, including bio and profile picture
- User can create a comment and link to suggested media entry in database
- User can rate a show on enjoyability and similarity
- User can vote on other users' suggestions

## Screenshots

<figure style="width: 80%;">
  <figcaption align="center"><b>Media Index Response</b></figcaption>
  <img src="Screenshots/MediaIndex.png"
  alt="Media index response." >
</figure>

<figure style="width: 80%;">
<figcaption align="center"><b>Media Show with Comments Response</b></figcaption>
  <img src="Screenshots/MediaShow.png"
  alt="Media show response with comments.">
</figure>



	
## Models

- **User**
	+ Contains username, email, profile picture, bio, and password digest.
- **Comment**
	+ Contains comment text, similarity and enjoyability ratings, ID of media being commented on, ID of the user who created the comment, and ID of suggested media.
- **Media**
	+ Contains IMDb ID of media, title, IMDb rating, release date, content rating, plot summary, and link to promotional image.
- **Vote**
	+ Contains ID of the user who cast the vote, ID of the comment being voted on, and a vote value from -1 to 1.

## Backend Restful Actions
Action | Users | Comments | Media | Votes
-------|------|----------|--------|-------
**Index**| No | No | Yes | No
**Create**| Yes (Signing up) | Yes (Comments on specific media) | Yes (Using media's IMDb ID with OMDb) | yes
**Show** | Yes (Profile page with user comments) | No | Yes (Returns information about selected media, as well as comments and comment votes) | No
**Update** | Yes (With authorization) | Yes (With authorization) | No | Yes (Only value)
**Destroy** | Yes (With authorization)| Yes (With authorization)| No | No
