# 🗳️ Decentralized Voting DApp

A simple yet powerful decentralized voting system built using **Ethereum blockchain**, **Solidity**, **Hardhat**, and **React**. This project ensures secure, tamper-proof voting by storing all votes on the blockchain. It includes features like **voter registration**, **one-vote-per-voter enforcement**, and **live vote counts**.

---

## ⚙️ Tech Stack

- **Solidity** – Smart contract development
- **Hardhat** – Ethereum development environment
- **React.js** – Frontend framework
- **Ethers.js** – Ethereum wallet interaction
- **MetaMask** – Wallet integration

---

## ✨ Features

- 📜 Add candidates (owner-only)
- 👤 Register voters (owner-only)
- 🗳️ One vote per registered address
- 🔒 Prevent double voting
- 🔍 Real-time vote count display
- 🔌 MetaMask wallet connection

---

## 🚀 Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/your-username/voting-dapp.git
cd voting-dapp

### 2. Install dependencies

```bash
npm install
cd smart-contract
npm install

### 3. Start the Hardhat local blockchain

```bash
npx hardhat node

### 4. Deploy the smart contract

```bash
cd smart-contract
npx hardhat run scripts/deploy.js --network localhost

### 5. Update frontend with contract address
In src/App.js, replace the CONTRACT_ADDRESS with your deployed contract address:

```bash
const CONTRACT_ADDRESS = "YOUR_DEPLOYED_CONTRACT_ADDRESS";

### 6. Run the frontend React app

```bash
npm start

### 🧪 Testing the Contract

```bash
npx hardhat test


🤝 Contributing
We welcome contributions! Here’s how to get started:

🍴 Fork the repo

🛠️ Create a new branch (git checkout -b feature/YourFeature)

✅ Make your changes and commit (git commit -m "Add feature")

🚀 Push to your branch (git push origin feature/YourFeature)

🔃 Open a Pull Request