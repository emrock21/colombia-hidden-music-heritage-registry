// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Colombia Hidden Music Heritage Registry
/// @notice On-chain registry of real, lesser-known regional musical traditions from Colombia, with community voting.
/// @dev Country-specific: focused on Colombia's ancestral rhythms, instruments, and community-based musical identity.

contract ColombiaHiddenMusicHeritage {

    struct Rhythm {
        string region;          // e.g., Chocó, La Guajira, Montes de María
        string town;            // specific town or community
        string rhythmName;      // name of the rhythm, chant, or musical practice
        string mainInstrument;  // defining instrument (marimba, tambora, gaita, etc.)
        string culturalNote;    // brief factual context or tradition
        string whyItMatters;    // cultural significance
        address creator;
        uint256 likes;
        uint256 dislikes;
        uint256 createdAt;
    }

    Rhythm[] public rhythms;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event RhythmRecorded(uint256 indexed id, string rhythmName, string town, address indexed creator);
    event RhythmVoted(uint256 indexed id, bool like, uint256 likes, uint256 dislikes);

    constructor() {
        rhythms.push(
            Rhythm({
                region: "Choco",
                town: "Example Town",
                rhythmName: "Example Rhythm (replace with real entries)",
                mainInstrument: "example instrument",
                culturalNote: "This is an example entry to illustrate the format.",
                whyItMatters: "Real entries should describe musical and cultural relevance.",
                creator: address(0),
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );
    }

    /// @notice Record a new hidden regional rhythm from Colombia.
    function recordRhythm(
        string calldata region,
        string calldata town,
        string calldata rhythmName,
        string calldata mainInstrument,
        string calldata culturalNote,
        string calldata whyItMatters
    ) external {
        require(bytes(region).length > 0, "Region required");
        require(bytes(town).length > 0, "Town required");
        require(bytes(rhythmName).length > 0, "Rhythm name required");

        rhythms.push(
            Rhythm({
                region: region,
                town: town,
                rhythmName: rhythmName,
                mainInstrument: mainInstrument,
                culturalNote: culturalNote,
                whyItMatters: whyItMatters,
                creator: msg.sender,
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );

        emit RhythmRecorded(rhythms.length - 1, rhythmName, town, msg.sender);
    }

    /// @notice Vote on whether a recorded rhythm is culturally relevant or useful.
    function voteRhythm(uint256 id, bool like) external {
        require(id < rhythms.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Rhythm storage r = rhythms[id];

        if (like) {
            r.likes += 1;
        } else {
            r.dislikes += 1;
        }

        emit RhythmVoted(id, like, r.likes, r.dislikes);
    }

    /// @notice Returns the total number of recorded rhythms.
    function totalRhythms() external view returns (uint256) {
        return rhythms.length;
    }
}
