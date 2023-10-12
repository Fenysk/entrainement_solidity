// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract VoteDemocratique {
    
    // On défini la structure du candidat
    struct Candidate {
        string name;
        uint voteCount;
    }

    // On crée un tableau de candidats
    Candidate[] public candidates;

    // On crée un mapping pour savoir si un compte a déjà voté
    mapping(address => bool) public hasVoted;

    // On crée un événement pour notifier d'un vote
    event Vote(address indexed voter, uint candidateIndex);

    // On crée un constructeur pour initialiser les candidats
    constructor() {
        candidates.push( Candidate({
                name: "MarineLepen",
                voteCount: 0
        }));

        candidates.push( Candidate({
                name: "JeanLucMelenchon",
                voteCount: 0
        }));
    }

    // Fonction pour voter
    function vote(uint candidateIndex) public {
        require(candidateIndex < candidates.length, "Invalid candidate");
        require(!hasVoted[msg.sender], "You already voted");

        candidates[candidateIndex].voteCount++;
        hasVoted[msg.sender] = true;
        emit Vote(msg.sender, candidateIndex);
    }
    
    // Fonction pour récupérer le nombre de votes d'un candidat
    function getVoteCount(uint candidateIndex) public view returns (uint) {
        require(candidateIndex < candidates.length,  "Invalid candidate");
        return candidates[candidateIndex].voteCount;
    }
    
}
