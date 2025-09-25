Mã nguồn Pac-Man được phát triển bởi John DeNero và Dan Klein tại Đại học UC Berkeley cho lớp học CS188 – Trí tuệ nhân tạo

# Prerequisite
python 2.7

# Play
```
python2 pacman.py 
```

# Custom
Do not touch these files!
- ```util.py```: Các data structures support cài đặt giải thuật tìm kiếm
- ```pacman.py```: main file to run the game
- ```game.py```: Logics in Pac-Man world. This file mô tả about AgentState, Agent, Direction, and Grid

```
python2 pacman.py --layout testMaze
python2 pacman.py --layout tinyMaze
python2 pacman.py --layout tinyMaze --zoom 2
python2 pacman.py --layout bigMaze --zoom 0.5
python2 pacman.py --layout tinyMaze --pacman SearchAgent -a fn=tinyMazeSearch
```

## wutdahack's Agent
```
python2 pacman.py --layout tinyMaze --pacman DumbAgent
python2 pacman.py --layout tinyMaze --pacman RandomAgent
python2 pacman.py --layout tinyMaze --pacman BetterRandomAgent

python2 pacman.py --layout tinyMaze --pacman SearchAgent -a fn=dfs
python2 pacman.py --layout tinyMaze --pacman SearchAgent -a fn=bfs
python2 pacman.py --layout mediumMaze --pacman SearchAgent -a fn=dfs
python2 pacman.py --layout mediumMaze --pacman SearchAgent -a fn=bfs
python2 pacman.py --layout bigMaze --pacman SearchAgent -a fn=dfs
python2 pacman.py --layout bigMaze --pacman SearchAgent -a fn=bfs
```