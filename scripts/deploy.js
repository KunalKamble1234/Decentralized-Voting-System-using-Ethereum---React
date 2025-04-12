const hre = require("hardhat");

async function main() {
  const Voting = await hre.ethers.getContractFactory("Voting");
  const voting = await Voting.deploy();

  await voting.waitForDeployment();
  console.log(`Voting contract deployed to: ${voting.target}`);

  // 👇 Add candidates here after deployment
  await voting.addCandidate("Alice");
  await voting.addCandidate("Bob");
  await voting.addCandidate("Charlie");

  console.log("Candidates added.");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
