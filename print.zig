const std = @import("std");
const io = @import("io.zig");

var stderr_mutex = std.Thread.Mutex{};

// print("", .{});
pub fn print(comptime fmt: []const u8, args: anytype) void {
    stderr_mutex.lock();
    defer stderr_mutex.unlock();
    const stderr = io.getStdErr().writer();
    nosuspend stderr.print(fmt, args) catch return;
}
