![](https://img.shields.io/badge/Microverse-blueviolet)
# Tic Tac Toe

This is project requires the development of a Tic Tac Toe game in ruby. 

The tic-tac-toe game can be played by two humans on the command line. The tic-tac-toe board is a 3 X 3 grid and players alternate turns until one player is victorious or the game ends in a draw. Players win by securing three consecutive positions on a row, column, or diagonal. The game ends in a tie if neither player has won and all positions on the board are taken.
if you want to learn more please visit this [Link](https://www.wikihow.com/Play-Tic-Tac-Toe#:~:text=%20Playing%20Tic-Tac-Toe%20%201%20Draw%20the%20board.,second%20player%20should%20put%20down%20his...%20More%20)

## Getting Started
* Download or clone the repository
* Navigate to project Directory
* Allow `bin/main.rb ` to be executable by running this command `chmod 755 bin/main.rb`
* If you have ruby installed in your system,  just open the terminal and run `bin/main.rb`.

## Play instructions
* For the first time, you must see the following message
```
    '********************************************************'
    '*                                                      *'
    '*            Welcome to Tic Tac Toe                    *'
    '*                                                      *'
    '********************************************************'
    '*                                                      *'
    '*            (1) Start                                 *'
    '*            (2) Exit                                  *'
    '*                                                      *'
    '********************************************************'
     Please Enter the number to continue: 1
```
to continue enter 1 or 2 to exit and then hit enter.
* Next step, the game will ask you to insert the players
```
 Please Enter the name of the first player: Eric
 Please Enter the name of the second player: Tendai
``` 
* Then, you will start playing
```
     1 | 2 | 3
    ---|---|--- 
     4 | 5 | 6 
    ---|---|--- 
     7 | 8 | 9

 Eric, Please Enter the number : 2
```

```
     1 | 2 | 3
    ---|---|--- 
     4 | X | 6 
    ---|---|--- 
     7 | 8 | 9

 Tendai, Please Enter the number : 1
```

```
     O | 2 | 3
    ---|---|--- 
     4 | X | 6 
    ---|---|--- 
     7 | 8 | 9

 Eric, Please Enter the number :
```
And so on, until one of them wins the game.
* If one the player wins, the game will display win message and ask to restart the game or exit
```
     '********************************************************'
     '*                                                      *'
     "*               * CONGRATULATIONS *                    *"
     "*                 Tendai YOU WON!                      *"
     '*                                                      *'
     '********************************************************'
     '*********************************************************'
     '*     Would you like to play another round?             *'
     '*                (yes) Continue                         *'
     '*                (No)  Exit                             *'
     '*********************************************************'
     Please enter the choice: 
```
* If the game end in a draw, the system will display a draw message and ask to restart or exist
```
     '*********************************************************'
     '*                 YOU BOTH TRIED                        *'
     '*********************************************************'
     '*********************************************************'
     '*     Would you like to play another round?             *'
     '*                (yes) Continue                         *'
     '*                (No)  Exit                             *'
     '*********************************************************'
     Please enter the choice: 
```
## Live Demo
* You can access the live demo [Here](https://repl.it/@rukundoeric/tic-tac-toe)
## Built With
* Ruby
* Rubocop

## Authors

👤 **Tendai Nyandorol**

- GitHub: [@Tendai Nyandoro](https://github.com/tnyandoro)
- Twitter: [@tendai28](https://twitter.com/tendai28)
- LinkedIn: [Tendai Nyandoro](https://www.linkedin.com/in/tendai-nyandoro-a8060826/)

👤 **Rukundo Eric**

- GitHub: [@rukundoeric](https://github.com/rukundoeric)
- Twitter: [@rukundoeric005](https://twitter.com/rukundoeric005)
- LinkedIn: [Rukundo Eric](https://www.linkedin.com/in/rukundo-eric-000bba181/)



## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/tnyandoro/tic-tac-toe/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./LICENSE) licensed.
