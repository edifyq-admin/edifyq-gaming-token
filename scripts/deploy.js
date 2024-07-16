
async function main() {
    const GamingToken = await ethers.getContractFactory("EdifyqGamingToken");

    const gamingToken = await GamingToken.deploy();
    console.log(`contract deployed at ${gamingToken.address}`);

    const EdifyqGamingVendor = await ethers.getContractFactory("EdifyqGamingVendor");

    const gamingVendor = await EdifyqGamingVendor.deploy(gamingToken.address);
    console.log(`vendor deployed at ${gamingVendor.address}`);

    await gamingToken.transfer(gamingVendor.address, 400000);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
