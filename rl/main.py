import numpy as np
import matplotlib.pyplot as plt

maze = np.array([
    [0, 0, 0, 0, 0],
    [0, 1, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [1, 0, 0, 0, 0],
    [0, 0, 1, 0, 0]
])
start = (0, 0)
goal  = (4, 4)
max_steps = 100
episodes = 200

q_table = np.zeros((maze.shape[0]*maze.shape[1], 4))
learning_rate = 0.1
gamma = 0.9
epsilon = 0.1

def state_to_index(state):
    return state[0]*maze.shape[1] + state[1]

def step(state, action):
    x, y = state
    if action == 0:
        next_x, next_y = x-1, y
    elif action == 1:
        next_x, next_y = x+1, y
    elif action == 2:
        next_x, next_y = x, y-1
    else:
        next_x, next_y = x, y+1

    if (next_x < 0 or next_x >= maze.shape[0] or next_y < 0 or next_y >= maze.shape[1] or maze[next_x, next_y] == 1):
        return state, -5
    
    next_state = (next_x, next_y)
    if next_state == goal:
        reward = 10
    else:
        reward = -1
    
    return next_state, reward

def get_action(state):
    if np.random.rand() < epsilon:
        action = np.random.randint(4)
    else:
        action = np.argmax(q_table[state_to_index(state)])

    return action

def learn(state, action, next_state, reward):
    q_value = q_table[state_to_index(state), action]
    next_max = np.max(q_table[state_to_index(next_state)])
    q_table[state_to_index(state), action] = q_value + learning_rate*(reward + gamma*next_max - q_value)

### Train
total_rewards = []
for _ in range(episodes):
    state = start
    total_reward = 0

    for _ in range(max_steps):
        action = get_action(state)
        next_state, reward = step(state, action)

        learn(state, action, next_state, reward)

        state = next_state
        total_reward += reward
        if state == goal:
            break

    total_rewards.append(total_reward)

# Test
state = start
maze[start] = 7
step_counter = 0
while state != goal and step_counter < max_steps:
    action = np.argmax(q_table[state_to_index(state)])
    state, _ = step(state, action)
    step_counter += 1
    maze[state] = 7

print(maze)

# Plot
plt.figure(figsize=(10, 5))
plt.title("Learning Progress of Q-Learning")
plt.xlabel("episode")
plt.ylabel("reward")
plt.grid(True)
plt.plot(total_rewards)
plt.savefig("plot.png")