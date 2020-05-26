const db = require("../data/db-config.js");

module.exports = {
	find,
	findById,
	findSteps,
	addStep,
	add,
	update,
	remove
}

function find(id) {
	return db("schemes")
}

function findById(id) {
	return db("schemes")
		.where({ id })
		.first();
}

function findSteps(id) {
	return db("steps")
		.orderBy("steps.step_number")
		.join("schemes", "steps.scheme_id", "schemes.id")
		.where("schemes.id", id)
}

function addStep(stepData, id) {
	return db("steps")
		.insert(stepData, "id")
}

function add(data) {
	return db("schemes")
		.insert(data, "id")
		.then(newid => {
			const [id] = newid;
			return findById(id);
		});
}

function update(changes, id) {
	return db("schemes")
		.where({ id })
		.update(changes)
		.then(ct => {
			return findById(id);
		});
}

function remove(id) {
	const del = findById(id)
		.then(delled => delled)
	return db("schemes")
		.where({ id })
		.delete()
		.then(ct => {
			return del;
		});
}