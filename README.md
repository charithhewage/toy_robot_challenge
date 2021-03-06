# Toy Robot Simulator
 
## Description
- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.

Create an application that can read in commands of the following form

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

* PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
* The origin (0,0) can be considered to be the SOUTH WEST most corner.
* The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.
* MOVE will move the toy robot one unit forward in the direction it is currently facing.
* LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
* REPORT will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.
* Any move that would cause the robot to fall off the edge of the board or collide with another robot
must be ignored.
* A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.
* Input can be from a file, or from standard input, as the developer chooses.
* Provide test data to exercise the application.

## Constraints
 
The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.
 

## How to run the Toy Robot

This project is written in Ruby programing language. You can simply clone this project to your development computer and run with your own commands. I recommend, you should have installed Ruby 2.2.2 or higher version in your computer. If you have already installed Ruby in your computer, Use the following command to check the version.

```
$ ruby -v
```

If you don’t have installed Ruby in your computer, see [these instructions](https://www.ruby-lang.org/en/documentation/installation/) on ruby-lang.org

### Clone the project
```
$ git clone git@github.com:charithhewage/toy_robot_challenge.git
$ cd ~/toy_robot_challenge
```


### Install gem dependencies
```
$ bundle install
```

### Run unit & integration tests
```
$ bundle exec rspec
```

### Run robot application
```
$ ruby ./bin/toy_robot.rb [instructions.txt]
```
with sample data files
```
$ ruby ./bin/toy_robot.rb ./bin/sample_data_1.txt
$ ruby ./bin/toy_robot.rb ./bin/sample_data_2.txt
$ ruby ./bin/toy_robot.rb ./bin/sample_data_3.txt
```


## Example Input and Output

## Examples

**Example 1**
```
PLACE 0,0,NORTH
MOVE
REPORT
```
**Expected Output**
```
0,1,NORTH
```

**Example 2**
```
PLACE 0,0,NORTH
LEFT
REPORT
```
**Expected Output**
```
0,0,WEST
```

**Example 3**
```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
```
**Expected Output**
```
3,3,NORTH
```