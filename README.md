# Oh-No-UFO
Augmented Reality Game For The iPhone Written In Swift


## Inspiration

The inspiration for this game is similar to brick breaker. Many levels but there is replay value because of the imbedded randomness.

Modes:

Seeing how far you can get going level by level like pacman

Win level by level each unlocking the next or some mutation of that

# Proposal (04/03/2018)

## Team
I will be programming with my brother for this project and Satjit Bola (sidbola) will be acting as my code reviewer.


## Features

### Game Summary:

- An Arkit app where 3D UFOs perform different maneuvers while shooting lasers at the user. The user can Fireback and dodge the enemy lasers. Wave after wave of enemies (Mostly 3D UFOs) come until the Player takes too many hits and the game is over.

- During gameplay the Player gets points based on several factors; Time spent Playing, number of Enemy UFOs hit by player Lasers, and more.

These points can be used to buy different things:
	- Player Laser animations and styles (a spread of three red lasers for example)
	- More Lives
	- Different Enemy Types
	- More

### Must Have Features


- Gameplay 
	- Multiple Enemy types ---Hours: 10
	- Multiple Laser Types ---Hours: 5
	- Multiple Enemy animations ---Hours: 15

- Arkit ---Hours:10
	- Use of 3D Graphics (possible to use 2D graphic in Arkit)
	- Use Scenekit NOT Sprite Kit

- Connecting with Other Players ---Hours:1
	- Highscore (Game Center or AWS or Heroku)

- Connecting to Developer
	- To be determined

- Good Welcome Screen
	- 3D Graphics in small embedded Scenekits ---Hours:4
	- Arcade Mode ---Hours:5
		- Wave after wave of Enemies 
		- Play Until Enemy Lasers Contact The Hitbox Bounding The Scenekit POV
	- Buy With Points (Once Purchased added to a carousel and can be selected at any time the Player is in the Welcome Screen) ---Hours:10
		- Player Laser Selection 
		- Enemy Ship Selection
		- High score details

### Nice To Have Features 

- Gameplay ---Hours:5
	- Multiple PowerUp types
- Arkit
	- try for ability to pause and resume ---Hours:4
	- increase robustness ---Hours:4
	- Ground Enemy type ---Hours:15

- Connecting with Other Players 
	- Sharing points ---Hours:3
	- Sharing Laser types ---Hours:3

- Connecting to Developer 
	- New Wave types added over internet ---Hours:10
	- New UFO Assets available over internet  ---Hours:2
	- New Laser types available over internet ---Hours:2
	- New Power-up types over internet ---Hours:2


- Good Welcome Screen ---Hours:4
	- 3D Graphics in small embedded Scenekits
		- Use this Extensively in selection Carousels
	- Arcade Mode ---Hours:2
		- add intermittent boss wave
	- Level select mode ---Hours:5
	- Different Pre-Determined wave sequences

- Possible View Controller Breakout
	- Breakout Different Selection Views (Enemy type Selection, Player Laser Selection)


