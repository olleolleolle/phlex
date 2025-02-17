# frozen_string_literal: true

describe Phlex::Helpers do
	include Phlex::Helpers

	it "supports string concatination" do
		output = mix({ class: "foo" }, { class: "bar" })
		expect(output).to be == { class: "foo bar" }
	end

	it "supports string override" do
		output = mix({ class: "foo" }, { class!: "bar" })
		expect(output).to be == { class: "bar" }
	end

	it "supports array concatination" do
		output = mix({ class: ["foo"] }, { class: ["bar"] })
		expect(output).to be == { class: ["foo", "bar"] }
	end

	it "supports array override" do
		output = mix({ class: ["foo"] }, { class!: ["bar"] })
		expect(output).to be == { class: ["bar"] }
	end

	it "supports hash concatination" do
		output = mix(
			{ data: { controller: "foo" } },
			{ data: { controller: "bar" } }
		)

		expect(output).to be == { data: { controller: "foo bar" } }
	end

	it "supports hash override" do
		output = mix(
			{ data: { controller: "foo" } },
			{ data!: { controller: "bar" } }
		)

		expect(output).to be == { data: { controller: "bar" } }
	end
end
