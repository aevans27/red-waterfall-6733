require "rails_helper"

RSpec.describe Member do
  it "exists" do
    attrs = {
      name: "test",
      photoUrl: "test.url",
      allies: ["test", "test2", "test3"],
      enemies: ["test4", "test5", "test6"],
      affiliation: "simple"
    }

    member = Member.new(attrs)
    
    expect(member).to be_a Member
    expect(member.name).to eq("test")
    expect(member.photoUrl).to eq("test.url")
    expect(member.allies).to eq(["test", "test2", "test3"])
    expect(member.enemies).to eq(["test4", "test5", "test6"])
    expect(member.affiliation).to eq("simple")
  end
end