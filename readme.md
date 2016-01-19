ClubHub
=======
ClubHub is an app to manage small clubs. Users can create clubs, schedule meetings and invite/add members.
 
ClubHub is a 2 model ruby on rails App deployed on Heroku, it uses Devise for user authentication and a PostGres database to store user inputed data.

Technologies Used:
----------------
* Ruby
* Rails
* Git/github
* Heroku (Deployment)
* Devise (User Authentication)
* PostGres

Goals:
-----
**Bronze**
Users are connected to clubs thru memberships (Join Table) clubs have meetings (complete)

**Silver**
Implement Themes: users create themes which can be assigned to meetings and viewed on an index page which can be sorted by used or not.

**Gold**
Users can be in more than one club, themes are attached to user's and to clubs

Things to do:
-------------
1. set up carrierwave so that images are uploaded to site vs using URLs
2. change membership add/delete system to be more user friendly... checkboxes or search as opposed to dropdown menu
3. play with dif form entries... date/time/check box..
4. change format of date displayed
5. css stuff:  
  a) something so that flash notices are displayed better  
  b) change meeting show page  
  c) change club show page  
  d) images distortion fix
6. add first and last name fields to user model
7. make host a user field
8. make sure images don't get distorted
9. membership auth...cancancan
