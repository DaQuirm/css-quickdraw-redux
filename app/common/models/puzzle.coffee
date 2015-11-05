mongoose = require 'mongoose'

PuzzleSchema = mongoose.Schema
	name: String
	html: String
	banned_characters: [String]
	selector: String

module.exports = mongoose.model 'Puzzle', PuzzleSchema