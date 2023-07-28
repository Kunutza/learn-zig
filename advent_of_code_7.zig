const std = @import("std");

// If this does not work check out vector.zig & tuple.zig
// could also use array of structs

// If that also does not work check out Readers Writers & Formatting

const Tuple = std.meta.Tuple;

const Directory = struct { name: []const u8 };

pub fn main() !void {
    var myTuple: Tuple(&.{[]const u8}) = .{"Hello!"};
    _ = myTuple;
    var home: Directory = Directory{ .name = "home" };
    _ = home;
}
