# chicken-tracker
## User Stories

```
Story 1
Guest Show

As a visitor
When I visit a guest's show page
I see the guest's name
And I see a list of all the rooms they've stayed in
including the room's suite, nightly rate, and the name of the hotel that it belongs to.
```

```
Story 2
Add a Guest to a Room

As a visitor
When I visit a guest's show page
Then I see a form to add a room to this guest.
When I fill in a field with the id of an existing room
And I click submit
Then I am redirected back to the guest's show page
And I see the room now listed under this guest's rooms.
(You do not have to test for a sad path, for example if the ID submitted is not an existing room)
```

```
Story 3
Rooms Index

As a visitor
When I visit the rooms index page
Then I see a list of all rooms
including the room's suite, nightly rate, and the name of the hotel that it belongs to
and the number of guests that have stayed in that room.
```
