# search.py
# ---------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
# 
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


"""
In search.py, you will implement generic search algorithms which are called by
Pacman agents (in searchAgents.py).
"""

import util

class SearchProblem:
    """
    This class outlines the structure of a search problem, but doesn't implement
    any of the methods (in object-oriented terminology: an abstract class).

    You do not need to change anything in this class, ever.
    """

    def getStartState(self):
        """
        Returns the start state for the search problem.
        """
        util.raiseNotDefined()

    def isGoalState(self, state):
        """
          state: Search state

        Returns True if and only if the state is a valid goal state.
        """
        util.raiseNotDefined()

    def getSuccessors(self, state):
        """
          state: Search state

        For a given state, this should return a list of triples, (successor,
        action, stepCost), where 'successor' is a successor to the current
        state, 'action' is the action required to get there, and 'stepCost' is
        the incremental cost of expanding to that successor.
        """
        util.raiseNotDefined()

    def getCostOfActions(self, actions):
        """
         actions: A list of actions to take

        This method returns the total cost of a particular sequence of actions.
        The sequence must be composed of legal moves.
        """
        util.raiseNotDefined()


def tinyMazeSearch(problem):
    """
    Returns a sequence of moves that solves tinyMaze.  For any other maze, the
    sequence of moves will be incorrect, so only use this for tinyMaze.
    """
    from game import Directions
    s = Directions.SOUTH
    w = Directions.WEST
    return  [s, s, w, s, w, w, s, w]

def depthFirstSearch(problem):
    """
    Search the deepest nodes in the search tree first.

    Your search algorithm needs to return a list of actions that reaches the
    goal. Make sure to implement a graph search algorithm.
    """
    "*** YOUR CODE HERE ***"
    from game import Directions
    from util import Stack

    trace = {}
    trace[problem.getStartState()] = (-1, -1)
    marked = {}
    s = Stack()
    s.push(problem.getStartState())

    while not s.isEmpty():
        state = s.pop()
       
        if problem.isGoalState(state):
            path = []
            while (state != problem.getStartState()):
                direct = trace[state][1]
                if direct == 'West':
                    path.append(Directions.WEST)
                elif direct == 'South':
                    path.append(Directions.SOUTH)
                elif direct == 'North':
                    path.append(Directions.NORTH)
                elif direct == 'East':
                    path.append(Directions.EAST)
                state = trace[state][0]

            path.reverse()
            print(path)
            return path

        if state in marked:
            continue
        marked[state] = 1

        for next_state, direct, _ in problem.getSuccessors(state):
            if next_state in marked:
                continue
            trace[next_state] = [state, direct]
            s.push(next_state)

    return []

def breadthFirstSearch(problem):
    """Search the shallowest nodes in the search tree first."""
    "*** YOUR CODE HERE ***"
    from game import Directions
    from util import Queue
    
    trace = {}
    trace[problem.getStartState()] = (-1, -1)
    q = Queue()
    q.push(problem.getStartState())
    
    while not q.isEmpty():
        state = q.pop()

        if problem.isGoalState(state):
            path = []
            while (state != problem.getStartState()):
                direct = trace[state][1]
                if direct == 'West':
                    path.append(Directions.WEST)
                elif direct == 'South':
                    path.append(Directions.SOUTH)
                elif direct == 'North':
                    path.append(Directions.NORTH)
                elif direct == 'East':
                    path.append(Directions.EAST)
                state = trace[state][0]

            path.reverse()
            print(path)
            return path

        for next_state, direct, _ in problem.getSuccessors(state):
            if next_state in trace:
                continue
            trace[next_state] = [state, direct]
            q.push(next_state)
            
    return []

def uniformCostSearch(problem):
    """Search the node of least total cost first."""
    "*** YOUR CODE HERE ***"
    util.raiseNotDefined()

def nullHeuristic(state, problem=None):
    """
    A heuristic function estimates the cost from the current state to the nearest
    goal in the provided SearchProblem.  This heuristic is trivial.
    """
    return 0

def aStarSearch(problem, heuristic=nullHeuristic):
    """Search the node that has the lowest combined cost and heuristic first."""
    "*** YOUR CODE HERE ***"
    util.raiseNotDefined()


# Abbreviations
bfs = breadthFirstSearch
dfs = depthFirstSearch
astar = aStarSearch
ucs = uniformCostSearch
