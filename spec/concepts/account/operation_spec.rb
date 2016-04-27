require 'spec_helper'

describe CRM::Account::Create do
  describe "create an account with valid parameters" do
    it "should create a new account given valid attributes" do
      op = CRM::Account::Create.(account: {name: 'Awesome!'})
      expect(op.model.name).to eq("Awesome!")
      expect(op.model.persisted?).to eq(true)
    end
  end

  describe "create an account with invalid parameters" do
    it "should raise Trailblazer::Operation::InvalidContract if name is missing" do
      expect{op = CRM::Account::Create.(account: {name: nil})}.to raise_error(Trailblazer::Operation::InvalidContract)
    end

    it "should raise a Trailblazer::Operation::InvalidContract on create if an account with the same name exists" do
      op1 = CRM::Account::Create.(account: {name: 'Awesome!'})
      expect{op2 = CRM::Account::Create.(account: {name: 'Awesome!'})}.to raise_error(Trailblazer::Operation::InvalidContract)
    end
  end

  describe "create an account with an address" do
    it "must create both the account and the address" do
      op = CRM::Account::Create.(account: {name: "Awesome!", shipping_address: {street1: "1 Orchard Rd", city: "Singapore"}})
      expect(op.model.persisted?).to be(true)
      expect(op.model.shipping_address.addressable_id).to eq(op.model.id)
    end
  end
end
