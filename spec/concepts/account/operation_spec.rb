require 'spec_helper'

describe CRM::Account::Create do
  describe "create an account with valid parameters" do
    it "should create a new account given valid attributes" do
      op = CRM::Account::Create.(account: {name: 'Awesome!', rating: 4})
      op.model.name.should eq("Awesome!")
      op.model.persisted?.should eq(true)
    end
  end

  describe "create an account with invalid parameters" do
    it "should raise Trailblazer::Operation::InvalidContract if name is missing" do
      expect{op = CRM::Account::Create.(account: {name: nil})}.to raise_error(Trailblazer::Operation::InvalidContract)
    end

    it "should raise a Trailblazer::Opration::InvalidContract on create if an account with the same name exists" do
        op1 = CRM::Account::Create.(account: {name: 'Awesome!'})
        expect{op2 = CRM::Account::Create.(account: {name: 'Awesome!'})}.to raise_error(Trailblazer::Operation::InvalidContract)
    end
  end

  describe "create an account with an address" do
    it "must create both the account and the address" do
      op = CRM::Account::Create.(account: {name: "Awesome!", shipping_address: {street1: "1 Orchard Rd", city: "Singapore"}})
      op.model.persisted?.should be(true)
      op.model.shipping_address.addressable_id.should equal(op.model.id)
    end
  end
end
