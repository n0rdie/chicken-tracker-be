# chicken-tracker
## Setup
1. `git clone <repo_name>`
2. `cd <repo_name>`
3. `bundle install`
4. `rails db:{drop,create,migrate,seed}`

## User Stories

```
Story 1
Welcome Page

<unapplicable>
```
```
Story 2
Sign Up

When a POST User is sent with correct information
A new User is created and saved
And the new User has all the info sent with post
And the password is encrypted
```
```
Story 3
Sign Up [SAD] -- Non-unique name

When a POST User is sent with a non unique name
A new User is not created or saved
And a error is returned
```
```
Story 4
Sign Up [SAD] -- Non matching password / password confirmation

When a POST User is sent with a non matching password confirmation
A new User is not created or saved
And a error is returned
```
```
Story 5
Sign In

come back later
```
```
Story 6
Sign In [SAD] -- Wrong sign in information

come back later
```
