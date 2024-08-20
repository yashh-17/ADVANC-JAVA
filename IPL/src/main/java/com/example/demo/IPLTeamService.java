package com.example.demo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.ArrayList;

public class IPLTeamService {
    private Map<String, List<Player>> iplTeams = new HashMap<>();
    private Scanner scanner = new Scanner(System.in);

    public Map<String, List<Player>> getIplTeams() {
        return iplTeams;
    }

    public void setIplTeams(Map<String, List<Player>> iplTeams) {
        this.iplTeams = iplTeams;
    }

    public void addIPLTeam(String teamName, List<Player> players) {
        iplTeams.put(teamName, players);
    }

    public void updateIPLTeam(String teamName, List<Player> updatedPlayers) {
        iplTeams.put(teamName, updatedPlayers);
    }

    public void deleteIPLTeam(String teamName) {
        iplTeams.remove(teamName);
    }

    public List<Player> getPlayersOfTeam(String teamName) {
        return iplTeams.get(teamName);
    }

    public void displayAllIPLTeams() {
        System.out.println("IPL Teams and Players:");
        for (Map.Entry<String, List<Player>> entry : iplTeams.entrySet()) {
            System.out.println("Team: " + entry.getKey());
            System.out.println("Players: " + entry.getValue());
        }
    }

    public void runMenu() {
        boolean exit = false;
        while (!exit) {
            System.out.println("\nMenu:");
            System.out.println("1. Add IPL Team");
            System.out.println("2. Update IPL Team");
            System.out.println("3. Delete IPL Team");
            System.out.println("4. Display All IPL Teams");
            System.out.println("5. Exit");
            System.out.print("Enter your choice: ");

            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    addIPLTeamFromInput();
                    break;
                case 2:
                    updateIPLTeamFromInput();
                    break;
                case 3:
                    deleteIPLTeamFromInput();
                    break;
                case 4:
                    displayAllIPLTeams();
                    break;
                case 5:
                    exit = true;
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
                    break;
            }
        }
    }

    private void addIPLTeamFromInput() {
        System.out.print("Enter IPL team name: ");
        String teamName = scanner.next();
        List<Player> players = new ArrayList<>();
        System.out.print("Enter number of players: ");
        int numPlayers = scanner.nextInt();
        scanner.nextLine(); // Consume newline
        for (int i = 0; i < numPlayers; i++) {
            System.out.print("Enter player " + (i + 1) + " name: ");
            String playerName = scanner.nextLine();
            System.out.print("Enter player " + (i + 1) + " age: ");
            int playerAge = scanner.nextInt();
            scanner.nextLine(); // Consume newline
            players.add(new Player(playerName, playerAge));
        }
        addIPLTeam(teamName, players);
        System.out.println("IPL Team added successfully.");
    }

    private void updateIPLTeamFromInput() {
        System.out.print("Enter IPL team name to update: ");
        String teamName = scanner.next();
        List<Player> existingPlayers = getPlayersOfTeam(teamName);
        if (existingPlayers != null) {
            List<Player> updatedPlayers = new ArrayList<>();
            System.out.print("Enter number of updated players: ");
            int numPlayers = scanner.nextInt();
            scanner.nextLine(); // Consume newline
            for (int i = 0; i < numPlayers; i++) {
                System.out.print("Enter updated player " + (i + 1) + " name: ");
                String playerName = scanner.nextLine();
                System.out.print("Enter updated player " + (i + 1) + " age: ");
                int playerAge = scanner.nextInt();
                scanner.nextLine(); // Consume newline
                updatedPlayers.add(new Player(playerName, playerAge));
            }
            updateIPLTeam(teamName, updatedPlayers);
            System.out.println("IPL Team updated successfully.");
        } else {
            System.out.println("IPL Team not found with name " + teamName);
        }
    }

    private void deleteIPLTeamFromInput() {
        System.out.print("Enter IPL team name to delete: ");
        String teamName = scanner.next();
        List<Player> existingPlayers = getPlayersOfTeam(teamName);
        if (existingPlayers != null) {
            deleteIPLTeam(teamName);
            System.out.println("IPL Team deleted successfully.");
        } else {
            System.out.println("IPL Team not found with name " + teamName);
        }
    }
}
