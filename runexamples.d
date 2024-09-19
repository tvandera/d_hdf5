#!/usr/bin/rdmd
import std.file;
import std.path;
import std.stdio;
import std.string;
import std.exception;
import std.process;

void main(string[] args)
{
	chdir("data");

	foreach (entry; dirEntries("../build", SpanMode.breadth))
	{
		if ((entry.isDir) || (entry.name.baseName.indexOf(".") != -1))
			continue;

		auto ret = executeShell(entry);
		string status = (ret.status == 0) ? "SUCCESS" : "FAILED";
		writefln("%s: results: %s", entry, status);
	}
	chdir("..");
}
