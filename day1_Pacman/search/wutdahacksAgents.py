import random 

from game import Agent
from game import Directions


class DumbAgent(Agent):
    "An agent that goes West until it can't"
    
    def getAction(self, state):
        "The agent always goes West"

        print "Location:", state.getPacmanPosition()
        print "Actions availabel:", state.getLegalPacmanActions()

        if Directions.WEST in state.getLegalPacmanActions():
            print "Going West"
            return Directions.WEST
        else:
            print "Stopping"
            return Directions.STOP


class RandomAgent(Agent):
    "An agent that goes random move"
    
    def getAction(self, state):
        move = [Directions.EAST, Directions.NORTH, Directions.SOUTH, Directions.WEST, Directions.STOP]
        return random.choice(move)

class BetterRandomAgent(Agent):
    "An agent that goes random move"
    
    def getAction(self, state):
        move = state.getLegalPacmanActions()
        return random.choice(move)