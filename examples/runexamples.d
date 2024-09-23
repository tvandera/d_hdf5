#!/usr/bin/rdmd
import std.file;
import std.path;
import std.stdio;
import std.string;
import std.exception;
import std.process;

immutable auto examples = [

	"allocationtime": ["h5ex_d_alloc.h5",],
	"attribute": ["Attributes.h5",],
	"bitfields": ["h5ex_t_bit.h5",],
	"checksum": ["h5ex_d_checksum.h5",],
	"chunk": ["h5ex_d_chunk.h5",],
	"chunkread": ["SDSextendible.h5",],
	"complexdatatype": ["SDScompound.h5",],
	"complextypereadwrite": [],
	"creategroupdataset": ["group.h5",],
	"datasetrefs": ["REF_REG.h5",],
	"drivers": [],
	"dtransform": ["dtransform.h5",],
	"extendwrite": ["SDSextendible.h5",],
	"externallinks": [
		"hard_link.h5", "soft_link.h5",
		"extlink_prefix_source.h5", "extlink_target.h5", "extlink_source.h5",
	],
	"iterategroup": [],
	"messageshare": [],
	"myiterator": ["h5ex_t_string.h5",],
	"objrefs": ["refere.h5",],
	"read": ["SDS.h5",],
	"readwrite": [],
	"select": ["Select.h5",],
	"stringattributes": ["h5ex_t_stringatt.h5",],
	"strings": ["h5ex_t_string.h5",],
	"subset": [],
	"szip": [],
	"traits": ["test_aud.hdf5", "test.hdf5",],
	"traversefile": [],
	"traverseobjects": ["group.h5",],
	"unlimiteddataset": ["h5ex_d_unlimadd.h5",],
	"write": ["SDS.h5",],
];

void main(string[] args)
{
	foreach (example, inputs; examples)
	{
		// copy inputs
		foreach(input; inputs)
			copy(input, buildPath(example,input) );

		auto cmd = buildPath(".", example);
		auto ret = executeShell(cmd, null, Config.none, size_t.max, example);
		bool success = ret.status == 0;
		string status = success ? "SUCCESS" : "FAILED";
		writefln("%s: results: %s", example, status);
		if (!success)
			writefln("Output:\n%s", ret.output);

		// remove all
		foreach(f; globMatch(buildPath(example, "*.h5")))
				remove(f);
	}
}
