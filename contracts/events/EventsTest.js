const Events = artifacts.require("./events/Events.sol");

contract("EventsTest", (accounts) => {
  describe("addAddress", () => {
    it("emits AddressAdded event", async () => {
      events = await Events.new();
      const tx = await events.addAddress(accounts[0]);
      const [AddressAdded] = tx.logs;
      assert.notEqual(AddressAdded, undefined, "does not emit event");
      assert.equal(AddressAdded.event, "AddressAdded", "emitted event is not AddressAdded");
      assert.deepEqual(AddressAdded.args, { addr: accounts[0] }, "event args are incorrect");
    });
  });

  describe("removeAddress", () => {
    it("emits AddressRemoved event", async () => {
      events = await Events.new();
      await events.addAddress(accounts[0]);
      const tx = await events.removeAddress(accounts[0]);
      const [AddressRemoved] = tx.logs;
      assert.notEqual(AddressRemoved, undefined, "does not emit event");
      assert.equal(AddressRemoved.event, "AddressRemoved", "emitted event is not AddressRemoved");
      assert.deepEqual(AddressRemoved.args, { addr: accounts[0] }, "event args are incorrect");
    });
  });

  describe("airdrop", () => {
    it("emits Airdrop event", async () => {
      events = await Events.new();
      await events.addAddress(accounts[0]);
      await events.addAddress(accounts[1]);
      const tx = await events.airdrop(10**12);
      const [Airdrop] = tx.logs;
      assert.notEqual(Airdrop, undefined, "does not emit event");
      assert.equal(Airdrop.event, "Airdrop", "emitted event is not Airdrop");
      assert.deepEqual(Airdrop.args.value.toNumber(), 10**12, "event args.value is incorrect");
      assert.deepEqual(Airdrop.args.recipientsNum.toNumber(), 2, "event args.recipientsNum is incorrect");
    });
  });
});
