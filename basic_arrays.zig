const std = @import("std");

pub fn main() !void {
    var page_allocator = std.heap.page_allocator;
    var list = std.ArrayList(i32).init(page_allocator);
    defer list.deinit();
    try list.append(42);

    var c_allocator = std.heap.c_allocator;
    var list2 = std.ArrayList(i32).init(c_allocator);
    defer list2.deinit();
    try list2.append(32);
}
