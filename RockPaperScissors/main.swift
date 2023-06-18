//
//  main.swift
//  RockPaperScissors
//
//  Created by Seher Köse on 19.06.2023.
//


import Foundation

    enum RPS: String {
        case rock = "✊"
        case paper = "✋"
        case scissors = "✌️"
    }

    class Game {
        private var playerScore = 0
        private var computerScore = 0

        func start() {
            print("Please select an emoji:")

            while playerScore < 3 && computerScore < 3 {
                let playerChoice = getPlayerChoice()
                let computerChoice = getComputerChoice()

                print("You: \(playerChoice.rawValue) - Computer: \(computerChoice.rawValue)")

                let result = getResult(playerChoice, computerChoice)
                updateScores(result)

                print(result)
                print("Final Score -> You: \(playerScore), Computer: \(computerScore)\n")
            }

            print("Game over!")
            if playerScore > computerScore {
                print("You won!")
            } else {
                print("Computer won!")
            }
        }

        private func getPlayerChoice() -> RPS {
            while true {
                if let input = readLine()?.lowercased(), let choice = RPS(rawValue: input) {
                    return choice
                }
                print("Invalid login. Please select an emoji: ")
            }
        }

        private func getComputerChoice() -> RPS {
            let choices: [RPS] = [.rock, .paper, .scissors]
            let randomIndex = Int.random(in: 0..<choices.count)
            return choices[randomIndex]
        }

        private func getResult(_ playerChoice: RPS, _ computerChoice: RPS) -> String {
            if playerChoice == computerChoice {
                return "Scoreless!"
            } else if (playerChoice == .rock && computerChoice == .scissors) ||
                      (playerChoice == .paper && computerChoice == .rock) ||
                      (playerChoice == .scissors && computerChoice == .paper) {
                return "You won!"
            } else {
                return "Computer won!"
            }
        }

        private func updateScores(_ result: String) {
            if result.contains("You won!") {
                playerScore += 1
            } else if result.contains("Computer won!") {
                computerScore += 1
            }
        }
    }

        let game = Game()
        game.start()


