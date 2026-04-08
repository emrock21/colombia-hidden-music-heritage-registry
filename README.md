# Colombia Hidden Music Heritage Registry

On-chain registry of real, lesser-known ancestral rhythms, chants, and musical traditions from Colombia.

This contract focuses on musical expressions that are culturally significant but not mainstream or globally commercialized, such as:

- Afro-Pacific marimba traditions  
- Indigenous gaita and flute ensembles  
- Ancestral chants and ceremonial songs  
- Riverbank drum rhythms  
- Community-based musical practices  

Each entry is tied to a specific Colombian region and town, emphasizing cultural context rather than generic music categories.

---

## Why a country-specific contract?

Colombia has one of the most diverse musical identities in the world.  
Many of its most meaningful rhythms are:

- Known primarily by local communities  
- Linked to specific Afro-descendant, Indigenous, or rural traditions  
- Important for cultural memory, spirituality, and identity  

A global “music registry” would dilute this context.  
This registry is explicitly designed for Colombia’s ancestral musical heritage.

---

## Contract

Deployed on Base:  
`0x9d1094e8e4553af62ea4d39809dbb243611cc427`  
🔗 https://basescan.org/address/0x9d1094e8e4553af62ea4d39809dbb243611cc427#code

---

## Data model

Each recorded rhythm includes:

- `region` – e.g., Chocó, Bolívar, Magdalena  
- `town` – specific locality where the rhythm originates  
- `rhythmName` – name of the rhythm or musical practice  
- `mainInstrument` – defining instrument  
- `culturalNote` – brief factual context  
- `whyItMatters` – explanation of cultural significance  
- `likes` / `dislikes` – community voting on relevance and usefulness  

---

## Example entries (conceptual)

These are examples of the kind of rhythms this registry is meant to capture:

- A marimba-based Afro-Pacific rhythm used in community rituals  
- A women-led ancestral chant from Palenque  
- A riverbank drum tradition tied to fishing communities  
- An Indigenous flute ensemble preserved through oral transmission  

Frontends and communities are responsible for ensuring that entries are real and culturally meaningful.

---

## Contract interface

Main functions:

solidity
recordRhythm(
  string region,
  string town,
  string rhythmName,
  string mainInstrument,
  string culturalNote,
  string whyItMatters
);

voteRhythm(uint256 id, bool like);

totalRhythms();

---

## Conclusion

This contract provides a country-specific, culturally grounded registry for Colombia.
It is not a generic music list, but a curated log of ancestral rhythms that matter to the cultural memory and identity of the nation, with community voting to highlight what truly deserves to be remembered.
